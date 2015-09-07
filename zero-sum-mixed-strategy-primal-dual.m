% Daniel Khashabi 
% Sept 2015 
A = [4 3 1 4; 2 5 6 3; 1 0 7 0]; 
% A = [0 5 -2; -3 0 4; 6 -4 0]; 
% A = [6 8 3 1 6; 4 2 6 3 5; 2 4 6 4 1; 1 3 2 5 3]; 

n = size(A,1); 
m = size(A,2); 

% random initialization
i = unidrnd(n); 
j = unidrnd(m); 
actionCount1 = zeros(n, 1); 
actionCount2 = zeros(m, 1); 

x_all = []; 
y_all = []; 
for iter = 1:90000
	actionCount1(i, 1) = actionCount1(i, 1) +  1; 
	actionCount2(j, 1) = actionCount2(j, 1) +  1; 
	
	x = actionCount1 / sum(iter); 
	y = actionCount2 / sum(iter); 
	
	x_all = [x_all x]; 
	y_all = [y_all y]; 
	
	[valMax,i] = max( A * y  ); 
	[valMin,j] = min( x' * A ); 
end 

figure(1);  plot(1:iter, x_all);  
title('Player 1, mixed strategy');
xlabel('iteration');
ylabel('action distribution');
print -dpdf player1.pdf

figure(2);  plot(1:iter, y_all); 
title('Player 2, mixed strategy');
xlabel('iteration');
ylabel('action distribution');
print -dpdf player2.pdf
