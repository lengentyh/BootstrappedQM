function M = exp_M(E,k,l,digt)
    %% QM1 (fall, 2021) final project
    %% construct the moment matrix
    %% k is the size of the principle minor
    %% l is the orbital angular momentum
        
    digitsOld = digits(digt);
    
    x_exp     = x_expectation(E,2*(k-1),l,digt);
    M         = vpa(zeros(k));
    for i = 0:(k-1)
        M(i+1,1:k) = x_exp([0:(k-1)]+(i+1));
    end
end