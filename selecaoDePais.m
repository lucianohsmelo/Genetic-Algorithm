function pais = selecaoDePais(avalia,tipo)
clc;
%disp('Seleção dos pais');
%disp(avalia)
%fprintf('Tipo de seleção: %d\n',tipo);
    if (tipo == 1)
        %disp('Método: Seleção por Roleta');
        soma = sum(avalia);
        for j = 1:length(avalia)
            s = rand*soma; 
            aux = avalia(1); 
            i = 1;
            while (aux < s)
                i = i + 1;
                aux = aux + avalia(i);
            end 
            pais(j) = i;
        end
    end
    
    if (tipo == 2);
        %disp('Método:Seleção por Torneio');
        k = 3;
       % fprintf('Tamanho do torneio %d\n',k');
        for j = 1:length(avalia)
            %fprintf('Torneio %d\n',j);
            for i = 1:k
                indAleat(i) = randi(8);
                %fprintf('Indivíduo/Avaliação selecionado: %d', indAleat(i));
                avaliaInd(i) = avalia(indAleat(i));
                %fprintf('/%0.2f\n',avaliaInd(i));
            end
            [vencAval,vencInd] = min(avaliaInd);
            pais(j) = indAleat(vencInd);
            %fprintf('Indvíduo/Avaliação vencedor: %d/%0.2f\n',pais(j),vencAval);
        end
    end
   % disp('Pais seleciodados');
    disp(pais);
end
