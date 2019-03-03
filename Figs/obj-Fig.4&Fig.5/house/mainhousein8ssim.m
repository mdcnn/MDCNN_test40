clc
clear all
close all

our=[1271	1602	2164	2794	3904;0.711335927	0.778053405	0.821357294	0.837881211	0.857282055];
ourbase =[1251	1298	1387	1486	1870	4133;0.709113978	0.723052802	0.742994741	0.758728708	0.798738	0.85486996];
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
