function [M] = PU(x)
A(1) = (2);  %% Inserting 2 as the first prime number
for i = 3:2:x  %% Looping on all odd numbers starting from 3
    j = 1;
    flag = 0;  %% Flag will tell us wether or not the number is divisible by any of the prime numbers
    while (j <= length(A) && A(j) <= sqrt(i))  %% We will cover only the prime numbers less than the square root of the number
        if rem(i,A(j)) == 0  %% Dividing the number and the prime
            flag = 1;
            break;
        end
        j = j+1;
    end
    if flag == 0  %% Flag equal to zero means that the number is prime, so we add it to the prime numbers matrix
        A = [A i];
    end
end
M = A;
end