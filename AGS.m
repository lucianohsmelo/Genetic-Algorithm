function [Xotimo, AVotimo, POP, AVpop] = AGS(AVALIA_FObj,TAM_POP, NUM_GER, TIPO_SEL, TIPO_CRUZ, TIPO_MUT, ELITISMO, PROB_CRUZ, PROB_MUT, NUM_Bits,minMax)
     clc;
     POP = rand(TAM_POP,NUM_Bits)>0.5;
     AVALIA = AVALIA_FObj(POP);
     if (minMax == 'min')
         vIND_Elite = inf;
         pIND_Elite = inf;
     end
     if (minMax == 'max')
         vIND_Elite = -inf;
         pIND_Elite = -inf;
     end
     figure
     for k = 1:NUM_GER
         tic
         PAIS = selecaoDePais(AVALIA,TIPO_SEL);
         %pause
         POP_CRUZ = cruzamento(POP,PAIS,PROB_CRUZ,TIPO_CRUZ,NUM_Bits);
         %pause
         POP_MUT = mutacao(POP_CRUZ,PROB_MUT,TIPO_MUT,NUM_Bits);
         %pause
         clc;
         POP = POP_MUT;
         AVALIA = AVALIA_FObj(POP)
         [maxAvalia,pMaxAvalia] = max(AVALIA);
         [minAvalia,pMinAvalia] = min(AVALIA);
         POP; 
         x(k) = k;
         if (ELITISMO == 1)
            fprintf('Indivíduo/Avaliação elite: %d/%0.2f\n',pIND_Elite,vIND_Elite);
            fprintf('Indivíduo/Avaliação máximo: %d/%0.2f\n',pMaxAvalia,maxAvalia);
            fprintf('Indivíduo/Avaliação mínimo: %d/%0.2f\n',pMinAvalia,minAvalia);
            if (minMax == 'max')
                if (maxAvalia > vIND_Elite)
                    disp('Ocorre elitismo');
                    IND_ELITE = POP(pMaxAvalia,:);
                    pIND_Elite = pMaxAvalia;
                    vIND_Elite = maxAvalia;
                    yElitismo(k) = vIND_Elite;
                    POP(pMinAvalia,:) = POP(pMaxAvalia,:); 
                else
                    disp('Não ocorre elitismo');
                    yElitismo(k) = vIND_Elite;
                    POP(pMinAvalia,:) = IND_ELITE; 
                end
            end
            if (minMax == 'min')
                if (maxAvalia < vIND_Elite)
                    disp('Ocorre elitismo');
                    IND_ELITE = POP(pMaxAvalia,:);
                    pIND_Elite = pMaxAvalia;
                    vIND_Elite = maxAvalia;
                    yElitismo(k) = vIND_Elite;
                    POP(pMinAvalia,:) = POP(pMaxAvalia,:); 
                else
                    disp('Não ocorre elitismo');
                    yElitismo(k) = vIND_Elite;
                    POP(pMinAvalia,:) = IND_ELITE; 
                end
            end
            subplot(2,1,1);
            plot(x,yElitismo,'r','LineWidth',2)
            xlim([1,k+0.1]);
            title('Elitismo');ylabel('Avaliação');drawnow;
         else
            yElitismo(k) = maxAvalia;
            subplot(2,1,1);
            plot(x,yElitismo,'r','LineWidth',2)
            xlim([1,k+1]);
            title('Sem elitismo');ylabel('Avaliação');drawnow;
         end
         fprintf('População da %dª geração\n',k);
         POP;
         yTempo(k) = toc;
         subplot(2,1,2);
         plot(x,yTempo,'b','LineWidth',2)
         xlim([1,k+0.1]);
         title('Tempo de Processamento');
         xlabel('Geração');ylabel('Tempo(s)');drawnow;
         %pause
     end
     Xotimo = IND_ELITE
     pause
     AVotimo = vIND_Elite;
     AVpop = AVALIA_FObj(POP);
end