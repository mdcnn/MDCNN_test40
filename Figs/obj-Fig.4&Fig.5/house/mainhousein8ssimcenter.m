clc
clear all
close all

our=[1271	1602	2164	2794	3904;0.71813489	0.782804478	0.835158285	0.855091961	0.873737581];
ourbase =[1251	1298	1387	1486	1870	4133;0.718201431	0.738727494	0.756977769	0.774800401	0.812281511	0.877549109];
plot(8./((256*256)./our(1,:)),our(2,:),'c*-','LineWidth',1.5)
hold on
plot(8./((256*256)./ourbase(1,:)),ourbase(2,:),'r*-','LineWidth',1.5)

set(gcf,'color','w');grid on
legend('Ours','Ours-base','Location','SouthEast')
figure_FontSize=13;
set(get(gca,'XLabel'),'FontSize',figure_FontSize,'Vertical','top');
set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
set(findobj('FontSize',10),'FontSize',figure_FontSize);
xlabel('bpp');
ylabel('SSIM');