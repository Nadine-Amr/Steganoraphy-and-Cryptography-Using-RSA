function d=finding_d(phi,e)
d=0.5;  %% Intialization to make the function run the while loop at least once
i=0;
while mod(d,1)~=0  %% We want to get a value of d from this equation that is an integer
    d=(i*phi+1)/e;
    i=i+1;
end
end