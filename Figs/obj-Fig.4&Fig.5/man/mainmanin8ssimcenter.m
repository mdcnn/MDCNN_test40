clc
clear all
close all

our=[3033	4760	8795	13497	19893;0.569333862	0.64905036	0.753856352	0.818047664	0.852262153];
ourbase=[2885	3143	3586		6389	19056;0.559915884	0.579662922	0.60642615	0.701518857	0.83624613];
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