% the function takes three inputs: m,e and n, to compute m^e mod (n), or
% mod(m^e,n). This cannot be achieved directly as the m^e term would
% definitely exceed the available memory to store numbers in matlab,
% because large values of them are used. Modular multiplication arithmetic
% is going to be used to achieve this.
function a=modexp3(m,e,n)
% A vector x is going to be created to store successive calculations for
% the modular exponentiation. the first element of the vector is going to
% be m^1 mod(n). The next to be mod(the previous element squared, n), and so on.
x(1)=mod(m,n);
j=0;
k=1;
% this is to create a vector containing the powers of two from 1 until e.
while 2^j <= e
    B(k)=2^j;
    j=j+1;
    k=k+1;
end
% In this vector, we are using the mathematical rule which states that (M*M)mod n = (M mod n * M mod n) mod n
for i=2:length(B)
x(i) = mod((x(i-1))^2,n);
end
% Now we will get the powers of two that make the e
f=fliplr(decimalToBinaryVector(e));
for i=1:length(f)
    z(i)=((2^(i-1))*f(i));
end
% Here we want to get the values of the mod when the power of m in the vector x was equal to one of the powers of two that make e
w=x(find(z==B));
o=1;
% We will multiply all the values of the mod at these powers
for l=1:length(w)
    o=o*w(l);
end
% Finally, we mod the product of the valeus and n, and we get our value
a=mod(o,n);