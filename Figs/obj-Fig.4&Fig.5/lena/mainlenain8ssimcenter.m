clc%
clear all
close all
Foi=[2962	3196	3604		5844	15173;0.684280324	0.701114687	0.72694613	0.791043164	0.861035834];
BM3D=[2962	3196	3604		5844	15173;0.644248375	0.669926902	0.706486543	0.784596655	0.857390959];
DicTV=[2962	3196	3604		5844	15173;0.576393748	0.651282719	0.702068121	0.786410065	0.850011241];
CONCOLOR=[2962	3196	3604		5844	15173;0.692854422	0.707193843	0.731752923	0.789826684	0.849455461];
Foi1=[2962	3196	3604		5844	15173;0.684178095	0.701214357	0.727061703	0.791286442	0.861592215];
BM3D1=[2962	3196	3604		5844	15173;0.645892385	0.671341048	0.707334965	0.785025131	0.858131086];
DicTV1=[2962	3196	3604		5844	15173;0.580623385	0.653137657	0.703198289	0.787482408	0.850927982];
CONCOLOR1=[2962	3196	3604		5844	15173;0.693478733	0.707603843	0.732199406	0.790126664	0.849885014];
our=[3033	4574	7265	10371	15018;0.706873268	0.768000359	0.835971124	0.870555203	0.889435396];
ourbase=[2962	3196	3604		5844	15173;0.702055578	0.716843432	0.739905345	0.802388116	0.881063413];
hhbai=[0.418 	0.340 	0.276 	0.246 	0.214 	0.181 	0.165 	0.137 	0.097 ;0.888 	0.873 	0.858 	0.846 	0.834 	0.822 	0.813 	0.794 	0.761 ];
tt=[0.482971191	0.425720215	0.211364746	0.15335083	0.116912842	0.103210449;0.909016479	0.901969887	0.850519325	0.839654146	0.814387155	0.802922469];
t=[0.451019287	0.279418945	0.202148438	0.155700684	0.117614746;0.894187793	0.860512154	0.833765593	0.810322649	0.782388102];
plot(t(1,:),t(2,:),'s-','LineWidth',1.5,'Color',[.4 .8 0.8])
hold on
plot(tt(1,:),tt(2,:),'ms-','LineWidth',1.5)
hold on
plot(hhbai(1,:),hhbai(2,:),'bs-','LineWidth',1.5)
hold on
plot(8./((512*512)./Foi(1,:)),Foi(2,:),'m+:','LineWidth',1.5)
hold on
plot(8./((512*512)./BM3D(1,:)),BM3D(2,:),'b+:','LineWidth',1.5)
hold on
plot(8./((512*512)./DicTV(1,:)),DicTV(2,:),'k+:','LineWidth',1.5)
hold on
plot(8./((512*512)./CONCOLOR(1,:)),CONCOLOR(2,:),'g+:','LineWidth',1.5)
hold on
plot(8./((512*512)./Foi1(1,:)),Foi1(2,:),'mv-','LineWidth',1.5)
hold on
plot(8./((512*512)./BM3D1(1,:)),BM3D1(2,:),'bv-','LineWidth',1.5)
hold on
plot(8./((512*512)./DicTV1(1,:)),DicTV1(2,:),'kv-','LineWidth',1.5)
hold on
plot(8./((512*512)./CONCOLOR1(1,:)),CONCOLOR1(2,:),'gv-','LineWidth',1.5)
hold on
plot(8./((512*512)./our(1,:)),our(2,:),'c*-','LineWidth',1.5)
hold on
plot(8./((512*512)./ourbase(1,:)),ourbase(2,:),'r*-','LineWidth',1.5)
hold on;set(gcf,'color','w');grid on
legend('MDROQ','Tillo''s','Bai''s','MDB1a','MDB2a','MDB3a','MDB4a','MDB1b','MDB2b','MDB3b','MDB4b','Ours','Ours-base','Location','SouthEast')
figure_FontSize=13;
set(get(gca,'XLabel'),'FontSize',figure_FontSize,'Vertical','top');
set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
set(findobj('FontSize',10),'FontSize',figure_FontSize);
xlabel('bpp');
ylabel('SSIM');