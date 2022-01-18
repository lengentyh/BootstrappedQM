%% QM1 (fall,2021) HW2 problem 1

%% Load data
load determinant.mat


%% Real procedure
hold on
% the determiant
for i = 1:k
    if mod(i,10) == 0
        %plot(log(-Ewin),cond(:,i))
        plot(Ewin,k*cond(:,i))
    end
end
%legend('K=10','K=20','K=30','Location','eastoutside')
%axis([Emin Emax 0 1])
%xticks([Emin:0.05:Emax]);
hold off

%% find the spectrum island for each principle minor
cond      = double(cond);
land      = cell(k,1);
land_edge = cell(k,1);
land_size = cell(k,1); 
for i = 1:k
    %% find the land
    land{i}          = find(cond(:,i));
    %% find the land edge
    land_edge_id     = find(ischange(100*cond(:,i)));
    land_edge{i}     = land_edge_id;
    %% find the land size
    if mod(length(land_edge_id),2)
        land_size{i} = [land_edge_id(2:2:end),length(cond(:,i))+1] - ...
                       land_edge_id(1:2:end);
    else
        land_size{i} = land_edge_id(2:2:end) - land_edge_id(1:2:end);
    end
end

hold on
for i = 1:k
    plot(Ewin(land{i}),i*ones(length(Ewin(land{i})),1),'b.')
end
hold off
