function g = avalia(A)
linha = size(A,1);
coluna = size(A,2);
g = [];
    for i = 1:linha
        aux = num2str(A(i,1:(coluna/2)));
        x = bin2dec(aux);
        aux2 = num2str(A(i,(coluna/2)+1:coluna));
        y = bin2dec(aux2);
        g(i) = 1+abs(x*y*sin((y*pi)/4));
    end
end