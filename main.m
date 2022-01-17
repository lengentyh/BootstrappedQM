%% QM1 (fall,2021) final project

%% Input
Emin = -14;
Emax = 0;
dE   = 0.001; % number of sample points inside the energy window
l    = 1;    % orbital angular momentum
k    = 20;   % size of the principle minor
digt = 32;   % numerical precision
np   = 6;    % number of cpus for parallel computation

if Emin > Emax
    fprintf('Emin must <= Emax !!! \n')
    return
end
    
if floor(l) ~= l 
    fprintf('orbital angular momentum must be an integer !!! \n')
    return
end

if l < 0
    fprintf('orbital angular momentum must > 0 !!! \n')
    return
end

%% Initialization
Ewin = Emin:dE:Emax;
nE   = length(Ewin);
detM = int8(zeros(nE,k));
cond = int8(zeros(nE,1));

%% Open the parallel pool
c = parcluster('local');
c.NumWorkers = np;
parpool(c, c.NumWorkers);

% pool=parpool('local');
% pool.IdleTimeout=1800; %minutes

%% Real procedure
tic
fprintf('Start scanning ... \n')
parfor e = 1:nE % can use parallel computation to accelerate
    M                  = exp_M(Ewin(e),k,l,digt);
    M_rescale          = M;
    M_rescale(:,1:end) = M_rescale(:,1:end)./M(:,1);
    M_rescale(1:end,:) = M_rescale(1:end,:)./M(1,:);

    for i = 1:k % distinguish the positivity of all principle minor
        detM(e,i)      = int8(sign(det(M_rescale(1:i,1:i))));
        % throw away the energies that do not preserve the positivity
        if detM(e,i)<0 
            break
        end
    end
end
% find the energy levels that have all the priciple minors being positive-definite
cond(find(sum(detM,2)==k)) = 1;

toc
fprintf('End scanning. \n')

save determinant.mat cond Ewin Emin Emax

% %% close the parallel pool
% poolobj = gcp('nocreate');
% delete(poolobj);