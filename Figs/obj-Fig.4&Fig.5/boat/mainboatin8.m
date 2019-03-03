clc%boat
clear all
close all

our=[3125	4835	8804	13190	19166;22.43056194	24.71665795	26.61093847	28.00979594	28.57686766];
ourbase=[2975	3196	3600		6385	19106;22.25643907	22.64115151	23.38001822	25.66066756	28.6414962];
plot(8./((512*512)./our(1,:)),our(2,:),'c*-','LineWidth',1.5)
hold on
plot(8./((512*512)./ourbase(1,:)),ourbase(2,:),'r*-','LineWidth',1.5)

set(gcf,'color','w');grid on
legend('Ours','Ours-base','Location','SouthEast')
figure_FontSize=13;
set(get(gca,'XLabel'),'FontSize',figure_FontSize,'Vertical','top');
set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
set(findobj('FontSize',10),'FontSize',figure_FontSize);
xlabel('bpp');
ylabel('PSNR');