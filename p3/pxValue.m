function [ px ] = pxValue( p, x )
%UNTITLED Oblicza p(x)=a+bx+cx^2...
%gdzie p = [a,b,c,...]

px = p(length(p));
for i = length(p)-1:-1:1
    px = px * x;
    px = px + p(i);
end
end