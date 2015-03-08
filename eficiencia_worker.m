% calculo de las eficiecias para una sola longitud de onda
function [Qsca, Qext, Qabs]=eficiencia_worker(lambda, indice, nmax, radio)
    qsca = 0;
    qext = 0;
    x = (2*pi*radio/lambda);

    for n=1:1:nmax
        an = coeficientes_an(indice,lambda,n,radio);
        bn = coeficientes_bn(indice,lambda,n,radio);

        qsca = qsca+(2*n+1)*(abs(an)^2+abs(bn)^2);
        qext = qext+(2*n+1)*real(an+bn);
    end

    Qsca = (2/x^2)*qsca;
    Qext = (2/x^2)*qext;
    Qabs = Qext-Qsca;
end
