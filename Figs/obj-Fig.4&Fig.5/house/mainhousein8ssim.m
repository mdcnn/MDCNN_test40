clc
clear all
close all
Foi=[1251	1298	1387	1486	1870	4133;0.699709528	0.707863876	0.726074998	0.738563265	0.775035773	0.793109413];
BM3D=[1251	1298	1387	1486	1870	4133;0.681701882	0.697637127	0.724311217	0.734853541	0.778744637	0.809418794];
DicTV=[1251	1298	1387	1486	1870	4133;0.636078787	0.673404698	0.70563954	0.7260454	0.772286748	0.816173467];
CONCOLOR=[1251	1298	1387	1486	1870	4133;0.717661124	0.732264426	0.75125738	0.75877563	0.79617276	0.81891841];
Foi1=[1251	1298	1387	1486	1870	4133;0.699730018	0.708036202	0.7263445	0.738971771	0.775622805	0.793466668];
BM3D1=[1251	1298	1387	1486	1870	4133;0.682165443	0.698189392	0.724914437	0.735699541	0.780334142	0.809362769];
DicTV1=[1251	1298	1387	1486	1870	4133;0.63849908	0.675468845	0.705765108	0.726586795	0.774421058	0.816928805];
CONCOLOR1=[1251	1298	1387	1486	1870	4133;0.718195943	0.732852613	0.751649034	0.759379709	0.796694713	0.818790207];
our=[1271	1602	2164	2794	3904;0.711335927	0.778053405	0.821357294	0.837881211	0.857282055];
ourbase =[1251	1298	1387	1486	1870	4133;0.709113978	0.723052802	0.742994741	0.758728708	0.798738	0.85486996];
hhbai=[0.502 	0.416 	0.346 	0.292 	0.268 	0.247 	0.225 	0.192 	0.144 ;0.736 	0.705 	0.684 	0.663 	0.646 	0.631 	0.619 	0.600 	0.564 ];
tt=[0.478515625	0.42590332	0.214477539	0.147460938;0.837763066	0.827819482	0.777028611	0.700855549];
t=[0.556518555	0.294311523	0.215698242	0.169799805	0.139892578;0.881448983	0.827271383	0.805996255	0.790662081	0.774019347];
plot(t(1,:),t(2,:),'s-','LineWidth',1.5,'Color',[.4 .8 0.8])
hold on
plot(tt(1,:),tt(2,:),'ms-','LineWidth',1.5)
hold on
plot(hhbai(1,:),hhbai(2,:),'bs-','LineWidth',1.5)
hold on
plot(8./((256*256)./Foi(1,:)),Foi(2,:),'m+:','LineWidth',1.5)
hold on
plot(8./((256*256)./BM3D(1,:)),BM3D(2,:),'b+:','LineWidth',1.5)
hold on
plot(8./((256*256)./DicTV(1,:)),DicTV(2,:),'k+:','LineWidth',1.5)
hold on
plot(8./((256*256)./CONCOLOR(1,:)),CONCOLOR(2,:),'g+:','LineWidth',1.5)
hold on
plot(8./((256*256)./Foi1(1,:)),Foi1(2,:),'mv-','LineWidth',1.5)
hold on
plot(8./((256*256)./BM3D1(1,:)),BM3D1(2,:),'bv-','LineWidth',1.5)
hold on
plot(8./((256*256)./DicTV1(1,:)),DicTV1(2,:),'kv-','LineWidth',1.5)
hold on
plot(8./((256*256)./CONCOLOR1(1,:)),CONCOLOR1(2,:),'gv-','LineWidth',1.5)
hold on
plot(8./((256*256)./our(1,:)),our(2,:),'c*-','LineWidth',1.5)
hold on
plot(8./((256*256)./ourbase(1,:)),ourbase(2,:),'r*-','LineWidth',1.5)
hold on;set(gcf,'color','w');grid on
legend('MDROQ','Tillo''s','Bai''s','MDB1a','MDB2a','MDB3a','MDB4a','MDB1b','MDB2b','MDB3b','MDB4b','Ours','Ours-base','Location','SouthEast')
figure_FontSize=13;
set(get(gca,'XLabel'),'FontSize',figure_FontSize,'Vertical','top');
set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
set(findobj('FontSize',10),'FontSize',figure_FontSize);
xlabel('bpp');
ylabel('SSIM');