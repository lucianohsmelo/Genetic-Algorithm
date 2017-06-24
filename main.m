%% PPGESISA - Computa��o Evolucion�ria
% Algor�timos Gen�ticos
clear all;close all;clc;
%% Tamanho da populu��o
tam_pop = 400;
%% N�mero de gera��es
num_ger = 2;
%% Tipo de sele��o
%  1 - Sele��o por Roleta/2 - Sele��o por Sorteio
tipo_sel = 2;
%% Tipo de Cruzamento
%  1 - Cruzamento de um ponto/2 - Cruzamento de dois pontos/3 - Cruzamento Uniforme
tipo_cruz = 1;
%% Tipo de Muta��o
%  1 - Muta��o bit a bit/2 - Muta��o por escolha aleat�ria de bit
tipo_mut = 1;
%% Elitismo
%  0 - N�o ocorre/1 - Ocorre
elitismo = 1;
%% Probabilidade de Cruzamento
prob_cruz = 0.9;
%% Probabilidade de Muta��o
prob_mut = 0.1;
%% N�mero de Genes
num_gen = 17*4;
%% Algoritmo Gen�rico Simples
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


