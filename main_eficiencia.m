matlabpool open local 8 % abrimos sesión para la paralelización el número indica el número de workers

lambda = [30:0.001:90];
indice = [30:0.001:90] * 0 + 4;
radio = 7.5;
orden = 10;
tiempo=0;
tic; % empieza a contar el tiempo de ejecucion del codigo paralelizado

% dividimos las lambdas entre los workers para su paralelización
parfor i = 1:length(lambda)
    
    [Qsca(i), Qext(i), Qabs(i)] = eficiencia_worker(lambda(i), indice(i), orden, radio);
    
end
tiempo=toc; % acaba de contar el tiempo de ejecucion del codigo paralelizado
save('resultados.mat'); %guarda el workspace en el directorio actual

matlabpool close;
exit;
