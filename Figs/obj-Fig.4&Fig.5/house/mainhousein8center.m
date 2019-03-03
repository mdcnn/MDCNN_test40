clc
clear all
close all

our=[1271	1602	2164	2794	3904;24.4095353	27.61354953	30.75421858	32.47945473	34.05564408];
ourbase =[1251	1298	1387	1486	1870	4133;24.60686514	25.19180036	25.6798625	27.11554398	29.52695192	33.6248271];
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
ylabel('PSNR');