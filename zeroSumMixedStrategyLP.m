clear all; close all; clc; 

A = [4 3 1 4; 2 5 6 3; 1 0 7 0]; 
% A = [0 5 -2; -3 0 4; 6 -4 0]; 
% A = [6 8 3 1 6; 4 2 6 3 5; 2 4 6 4 1; 1 3 2 5 3]; 

% A = -A'; 

n = size(A,1); 
m = size(A,2); 

totalMaxVal = max(max(abs(A))); 

% compute the first LP 
f = [zeros(n,1); -1]; 
C = [-A' ones(m, 1)]; 
b = [zeros(m, 1)]; 
lb = [zeros(n, 1); -totalMaxVal]; 
ub = [ones(n, 1); totalMaxVal]; 
ub = [];
Ceq = [ones(1, n) 0];
beq = 1;

% solve the LP 
disp('starting to solve the lp . . . ')
[x,fval,exitflag,output] = linprog(f,C,b,Ceq,beq,lb,ub);

% the solution 
disp('The solution  . . . '); 
assert(length(x) == n + 1)
x(1:n)
v = x(n+1)

