%gauss jacobi method for solving set of linear equations

eq1 = input('Enter the coefficients of first equation :');
a11 = eq1(1);a12 = eq1(2); a13=eq1(3);
eq2 = input('Enter the coefficients of second equation :');
a21 = eq2(1);a22 = eq2(2); a23=eq2(3);
eq3 = input('Enter the coefficients of third equation :');
a31 = eq3(1);a32 = eq3(2); a33=eq3(3);

constants = input('Enter the constant terms in each equation :');
b1 = constants(1);b2 = constants(2); b3 = constants(3);

x1=0;x2=0;x3=0;

for i = 1:3
    x1_curr = (b1 - (a12*x2) - (a13*x3))/a11;
    x2_curr = (b2 - (a21*x1) - (a23*x3))/a22;
    x3_curr = (b3 - (a31*x1) - (a32*x2))/a33;

    x1 = x1_curr;
    x2 = x2_curr;
    x3 = x3_curr; 
end

fprintf('x1 = %.4f\n',x1);
fprintf('x2 = %.4f\n',x2);
fprintf('x3 = %.4f\n',x3);
