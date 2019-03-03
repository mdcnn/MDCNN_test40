clc
clear all
close all

our=[3033	4574	7265	10371	15018;24.95665017	27.55521039	30.32390058	32.40063649	33.86525965];
ourbase=[2962	3196	3604		5844	15173;24.70658644	25.18004468	26.31789875	29.06000266	33.09807074];

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