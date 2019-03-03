clc%house
clear all
close all

our=[1271	1602	2164	2794	3904;23.55805183	27.16689132	29.50223324	30.6244339	31.28535288];
ourbase =[1251	1298	1387	1486	1870	4133;24.08850639	24.56239216	25.08756314	26.33076019	28.57931259	32.15921492];
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
