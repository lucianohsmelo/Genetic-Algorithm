function newPOP = mutacao(pop,prob,tipo,num_bits)
clc;
disp('Muta��o');
tam_pop = size(pop,1);
newPOP = pop;
%fprintf('Tipo muta��o: %d\n',tipo);
%% Muta��o bit a bit
if (tipo == 1)
    disp('Bit a bit')
    % Se probAleat�ria <= probEscolid
    % O bit sofre altera��o
    for i = 1:tam_pop
        for j = 1:num_bits
            probSort = rand(1);
           % fprintf('Probabilidade sorteada/escolhida: %0.2f/%0.2f\n',probSort,prob);
            if (probSort <= prob)% Se aleat�rio for menor que prob ocorre muta��o
                %fprintf('Muta��o Indiv�duo %d - Gene %d\n',i,j);
                
                if(pop(i,j) == 0)
                    newPOP(i,j) = 1;
                else
                    newPOP(i,j) = 0;
                end
                
            else
                %fprintf('Indiv�duo %d - Gene %d: n�o ocorreu muta��o\n',i,j);
            end
        end
    end
end
%% Muta��o por escolha aleat�ria de bit
if (tipo == 2)
    disp('Escolha aleat�ria de bit');
    % Se probAleat�ria <= probEscolida
    % Escolhe bit aleat�rio de um indiv�duo para sofrer muta��o
    for i = 1:tam_pop
        probSort = rand(1);
        %fprintf('Probabilidade sorteada/escolhida: %0.2f/%0.2f\n',probSort,prob);
        if (probSort <= prob)
            gen = randi(8);
            %fprintf('Indiv�duo %d - Gene sorteado %d\n',i,gen);
            
            if (pop(i,gen) == 0)
                newPOP(i,gen) = 1;
            else
                newPOP(i,gen) = 0;
            end
            
        else
           % fprintf('Indiv�duo %d: n�o ocorreu muta��o\n',i);
        end
    end
end
%% Popula��o ap�s as muta��es
   % disp('Popula��o ap�s as muta��es');
    
end