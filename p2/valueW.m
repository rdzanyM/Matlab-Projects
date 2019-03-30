function [ w ] = valueW( x,y,wsp )
%VALUEW oblicza w(x,y) przy pomocy podanego wektora wspolczynnikow
w = [1,x,y,x.^2,y.^2,x.*y]*wsp;
end

