matlabpool open local 8

lambda = [30:0.001:90];
indice = [30:0.001:90] * 0 + 4;
radio = 7.5;
orden = 10;
tiempo=0;
tic;

parfor i = 1:length(lambda)
    
    [Qsca(i), Qext(i), Qabs(i)] = eficiencia_worker(lambda(i), indice(i), orden, radio);
    
end

% figure;
% plot(lambda,Qsca,'r', 'LineWidth', 2)
% hold on
% plot(lambda,Qext,'b', 'LineWidth', 2)
% plot(lambda,Qabs,'g', 'LineWidth', 2)
% hold off
% legend({'$Q_{sca}$','$Q_{ext}$','$Q_{abs}$'}, 'Interpreter','latex','Location','best')
% legend boxoff
% box on
% set(gca,'FontSize',20,'FontName','Helvetica')
% xlabel('$Wavelength / nm$','Interpreter','latex', 'FontSize',24)
% ylabel('$Q$','Interpreter','latex', 'FontSize',24)
% title('\emph{  sphere radius = 30 nm}', 'Interpreter','latex')
% print -dpng Q_sph_30nm.png
% hold off
tiempo=toc
save('resultados.mat')

matlabpool close;
exit;
