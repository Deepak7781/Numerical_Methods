% Adam-Bashforth's Predictor-Corrector Formulae
% Predictor => y1 = y0 + (h/24)*(55*f_0 - 59*f_-1 + 37*f_-2 - 9*f_-3)
% Corrector => y1 = y0 + (h/24)*(9*f_1 + 19*f_0 - 5*f_-1 + f_-2)
% The formula is modified here by adding +3
% Predictor => y4 = y3 + (h/24)*(55*f_3 - 59*f_2 + 37*f_1 - 9*f_0)
% Corrector => y4 = y3 + (h/24)*(9*f_4 + 19*f_3 - 5*f_2 + f_1)


% Euler's formula to find y1,y2,y3
function y_values = euler(func,x_0,y_0,h)
    y_values = zeros(1,3);
    x_next = x_0 + h;
    for i = 1:3
        y_values(i) = y_0 + (h*func(x_0,y_0));
        x_0 = x_next;
        y_0 = y_values(i);
        x_next = x_next + h;
    end
end

func = input('Enter the function :', 's');
func = str2func(['@(x,y)',func]);

x0 = input('Enter the initial value of x :');
y0 = input('Enter the initial value of y :');

h = input('Enter the step size value (h) :');

y = euler(func,x0,y0,h);

x1 = x0 + h; x2 = x0 + (2*h); x3 = x0 + (3*h); x4 = x0 + (4*h);
y1 = y(1); y2 = y(2); y3 = y(3);

disp(y1); disp(y2); disp(y3);
f_0 = func(x0,y0); disp(f_0);
f_1 = func(x1,y1); disp(f_1);
f_2 = func(x2,y2); disp(f_2);
f_3 = func(x3,y3); disp(f_3);

y_p =  y3 + (h/24)*((55*f_3) - (59*f_2) + (37*f_1) - (9*f_0));

f_4 = func(x4, y_p);

y_c = y3 + (h/24)*((9*f_4) + (19*f_3) - (5*f_2) + f_1);

fprintf("Predicted Value y(%.4f) = %.4f\n",x4,y_p);
fprintf("Corrected Value y(%.4f) = %.4f\n",x4,y_c);
