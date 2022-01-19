%% QM1 (fall,2021) HW2 problem 1

%% Load data
load determinant.mat

hold on
% the determiant
for i = 1:k
    if i == 10
        %p1 = plot(log(-Ewin),k*cond(:,i));
        %p1 = plot(Ewin,k*cond(:,i));
    elseif i == 20
        %p2 = plot(log(-Ewin),k*cond(:,i),'g');
        %p2 = plot(Ewin,k*cond(:,i),'g');
    elseif i == 30
        %p3 = plot(log(-Ewin),k*cond(:,i));
        %p3 = plot(Ewin,k*cond(:,i));
    end
end
%legend([p1,p2,p3],{'K=10','K=20','K=30'},'Location','eastoutside')
%axis([Emin Emax 0 1])
%xticks([-10:0.5:-2]);
xticks([Emin:0.005:Emax]);

xline(-0.5/4);
xline(-0.5/9);
xline(-0.5/16);
xline(-0.5/25);
xline(-0.5/36);
xline(-0.5/49);

hold off

%% Real procedure
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
    %plot(log(-Ewin(land{i})),i*ones(length(Ewin(land{i})),1),'b.')
    plot(Ewin(land{i}),i*ones(length(Ewin(land{i})),1),'b.')
end
hold off
