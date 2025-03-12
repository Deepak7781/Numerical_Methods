% Milne's Predictor-Corrector formula 
% Predictor formula y4 = y0 + ((4*h)/3)*(2*f1 - f2 + 2*f3)
% Corrector formula y4 = y2 + (h/3)*(f2 + 4*f3 +f4)

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

y1 = y(1);y2 = y(2); y3 = y(3);
x1 = x0 + h; x2 = x0 + 2*h; x3 = x0 + 3*h;x4 = x0 + 4*h;

f1 = func(x1,y1);
f2 = func(x2, y2);
f3 = func(x3, y3);

y4_p = y0 + ((4*h)/3)*((2*f1) - f2 + (2*f3));

f4 = func(x4,y4_p);

y4_c = y2 + (h/3)*(f2 + (4*f3) + f4);

fprintf("Predicted value y(%.4f) = %.4f\n", x4,y4_p);
fprintf("Corrected value y(%.4f) = %.4f\n", x4,y4_c);