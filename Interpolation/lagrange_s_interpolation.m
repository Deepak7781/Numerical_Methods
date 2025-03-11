% lagrange's interpolation method

syms x

n = input('Enter the number of sample data available :');

x_values = input('Enter the values of x as a matrix :');
y_values = input('Enter the corresponding y values as a matrix :');

y = 0;

for i = 1:n
    denom = 1;
    nume = 1;
    for j = 1:n
        if i ~= j
            nume = nume * (x - x_values(j));
            denom = denom * (x_values(i) - x_values(j));
        end
    end
    y = y + ((nume/denom)*y_values(i));
end
        
y = simplify(y);
disp(y);
