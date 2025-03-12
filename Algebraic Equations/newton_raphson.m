% Newton-Raphson method
% x_n+1 = x_n - (f(x_n)/f'(x_n))

func_str = input('Enter the function :','s');
func = str2func(['@(x)',func_str]);

x0 = input('Enter the initial value of x (or just press enter) :');

if isempty(x0)
    for i = 1:100
        if func(i) * func(i + 1) < 0
            x0 = i;
            fprintf('Initial guess found at x0 = %d\n', x0);
            break;
        end
    end
end


n = input('Enter the number of iterations :');

function df = dfdx(func_str)
syms x;
df_sym = diff(str2sym(func_str));
df = matlabFunction(df_sym);
end


for i = 1:n
    fx = func(x0);
    df_ = dfdx(func_str);
    dfx = df_(x0);

    x = x0 - (fx/dfx);
    fprintf('x%d = %.5f\n',i,x);
    x0 = x;
end


