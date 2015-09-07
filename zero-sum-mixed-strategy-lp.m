clear all; close all; clc; 

A = [4 3 1 4; 2 5 6 3; 1 0 7 0]; 
% A = [0 5 -2; -3 0 4; 6 -4 0]; 
% A = [6 8 3 1 6; 4 2 6 3 5; 2 4 6 4 1; 1 3 2 5 3]; 

n = size(A,1); 
m = size(A,2); 

% compute the first LP 
f = [zeroes(n), zeroes(n,1); zeroes(1, n) ones(1,1)]; 
C = [-A'  ones(m, 1); ones(1, n) 0]; 
b = [zeros(m, 1); 1]; 
lb = 0 
ub = []

% solve the LP 
x = linprog(f,C,b,Ceq,beq,lb, ub) 

% the solution 
assert(length(x) == n + 1)
x(1:n)
