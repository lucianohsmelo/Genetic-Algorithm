A = [0 1;0 -1];
B = [0;1];
C = [1 0;0 1];
Q = [1 0;0 1];
R = [1];


syms P11 P12 P21 P22

P = [P11 P12;P21 P22];
P = [2.1360 1.0121;1.3429 0.6500]
G = A'*P+P*A-P*B*(R^-1)*B'*P+Q
G = ss(A,B,K,0)
