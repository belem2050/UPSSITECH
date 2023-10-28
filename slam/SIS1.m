function [Xestime, Westime, P] = SIS(N, T, Z, F, Hfull, mX0, PX0, Qw, Rv, X, nbParticules)
    
    % Vecteur d'état et coviariance estimé pour les instants 1 à N.
    Xestime = cell(1,N);
    P_SIS = cell(1,N);

    %% SIS 
    for k=1:N
        if k==1
            % 1
            for i=1:nbParticules
                X_ki{i,1} = mX0 + chol(PX0)' * randn(6,1);
                Westime{i,1} = 1/nbParticules;
            end
        else
            for i=1:nbParticules
                % 
                X_ki{i,k} = F * X_ki{i,k-1} + chol(Qw)' * rand(6,1);


                % 7

                % Ameres A1 et A2 visibles
                if (~isnan(Z(1,k)) && ~isnan(Z(3,k)))
                    H = Hfull;
                    Westime{i,k} = Westime{i,k-1} * exp(-1/2 * (Z(:,k) - H*X_ki{i,k})' * inv(Rv)  * (Z(:,k) - H*X_ki{i,k}));
                % Ameres A1 visible
                elseif (~isnan(Z(1,k)) && isnan(Z(3,k)))
                    H = Hfull(1:2,:); 
                    Westime{i,k} = Westime{i,k-1} * exp(-1/2 * (Z(1:2,k) - H*X_ki{i,k})' * inv(Rv(1:2,1:2))  * (Z(1:2,k) - H*X_ki{i,k}));               
                % Ameres A2 visible
                elseif (isnan(Z(1,k)) && ~isnan(Z(3,k)))
                    H = Hfull(3:4,:);
                    Westime{i,k} = Westime{i,k-1} * exp(-1/2 * (Z(3:4,k) - H*X_ki{i,k})' * inv(Rv(3:4,3:4))  * (Z(3:4,k) - H*X_ki{i,k}));
                % Aucune amere visible
                else
                    H = nan;
                    Westime{i,k} = Westime{i,k-1};
                end
            end

            % 9
            Westime_sum = sum([Westime{:,k}]);
            for i=1:nbParticules
                Westime{i,k} = Westime{i,k} / Westime_sum;
                if(Westime{i,k} < 1e-10)
                    Westime{i,k} = 0;
                end
            end
        end


        %% Stockage de l'estimation
        Xestime{1,k} = zeros(6,1);
        P{1,k} = zeros(6,6);

        % Vecteur d'état estimé
        for i=1:nbParticules
            Xestime{1,k} = Xestime{1,k} + Westime{i,k} * X_ki{i,k};
        end

        %P
        for i=1:nbParticules
            P{1,k} = P{1,k} + Westime{i,k} * (X_ki{i,k} - Xestime{1,k}) * (X_ki{i,k} - Xestime{1,k})';
        end      

    end
end

