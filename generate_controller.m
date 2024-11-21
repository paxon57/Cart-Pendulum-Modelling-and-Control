clear;

[A, B, C, D] = linmod('model_lin');

sys = ss(A,B,C,D);

Sc = ctrb(A,B);
So = obsv(A,C);

Q = [10 0 0 0;
    0 0 0 0;
    0 0 10 0;
    0 0 0 0];
R = 1;

K = lqr(sys, Q, R);
P = [-1 -2 -3 -4];

%K = place(A, B, P);