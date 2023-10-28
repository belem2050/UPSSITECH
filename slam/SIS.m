function [X_ki, w_ki] = SIS(N1, T, Z, F, Hfull, mX0, PX0, Qw, Rv, X, N)
    

    %% creation cellules
    % Particules et poids associé
    X_ki = cell(N,N1);
    w_ki = cell(N,N1);

    % Vecteur d'état et coviariance estimé pour les instants 1 à N1.
    X_ki = cell(1,N1);
   
    %% SIS Algorithm
    for k=1:N1
        if k==1
            % Initialisation 1
            for i=1:N
                X_ki_Particules{i,1} = mX0 + chol(PX0)' * randn(6,1);
                w_ki{i,1} = 1/N;
            end
        else %4
            for i=1:N
                % 6
                X_ki{i,k} = F * X_ki{i,k-1} + chol(Qw)' * rand(6,1);


                % 7

                % deux ameres visibles
                if (~isnan(Z(1,k)) && ~isnan(Z(3,k)))
                    H = Hfull;
                    w_ki{i,k} = w_ki{i,k-1} * exp(-1/2 * (Z(:,k) - H*X_ki{i,k})' * inv(Rv)  * (Z(:,k) - H*X_ki{i,k}));
                % Ameres A1 visible
                elseif (~isnan(Z(1,k)) && isnan(Z(3,k)))
                    H = Hfull(1:2,:); 
                    w_ki{i,k} = w_ki{i,k-1} * exp(-1/2 * (Z(1:2,k) - H*X_ki{i,k})' * inv(Rv(1:2,1:2))  * (Z(1:2,k) - H*X_ki{i,k}));               
                % Ameres A2 visible
                elseif (isnan(Z(1,k)) && ~isnan(Z(3,k)))
                    H = Hfull(3:4,:);
                    w_ki{i,k} = w_ki{i,k-1} * exp(-1/2 * (Z(3:4,k) - H*X_ki{i,k})' * inv(Rv(3:4,3:4))  * (Z(3:4,k) - H*X_ki{i,k}));
                % Aucune amere visible
                else
                    H = nan;
                    w_ki{i,k} = w_ki{i,k-1};
                end
            end

            % 9
            w_ki_sommation = sum([w_ki{:,k}]);
            for i=1:N
                w_ki{i,k} = w_ki{i,k} / w_ki_sommation;
            end
        end

    end
end

