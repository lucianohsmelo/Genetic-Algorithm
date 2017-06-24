%% PPGESISA - Computação Evolucionária
% Algorítimos Genéticos
clear all;close all;clc;
%% Tamanho da populução
tam_pop = 400;
%% Número de gerações
num_ger = 2;
%% Tipo de seleção
%  1 - Seleção por Roleta/2 - Seleção por Sorteio
tipo_sel = 2;
%% Tipo de Cruzamento
%  1 - Cruzamento de um ponto/2 - Cruzamento de dois pontos/3 - Cruzamento Uniforme
tipo_cruz = 1;
%% Tipo de Mutação
%  1 - Mutação bit a bit/2 - Mutação por escolha aleatória de bit
tipo_mut = 1;
%% Elitismo
%  0 - Não ocorre/1 - Ocorre
elitismo = 1;
%% Probabilidade de Cruzamento
prob_cruz = 0.9;
%% Probabilidade de Mutação
prob_mut = 0.1;
%% Número de Genes
num_gen = 17*4;
%% Algoritmo Genérico Simples
global p;
[xyOtimo, avaOtimo, pop, avaPop, p] = AGS2(@avalia3,tam_pop,num_ger,tipo_sel,tipo_cruz,tipo_mut,elitismo,prob_cruz,prob_mut,num_gen,'min');
p
avaOtimo
break
datetime=datestr(now);
datetime=strrep(datetime,':','_'); %Replace colon with underscore
datetime=strrep(datetime,'-','_');%Replace minus sign with underscore
datetime=strrep(datetime,' ','_');%Replace space with underscore
save(strcat(datetime,' - THE BEST'));
saveas(gcf,strcat(datetime,'.bmp'))
disp('...FIM...');


