%% Intro
% L'implementazione base è quella del lab3, esercizio 1.
% I file sono stati modificati in modo da permettere di:
% -includere un coefficiente di diffusione q
% -restituire come output un vettore riordinato row-wise in modo da poterlo usare meglio come output per la rete in python
% -escludere la parte di postprocessing e calcolo degli errori per velocizzare le prestazioni

%% Script utili
% sol_trainingset permette, dato un file contenente su ogni riga una distribuzione del coefficiente, di calcolare le
% rispettive soluzioni fem, e le restituisce sempre in forma di matrice e in forma di file txt. è possibile specificare
% gli nRef desiderati per ogni soluzione.
% Le soluzioni sono ordinate riga per riga: da (0,0) a (0,n) .... da (n,0)
% a (n,n)
%
% coeff_trainingset permette di specificare un dominio, un vettore di funzioni e un vettore di numeri di partizioni
% e valuta le funzioni sui punti richiesti del dominio, restituendo per ogni funzione un vettore riga.
% L'output sarà quindi una matrice in cui ogni riga rappresenta la distribuzione di un diverso coefficiente.
% Viene anche salvata su un file txt.
%
% C_convergence fa un test di convergenza usando un coefficiente e una forzante specifica (vedi
% ConvergenceTest/convergence_test_functions.m), plotta la velocità di convergenza H1 e L2 e mette gli errori in
% una tabella. Converge tutto bene e i risultati sono salvati in ConvergenceTest.

%% Modifiche alle funzioni date
% [uh, femregion, errors, solutions]=C_main2D(TestName,nRef, diff_coeff, post_proc)
% occhio a input e output:
% -diff_coeff dev'essere una matrice quadrata con q valutato in alcuni punti
% -post_proc è un flag che indica se fare o meno il post-processing
% -l'output uh restituisce la soluzione nell'ordine specificato in femregion
% Nota: se il coefficiente non è disponibile in tutti i nodi di quadratura interpola linearmente
% 
% [A,f]=C_matrix2D(Dati,femregion)
% è stata aggiunta la parte per calcolare e includere il coefficiente di diffusione

%% Funzioni ausiliarie
% In DataGeneration ci sono 3 funzioni ausiliarie che vengono usate dai
% 3 script citati in precedenza