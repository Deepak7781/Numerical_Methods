% Trapezoidal rule for single integration


x = input("Enter the values of x as a matrix :");

func = input('Enter a function in terms of x :','s');
func = strrep(func, '^', '.^');
func = strrep(func, '/', './');
func = strrep(func, '*', '.*');

y = str2func(['@(x)', func]);

n = length(x);

h = x(2)-x(1); %assuming evenly spaced intervals

y_values = y(x);

integration_res = (h/2) * (y_values(1)+y_values(n) + 2*sum(y_values(2:n-1)));

fprintf('Result = %.4f',integration_res);