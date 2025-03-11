% Runge-Kutta's fourth order formula for solving ode
% yn+1 = yn + del(y)
% del(y) = 1/6*(k1 + 2*k2 + 2*k3 + k4)
% k1 = h*f(x0,y0) 
% k2 = h*f(x0+h/2, y0+k1/2) 
% k3 = h*f(x0+h/2, y0+k2/2)
% k4 = h*f(x0+h, y0+k3)

%function dydx = func(x,y)
 %   dydx = x + y;
%end

func = input('Enter the function :','s');
func = str2func(['@(x,y)',func]);

x_prev = input('Enter the initial value of x :');
y_prev = input('Enter the initial value of y :');

h = input('Enter the step size value (h) :');
n = input('How many values of y you want to calculate :');
x_next =x_prev + h;

for i = 1:n
   
    k1 = h*(func(x_prev,y_prev));
    k2 = h*(func(x_prev+h/2, y_prev+k1/2));
    k3 = h*(func(x_prev+h/2, y_prev+k2/2));
    k4 = h*(func(x_prev+h, y_prev+k3));

    del_y = 1/6*(k1 + 2*k2 + 2*k3 + k4);
    y = y_prev + del_y;
    fprintf('y(%f) = %.4f\n',x_next, y);
    x_prev = x_prev+h;
    y_prev = y;
    x_next = x_next + h;
end

