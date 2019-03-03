clc
clear all
close all

our=[3033	4760	8795	13497	19893;0.560850632	0.643682813	0.729093045	0.782763502	0.821607581];
ourbase=[2885	3143	3586		6389	19056;0.54891264	0.566444419	0.59197902	0.677453998	0.802652257];
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