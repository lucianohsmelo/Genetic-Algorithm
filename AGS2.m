function [Xotimo, AVotimo, POP, AVpop, P] = AGS2(AVALIA_FObj,TAM_POP, NUM_GER, TIPO_SEL, TIPO_CRUZ, TIPO_MUT, ELITISMO, PROB_CRUZ, PROB_MUT, NUM_Bits,minMax)
     clc;
     POP = rand(TAM_POP,NUM_Bits)>0.5;
     %POP(1,:) = [0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1];
     InMin = inf;
     [AVALIA,OutMin] = AVALIA_FObj(POP,InMin);
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
         [AVALIA,OutMin] = AVALIA_FObj(POP,InMin);
         InMin = OutMin;
         [maxAvalia,pMaxAvalia] = max(AVALIA);
         [minAvalia,pMinAvalia] = min(AVALIA);
         POP; 
         x(k) = k;
         %fprintf('Indivíduo/Avaliação elite: %d/%0.2f\n',pIND_Elite,vIND_Elite);
         %fprintf('Indivíduo/Avaliação máximo: %d/%0.2f\n',pMaxAvalia,maxAvalia);
         %fprintf('Indivíduo/Avaliação mínimo: %d/%0.2f\n',pMinAvalia,minAvalia);
         if (ELITISMO == 1)
            if (minMax == 'max')
                if (maxAvalia > vIND_Elite)
                    %disp('Ocorre elitismo');
                    IND_ELITE = POP(pMaxAvalia,:);
                    pIND_Elite = pMaxAvalia;
                    vIND_Elite = maxAvalia;
                    yElitismo(k) = vIND_Elite;
                    POP(pMinAvalia,:) = POP(pMaxAvalia,:); 
                else
                   % disp('Não ocorre elitismo');
                    yElitismo(k) = vIND_Elite;
                    POP(pMinAvalia,:) = IND_ELITE; 
                end
            end
            if (minMax == 'min')
                if (minAvalia < vIND_Elite)
                  %  disp('Ocorre elitismo');
                    IND_ELITE = POP(pMinAvalia,:);
                    pIND_Elite = pMinAvalia;
                    vIND_Elite = minAvalia;
                    yElitismo(k) = vIND_Elite;
                    POP(pMaxAvalia,:) = POP(pMinAvalia,:); 
                else
                   % disp('Não ocorre elitismo');
                    yElitismo(k) = vIND_Elite;
                    POP(pMaxAvalia,:) = IND_ELITE; 
                end
            end
            subplot(2,1,1);
            plot(x,yElitismo,'r','LineWidth',2)
            xlim([1,k+0.1]);
            ylabel('Avaliação');drawnow;
         else
            if (minMax == 'max')
                yElitismo(k) = maxAvalia;
                subplot(2,1,1);
                plot(x,yElitismo,'r','LineWidth',2)
                xlim([1,k+1]);
                ylabel('Avaliação');drawnow;
            end
            
            if (minMax == 'min')
                yElitismo(k) = minAvalia;
                IND_ELITE = pMinAvalia;
                vIND_Elite = minAvalia;
                subplot(2,1,1);
                plot(x,yElitismo,'r','LineWidth',2)
                xlim([1,k+1]);
                ylabel('Avaliação');drawnow;
            end
         end
         fprintf('População da %dª geração\n',k);
         POP;
         yTempo(k) = toc;
         subplot(2,1,2);
         plot(x,yTempo,'b','LineWidth',2)
         xlim([1,k+0.1]);
         xlabel('Geração');ylabel('Tempo(s)');drawnow;
         if (stop == 1)
             disp('UHUL');
             break
         end
     end
     Xotimo = IND_ELITE;
     AVotimo = vIND_Elite;
     [AVpop,OutMin] = AVALIA_FObj(POP,InMin);
end