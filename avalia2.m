function [g,OutMin] = avalia2(POP,InMin)
linha = size(POP,1);
coluna = size(POP,2);
global p;
g = [];
A = [0 1;0 -1];
B = [0;1];
C = [1 0;0 1];
Q = [1 0;0 1];
R = [1];
    for i = 1:linha
        aux = num2str(POP(i,1:15));
        aux1 = bin2dec(aux);
        P11 = 1.5+(1/((2^15)-1))*aux1;
        aux = num2str(POP(i,16:30));
        aux1 = bin2dec(aux);
        P12 = 0.5+(1/((2^15)-1))*aux1;
        aux = num2str(POP(i,31:45));
        aux1 = bin2dec(aux);
        P21 = 0.5+(1/((2^15)-1))*aux1;
        aux = num2str(POP(i,46:60));
        aux1 = bin2dec(aux);
        P22 = 0.5+(1/((2^15)-1))*aux1;
        P = ([P11 P12;P21 P22]);
        G = A'*P+P*A-P*B*(R^-1)*B'*P+Q;
        g(i) = G(1,1)^2+G(1,2)^2+G(2,1)^2+G(2,2)^2;
        if (g(i) < InMin)
            p = P;
            InMin = g(i);
        end
    end
end