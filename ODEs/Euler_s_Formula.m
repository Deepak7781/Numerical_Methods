% Euler's formula is the Runge-Kutta formula of the first order
% y(x + h) = y(x) + h*f(x,y)


func = input('Enter the function :','s');
func = str2func(['@(x,y)',func]);

x_prev = input('Enter the initial value of x :');
y_prev = input('Enter the initial value of y :');

h = input('Enter the step size value (h) :');
n = input('How many values of y you want to calculate :');
x_next =x_prev + h;


for i = 1:n
    y = y_prev + (h*func(x_prev,y_prev));
    fprintf('y(%f) = %.4f\n',x_next, y);
    x_prev = x_next;
    y_prev = y;
    x_next = x_next + h;
end