%% QM1 (fall,2021) final project

%% Input
wcal = ReadInput('input.txt');

Emin = wcal.Emin;    % lower bound of the energy window
Emax = wcal.Emax;    % upper bound of the energy window
dE   = wcal.dE;      % energy difference for each scanning step 
l    = wcal.l;       % orbital angular momentum
k    = wcal.k;       % size of the moment matrix
digt = wcal.digt;    % numerical precision
np   = wcal.ncpu;    % number of cpus for parallel computation

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
cond = int8(zeros(nE,k));

%% Open the parallel pool
c = parcluster('local');
c.NumWorkers = np;
parpool(c, c.NumWorkers);

% pool=parpool('local');
% pool.IdleTimeout=1800; %minutes

%% Real procedure
tic
fprintf('Start scanning ... \n')
parfor e = 1:nE
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
for i = 1:k
    cond(find(sum(detM,2)>=i),i) = 1;
end

toc
fprintf('End scanning. \n')

save determinant.mat cond Ewin Emin Emax k

%% close the parallel pool
poolobj = gcp('nocreate');
delete(poolobj);
