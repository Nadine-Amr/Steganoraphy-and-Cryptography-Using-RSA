function [e d n] = RSA
format long
LP = PU(100000);  %% Generating all primes under the selected number
LP(1:floor(3*length(LP)/4)) = [];  %% Removing the bottom three-quarters of the list
p = LP(randi(length(LP)));  
q = LP(randi(length(LP)));  %% Selecting two random numbers
n = p*q;  %% The product of the two numbers
phi = (p-1)*(q-1);  %% Calculating Euler totient function
e = LP(randi(length(LP)));  %% Selecting e such that its less than phi, and shares no factors with it
while gcd(e,phi) ~= 1 || e > phi
    e = LP(randi(length(LP)));
end
d = finding_d(phi, e);  %% Getting d
end