% fitting a polynomial by least square method
syms a b
x = input('Enter the values of x as a matrix :');
y = input('Enter the values of y as a matrix :');

x_sum = sum(x);
y_sum = sum(y);

xy_sum = 0;
x2_sum = 0;

for i = 1:length(x)
    xy_sum = xy_sum + (x(i)*y(i));
    x2_sum = x2_sum + x(i)^2;
end

eq1 = (x_sum*a) + (length(x)*b) == y_sum;
eq2 = (x2_sum*a) + (x_sum*b) == xy_sum;

solution = solve([eq1,eq2],[a,b]);

fprintf('a = %.2f\n',solution.a);
fprintf('b = %.2f\n',solution.b);


