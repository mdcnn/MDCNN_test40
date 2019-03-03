clc%lena
clear all
close all

our=[3033	4574	7265	10371	15018;24.3819922	27.19961577	29.39700717	30.86650929	31.91329377];
ourbase=[2962	3196	3604		5844	15173;24.20529351	24.6724329	25.71433627	28.38066918	32.04231577];
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
