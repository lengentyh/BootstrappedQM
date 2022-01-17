# BootstrappedQM

Final project of QM 1 course at NTU during fall 2021, in which the spectrum of spinless Hydrogen electron is solved through bootstrap method.

## Getting Started

(1.) Prepare the inputs in 'main.m'

```Matlab
%% Input
Emin = -14;   % lower bound of the energy window
Emax = 0;     % upper bound of the energy window
dE   = 0.001; % number of sample points inside the energy window
l    = 1;    % orbital angular momentum
k    = 20;   % size of the moment matrix
digt = 32;   % numerical precision used
np   = 6;    % number of cpus for parallel computation
```

(2.) run 'main.m'

```Matlab
>> main.m
```

(3.) run 'Plot.m' to see the results

```Matlab
>. Plot.m
```
