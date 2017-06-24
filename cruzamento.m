function newPOP = cruzamento(pop,pais,prob,tipo,num_bits)
clc;
disp('Cruzamento');
num_ind = size(pop,1);
%% Criar nova popula��o e salvar a antiga
for i = 1:num_ind 
        newPOP(i,:) = pop(pais(i),:);
end
fprintf('Tipo de cruzamento: %d\n',tipo)
%% Cruzamento de um ponto
if (tipo == 1)
   % disp('Cruzamento de um ponto selecionado');
    for i = (1:2:num_ind-1)
        if (rand(1) <= prob)%verifica se vai ocorrre o cruzamento
            %fprintf('Indiv�duos a serem cruzados: %d -> %d\n',i,i+1);
            gen(1) = randi(7);
            %fprintf('Posi��o selecionada: %d\n',gen(1))
            aux = newPOP(i,gen(1)+1:num_bits);
            newPOP(i,gen(1)+1:num_bits) = newPOP(i+1,gen(1)+1:num_bits);
            newPOP(i+1,gen(1)+1:num_bits) = aux;
         else
       %     disp('N�o ocorre cruzamento: probabilidade');
        end
    end 
end
%% Cruzamento de dois pontos
if (tipo == 2)
   % disp('Cruzamento de dois pontos selecionado');
    for i = (1:2:num_ind-1)
        % reset dos valores das posi��es
        gen(1) = 0;
        gen(2) = 0;
        if (rand(1) <= prob)%verifica se vai ocorrre o cruzamento
       %     fprintf('Indiv�duos a serem cruzados: %d -> %d\n',i,i+1);
            % repete at� que as posi��es sejam diferentes
            while gen(1) == gen(2)
                for j = 1:2
                    gen(j) = randi(num_ind-1);
                end
            end
            %fprintf('Posi��es selecionadas: %d e %d\n',min(gen),max(gen))
            
            % trocas os genes do meio e mant�m os das pontas
            aux = newPOP(i,min(gen)+1:max(gen));
            newPOP(i,min(gen)+1:max(gen)) =  newPOP(i+1,min(gen)+1:max(gen));
            newPOP(i+1,min(gen)+1:max(gen)) = aux;
            
        else 
            %disp('N�o ocorre cruzamento: probabilidade');
        end
        
    end
end
%% Cruzamento Uniforme
if (tipo == 3)
    disp('Cruzamento Uniforme');
    for i = 1:2:num_ind-1
        if (rand(1) <= prob) %verifica se vai ocorrre o cruzamento
            gabarito = rand(1,num_ind)>0.5; % gera um gabarito
            for j = 1:num_bits
                if (gabarito(j) == 0) %Se gabarito for 0, ocorre o cruzamento
                    %fprintf('Cruzamento entre Indiv�duos %d e %d - Gene %d\n',i,i+1,j)
                    aux = newPOP(i,j);
                    newPOP(i,j) = newPOP(i+1,j);
                    newPOP(i+1,j) = aux;
                    
                else % Gabarito = 1, n�o ocorre cruzamento
                   % disp('N�o ocorre cruzamento: gabarito = 0');
                end
            end
        else
           % disp('N�o ocorre cruzamento: probabilidade');
        end
    end
end
%% Popula��o ap�s o cruzamento
   % disp('Popula��o ap�s o crossover');
    
end