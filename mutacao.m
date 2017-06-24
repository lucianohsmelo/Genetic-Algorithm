function newPOP = mutacao(pop,prob,tipo,num_bits)
clc;
disp('Mutação');
tam_pop = size(pop,1);
newPOP = pop;
%fprintf('Tipo mutação: %d\n',tipo);
%% Mutação bit a bit
if (tipo == 1)
    disp('Bit a bit')
    % Se probAleatória <= probEscolid
    % O bit sofre alteração
    for i = 1:tam_pop
        for j = 1:num_bits
            probSort = rand(1);
           % fprintf('Probabilidade sorteada/escolhida: %0.2f/%0.2f\n',probSort,prob);
            if (probSort <= prob)% Se aleatório for menor que prob ocorre mutação
                %fprintf('Mutação Indivíduo %d - Gene %d\n',i,j);
                
                if(pop(i,j) == 0)
                    newPOP(i,j) = 1;
                else
                    newPOP(i,j) = 0;
                end
                
            else
                %fprintf('Indivíduo %d - Gene %d: não ocorreu mutação\n',i,j);
            end
        end
    end
end
%% Mutação por escolha aleatória de bit
if (tipo == 2)
    disp('Escolha aleatória de bit');
    % Se probAleatória <= probEscolida
    % Escolhe bit aleatório de um indivíduo para sofrer mutação
    for i = 1:tam_pop
        probSort = rand(1);
        %fprintf('Probabilidade sorteada/escolhida: %0.2f/%0.2f\n',probSort,prob);
        if (probSort <= prob)
            gen = randi(8);
            %fprintf('Indivíduo %d - Gene sorteado %d\n',i,gen);
            
            if (pop(i,gen) == 0)
                newPOP(i,gen) = 1;
            else
                newPOP(i,gen) = 0;
            end
            
        else
           % fprintf('Indivíduo %d: não ocorreu mutação\n',i);
        end
    end
end
%% População após as mutações
   % disp('População após as mutações');
    
end