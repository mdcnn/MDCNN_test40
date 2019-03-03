clc
clear all
close all

our=[3033	4574	7265	10371	15018;0.699475364	0.763564621	0.820453682	0.849179268	0.873956242]
ourbase=[2962	3196	3604		5844	15173;0.691762557	0.706560863	0.728644735	0.787916351	0.864818736]

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
ylabel('SSIM');