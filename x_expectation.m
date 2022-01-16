function x_exp = x_expectation(E,maxorder,l,digt)
%% QM1 (fall, 2021) final project
%% 'x_exp' is an array of position moments
%% 'maxorder' is the maximum exponent of the position moment in 'x_exp'
%% l is the orbital angular momentum

    digitsOld = digits(digt);

    x_exp     = vpa(zeros(maxorder+2,1));
    for m = -1:1:maxorder
        switch m
        case -1
            x_exp(m+2) = -2*E;
        case 0
            x_exp(m+2) = 1;
        otherwise
            x_exp(m+2) = (-1/(8*(m+1)*E))* ... 
                         ( m*((m+1)*(m-1)-4*l*(l+1))*x_exp(m) + ...
                           4*(2*m+1)*x_exp(m+1) );
        end
    end
end
