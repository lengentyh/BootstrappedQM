# 🧭 BootstrappedQM

[Final project](./QM_Final_Project.pdf) of QM 1 course at NTU, Taipei during fall 2021, in which the spectrum of **spinless Hydrogen electron** is solved through bootstrap method.

## 📜 [The_Report](./QM1_Final_Project_BootstrapQM.pdf)

## ⚖️ [LICENSE](./LICENSE)

## 🔰 Getting Started

0️⃣ Prepare the inputs in 'input.txt'.

```txt
Bootstrap

wcal.Emin   = -14    % lower bound of the energy window
wcal.Emax   = 0      % upper bound of the energy window
wcal.dE     = 0.001  % energy difference for each scanning step
wcal.l      = 1      % orbital angular momentum
wcal.k      = 20     % size of the moment matrix
wcal.digt   = 32     % numerical precision
wcal.ncpu   = 6      % number of cpus for parallel computation

endBootstrap
```

1️⃣ Write the chosen input file in 'main.m'.

```Matlab
%% Input
wcal = ReadInput('input.txt');
```

2️⃣ Run 'main.m' to scan the spectrum.

```Matlab
>> main.m
```

3️⃣ Write the chosen data file in 'Plot.m'.

```Matlab
%% Load data
load determinant.mat
```

4️⃣ Run 'Plot.m' to see the results.

```Matlab
>> Plot.m
```

## 🏁 Examples

To repeat the implementation results in the paper, plese use the input.txt in the folder [inputs](./inputs) and the corresponding .mat file in the folder [results](./results). Still, one should adjust the graph in 'Plot.m' by himself/herself.

## 📓 [References](./references)
