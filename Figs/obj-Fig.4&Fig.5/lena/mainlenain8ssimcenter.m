clc%
clear all
close all

our=[3033	4574	7265	10371	15018;0.706873268	0.768000359	0.835971124	0.870555203	0.889435396];
ourbase=[2962	3196	3604		5844	15173;0.702055578	0.716843432	0.739905345	0.802388116	0.881063413];

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