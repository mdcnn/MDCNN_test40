clc
clear all
close all
Foi=[2975	3196	3600		6385	19106;0.534947074	0.545074702	0.571488981	0.661714456	0.777578409];
BM3D=[2975	3196	3600		6385	19106;0.515738297	0.533419395	0.5658264	0.657239165	0.769314238];
DicTV=[2975	3196	3600		6385	19106;0.468995663	0.514271921	0.560759041	0.658795672	0.763341952];
CONCOLOR=[2975	3196	3600		6385	19106;0.537057437	0.549666025	0.572553998	0.658442791	0.754143872];
Foi1=[2975	3196	3600		6385	19106;0.537290391	0.547717047	0.57352467	0.662518818	0.77844949];
BM3D1=[2975	3196	3600		6385	19106;0.520771885	0.537943034	0.568821842	0.658954138	0.771372265];
DicTV1=[2975	3196	3600		6385	19106;0.475396833	0.520602066	0.562209213	0.66054943	0.765202287];
CONCOLOR1=[2975	3196	3600		6385	19106;0.539661571	0.552799926	0.57536289	0.658991721	0.755755078];
our=[3125	4835	8804	13190	19166;0.555729242	0.631847072	0.746240378	0.803538409	0.841540832];
ourbase=[2975	3196	3600		6385	19106;0.55239432	0.567959089	0.590686482	0.692373826	0.830971081];
hhbai=[0.641 	0.525 	0.435 	0.373 	0.319 	0.276 	0.240 	0.191 	0.133 ;0.852 	0.827 	0.805 	0.784 	0.764 	0.746 	0.730 	0.701 	0.653 ];
tt=[0.588256836	0.48348999	0.422332764	0.216186523	0.153198242	0.115539551	0.102050781;0.861621823	0.841407523	0.825427513	0.729558271	0.708343573	0.681092776	0.662889324];
t=[0.562927246	0.407531738	0.282104492	0.211395264	0.125213623; 0.834987966358517	0.798972574764817	0.754200679003468	0.716526794005366	0.644129929073642];
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
hold on
set(gcf,'color','w');grid on
legend('MDROQ','Tillo''s','Bai''s','MDB1a','MDB2a','MDB3a','MDB4a','MDB1b','MDB2b','MDB3b','MDB4b','Ours','Ours-base','Location','SouthEast')
figure_FontSize=13;
set(get(gca,'XLabel'),'FontSize',figure_FontSize,'Vertical','top');
set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
set(findobj('FontSize',10),'FontSize',figure_FontSize);
xlabel('bpp');
ylabel('SSIM');