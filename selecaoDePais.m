function pais = selecaoDePais(avalia,tipo)
clc;
%disp('Sele��o dos pais');
%disp(avalia)
%fprintf('Tipo de sele��o: %d\n',tipo);
    if (tipo == 1)
        %disp('M�todo: Sele��o por Roleta');
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
        %disp('M�todo:Sele��o por Torneio');
        k = 3;
       % fprintf('Tamanho do torneio %d\n',k');
        for j = 1:length(avalia)
            %fprintf('Torneio %d\n',j);
            for i = 1:k
                indAleat(i) = randi(8);
                %fprintf('Indiv�duo/Avalia��o selecionado: %d', indAleat(i));
                avaliaInd(i) = avalia(indAleat(i));
                %fprintf('/%0.2f\n',avaliaInd(i));
            end
            [vencAval,vencInd] = min(avaliaInd);
            pais(j) = indAleat(vencInd);
            %fprintf('Indv�duo/Avalia��o vencedor: %d/%0.2f\n',pais(j),vencAval);
        end
    end
   % disp('Pais seleciodados');
    disp(pais);
end
