clc
clear all
close all

nbfreq = 10;
w = linspace(0.1, 1, nbfreq);
dir = 0;
depth = 0;
[A,B,Fe] = Nemoh(w,dir,depth);
save('Nemohresult_test', 'A', 'B', 'Fe', 'w');