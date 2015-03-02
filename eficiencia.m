function Q=eficiencia(indices,lambdas,nmax,a)



max=length(lambdas) %numero de componentes que van a tener la Q.
for j=1:max
    
        qsca=0;
        qext=0;
        
        x=(2*pi*a/lambdas (j));
    
     
    for n=1:1:nmax
        
        an = coeficientes_an(indices(j),lambdas(j),n,a);
        bn = coeficientes_bn(indices(j),lambdas(j),n,a);
        
        qsca=qsca+(2*n+1)*(abs(an)^2+abs(bn)^2);
        qext=qext+(2*n+1)*real(an+bn);
    
    end
   
    
    Qsca(j)=(2/x^2)*qsca;
    Qext(j)=(2/x^2)*qext;
    Qabs(j)=Qext(j)-Qsca(j);
end

figure;
plot(lambdas,Qsca,'r', 'LineWidth', 2)
hold on
plot(lambdas,Qext,'b', 'LineWidth', 2)
plot(lambdas,Qabs,'g', 'LineWidth', 2)
hold off
legend({'$Q_{sca}$','$Q_{ext}$','$Q_{abs}$'}, 'Interpreter','latex','Location','best')
legend boxoff
box on
%axis([200 1000 0 4.5])
set(gca,'FontSize',20,'FontName','Helvetica')
xlabel('$Wavelength / nm$','Interpreter','latex', 'FontSize',24)
ylabel('$Q$','Interpreter','latex', 'FontSize',24)
title('\emph{  sphere radius = 30 nm}', 'Interpreter','latex')
print -depsc2 Q__sph_30nm.eps
hold off