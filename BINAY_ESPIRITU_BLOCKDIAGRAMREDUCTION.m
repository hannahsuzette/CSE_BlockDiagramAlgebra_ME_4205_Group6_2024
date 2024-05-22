%Clear
clear
clc
close all

%% Block Diagram Algebra
% Transfer Function
G1_num = [1];
G1_den = [1 0 0];

G2_num = [1];
G2_den = [1 1];

G3_num = [1];
G3_den = [1 0];

G4_num = [1];
G4_den = [2 0];

H1_num = [1];
H1_den = [1 0];

H2_num = [1];
H2_den = [1 -1];

H3_num = [1];
H3_den = [1 -2];

%% BLOCK REDUCTION
% Solving for G_1

G3G4_num = conv(G3_num, G4_num)
G3G4_den = conv(G3_den, G4_den)

% Solving for GH_1

GH_1_num = conv(G3G4_num, H3_num)
GH_1_den = conv(G3G4_den, H3_den)

GH_1_num_sum = [2 -4 0 1]

%% Reduction 1 (Close loop) = [(G3G4)/((1+G3G4)(H3))]

Red_1_num = conv(G3G4_num, GH_1_den)
Red_1_den = conv(G3G4_den, GH_1_num_sum)

%% Reduction 2 (Close loop) = [(G2Red_1)/((1+G2Red_1)(H2/G4))]

% Solving for G_2

G2Red1_num = conv(G2_num, Red_1_num)
G2Red1_den = conv(G2_den, Red_1_den)

% Solving for H2/G4

H2G4_num = conv(H2_num, G4_den)
H2G4_den = conv(H2_den, G4_num)

% Solving for GH_2

GH_2_num = conv(G2Red1_num, H2G4_num)
GH_2_den = conv(G2Red1_den, H2G4_den)

GH_2_num_sum = [4 -8 -4 14 -8 -2 0 0]

%Solving for the Reduction 2 function

Red_2_num = conv(G2Red1_num, GH_2_den)
Red_2_den = conv(G2Red1_den, GH_2_num_sum)

%% Block Reduction 3

G1Red_3_num = conv(G1_num, Red_2_num)
G1Red_3_den = conv(G1_den, Red_2_den)

GH_3_num = conv(G1Red_3_num, H1_num)
GH_3_den = conv(G1Red_3_den, H1_den)

GH_3_num_sum = [16 -48 -16 144 -64 -112 100 -4 4 32 40 -4 8 0 0 0 0]

Red_3_num = conv(G1Red_3_num, GH_3_den)
Red_3_den = conv(G1Red_3_den, GH_3_num_sum)