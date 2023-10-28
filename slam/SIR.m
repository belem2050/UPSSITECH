function [X_estime, W_estime, P] = SIR(N,T,Z,F,Hfull,mX0,PX0,Qw,Rv,X, nbParticules, Ns)
   
    X_estime_Particules = cell(nbParticules,N);
    w_SIR = cell(nbParticules,N);

    % Vecteur d'état et coviariance estimé pour les instants 1 à N.
    X_estime = cell(1,N);
    P = cell(1,N);
    
    Q = Qw;
   
    %% SIS Algorithm
    for k=1:N
        if k==1
            % Initialisation
            for i=1:nbParticules
                X_estime_Particules{i,1} = mX0 + chol(PX0)' * randn(6,1);
                w_SIR{i,1} = 1/nbParticules;
            end
        else
            for i=1:nbParticules
                % Propagate the particule X_k-1^i
                X_estime_Particules{i,k} = F * X_estime_Particules{i,k-1} + chol(Qw)' * rand(6,1);
               

                % Update the corresponding weight w_k^i

                % Ameres A1 et A2 visibles
                if (~isnan(Z(1,k)) && ~isnan(Z(3,k)))
                    H = Hfull;
                    w_SIR{i,k} = w_SIR{i,k-1} * exp(-1/2 * (Z(:,k) - H*X_estime_Particules{i,k})' / (Rv)  * (Z(:,k) - H*X_estime_Particules{i,k}));

                    
                % Ameres A1 visible
                elseif (~isnan(Z(1,k)) && isnan(Z(3,k)))
                    H = Hfull(1:2,:); 
                    w_SIR{i,k} = w_SIR{i,k-1} * exp(-1/2 * (Z(1:2,k) - H*X_estime_Particules{i,k})' / (Rv(1:2,1:2))  * (Z(1:2,k) - H*X_estime_Particules{i,k}));    
                                                     
                % Ameres A2 visible
                elseif (isnan(Z(1,k)) && ~isnan(Z(3,k)))
                    H = Hfull(3:4,:);
                    w_SIR{i,k} = w_SIR{i,k-1} * exp(-1/2 * (Z(3:4,k) - H*X_estime_Particules{i,k})' / (Rv(3:4,3:4))  * (Z(3:4,k) - H*X_estime_Particules{i,k}));
                    
                % Aucune amere visible
                else                  
                    H = nan;
                    w_SIR{i,k} = w_SIR{i,k-1};
                end
                
            end

            % Normalize the importance weight by setting
            w_SIS_sum = sum([w_SIR{:,k}]);
            for i=1:nbParticules
                w_SIR{i,k} = w_SIR{i,k} / w_SIS_sum;
            end
        end


        %% Stockage de l'estimation
        X_estime{1,k} = zeros(6,1);
        P{1,k} = zeros(6,6);

        % Vecteur d'état estimé
        for i=1:nbParticules
            X_estime{1,k} = X_estime{1,k} + w_SIR{i,k} * X_estime_Particules{i,k};
        end

        % Covariance
        for i=1:nbParticules
            P{1,k} = P{1,k} + w_SIR{i,k} * (X_estime_Particules{i,k} - X_estime{1,k}) * (X_estime_Particules{i,k} - X_estime{1,k})';
        end      
        
        %% RESAMPLING
        w_SIR_som2 = 0;
        for i=1:nbParticules
            w_SIR_som2 = w_SIR_som2 + w_SIR{i,k}^2;
        end
        
        Neff = 1 / w_SIR_som2;
        
        if Neff < Ns
            c = cell(nbParticules,1);
            u = cell(nbParticules,1);

            c{1,1} = w_SIR{1,k};

            for i=2:nbParticules
                c{i,1} = c{i-1,1} + w_SIR{i,k};
            end

            i = 1;
            u{1,1} = rand()*nbParticules^-1;


            for j=1:nbParticules
                u{j,1} = u{1,1} + (j-1)*nbParticules^-1;
                
                while u{j,1} > c{i,1}
                   i = i+1;
                end

                X_estime_Particules{j,k} = X_estime_Particules{i,k};
                w_SIR{j,k} = nbParticules^-1;

            end
        end
    end
end

