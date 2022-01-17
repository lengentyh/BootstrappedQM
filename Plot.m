%% QM1 (fall,2021) HW2 problem 1

%% Load data
load determinant.mat


%% Real procedure
hold on

% the determiant
for i = 1:k
    plot(Ewin,cond(:,i))
end

hold off

axis([Emin Emax 0 1])
xticks([Emin:0.5:Emax]);
