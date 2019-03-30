function [ f ] = apxValue(v, x)
%apxValue(v,x) liczy przyblizone f(x) z wektora wspolczynnikow v
w = zeros(length(v),length(x));
w(1,:) = 1;
for i = 1:(length(v)-1)/2
    w(2*i,:)   = cos(i*x);
    w(2*i+1,:) = sin(i*x);
end
f = v*w;
if size(x,1)>1
    f=f';
end
end

