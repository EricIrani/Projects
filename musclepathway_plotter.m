#plotting function for muscle pathway Eric Irani
clc, close, clearvars
clear all,
pkg load io

#composite file with pathway coordinates
b = 'C:\Users\er342145\Eric Project\Centerline_results\experiment19(p7)\pathwaycomposite_exp19p7.xlsx';
c = 'C:\Octave\Eric Project\Centerline_results\Generic_Model_Pathway.xlsx';


Data.K000_000_L_1 = zeros(3,3);
Data.K000_000_L_1 = xlsread(b,'Sheet1','A2:C4');
Data.K000_000_L_2 = zeros(23,3);
Data.K000_000_L_2 = xlsread(b,'Sheet1','D2:F24');
Data.K000_000_L_3 = zeros(20,3);
Data.K000_000_L_3 = xlsread(b,'Sheet1','G2:I21');

Data.K000_D10_L_1 = zeros(15,3);
Data.K000_D10_L_1 = xlsread(b,'Sheet1','J2:L16');
Data.K000_D10_L_2 = zeros(22,3);
Data.K000_D10_L_2 = xlsread(b,'Sheet1','M2:O23');
Data.K000_D10_L_3 = zeros(15,3);
Data.K000_D10_L_3 = xlsread(b,'Sheet1','P2:R16');

Data.K000_P30_L_1 = zeros(28,3);
Data.K000_P30_L_1 = xlsread(b,'Sheet1','S2:U29');
Data.K000_P30_L_2 = zeros(37,3);
Data.K000_P30_L_2 = xlsread(b,'Sheet1','V2:X38');
Data.K000_P30_L_3 = zeros(28,3);
Data.K000_P30_L_3 = xlsread(b,'Sheet1','Y2:AA29');


Data.K030_000_L_1 = zeros(29,3);
Data.K030_000_L_1 = xlsread(b,'Sheet1','A40:C65');
Data.K030_000_L_2 = zeros(29,3);
Data.K030_000_L_2 = xlsread(b,'Sheet1','D40:F68');
Data.K030_000_L_3 = zeros(28,3);
Data.K030_000_L_3 = xlsread(b,'Sheet1','G40:I65');

Data.K030_D10_L_1 = zeros(31,3);
Data.K030_D10_L_1 = xlsread(b,'Sheet1','J40:L70');
Data.K030_D10_L_2 = zeros(29,3);
Data.K030_D10_L_2 = xlsread(b,'Sheet1','M40:O68');
Data.K030_D10_L_3 = zeros(29,3);
Data.K030_D10_L_3 = xlsread(b,'Sheet1','P40:R68');

Data.K030_P30_L_1 = zeros(21,3);
Data.K030_P30_L_1 = xlsread(b,'Sheet1','S40:U60');
Data.K030_P30_L_2 = zeros(22,3);
Data.K030_P30_L_2 = xlsread(b,'Sheet1','V40:X61');
Data.K030_P30_L_3 = zeros(22,3);
Data.K030_P30_L_3 = xlsread(b,'Sheet1','Y40:AA61');


Data.K060_000_L_1 = zeros(26,3);
Data.K060_000_L_1 = xlsread(b,'Sheet1','A72:C97');
Data.K060_000_L_2 = zeros(22,3);
Data.K060_000_L_2 = xlsread(b,'Sheet1','D72:F93');
Data.K060_000_L_3 = zeros(23,3);
Data.K060_000_L_3 = xlsread(b,'Sheet1','G72:I94');

Data.K060_D10_L_1 = zeros(21,3);
Data.K060_D10_L_1 = xlsread(b,'Sheet1','J72:L92');
Data.K060_D10_L_2 = zeros(20,3);
Data.K060_D10_L_2 = xlsread(b,'Sheet1','M72:O91');
Data.K060_D10_L_3 = zeros(22,3);
Data.K060_D10_L_3 = xlsread(b,'Sheet1','P72:R93');

Data.K060_P30_L_1 = zeros(22,3);
Data.K060_P30_L_1 = xlsread(b,'Sheet1','S72:U93');
Data.K060_P30_L_2 = zeros(21,3);
Data.K060_P30_L_2 = xlsread(b,'Sheet1','V72:X92');
Data.K060_P30_L_3 = zeros(21,3);
Data.K060_P30_L_3 = xlsread(b,'Sheet1','Y72:AA92');


Data.K090_000_L_1 = zeros(16,3);
Data.K090_000_L_1 = xlsread(b,'Sheet1','A99:C114');
Data.K090_000_L_2 = zeros(25,3);
Data.K090_000_L_2 = xlsread(b,'Sheet1','D99:F123');
Data.K090_000_L_3 = zeros(19,3);
Data.K090_000_L_3 = xlsread(b,'Sheet1','G99:I117');

Data.K090_D10_L_1 = zeros(19,3);
Data.K090_D10_L_1 = xlsread(b,'Sheet1','J99:L117');
Data.K090_D10_L_2 = zeros(14,3);
Data.K090_D10_L_2 = xlsread(b,'Sheet1','M99:O112');
Data.K090_D10_L_3 = zeros(20,3);
Data.K090_D10_L_3 = xlsread(b,'Sheet1','P99:R118');

Data.K090_P30_L_1 = zeros(22,3);
Data.K090_P30_L_2 = xlsread(b,'Sheet1','S99:U120');
Data.K090_P30_L_2 = zeros(22,3);
Data.K090_P30_L_2 = xlsread(b,'Sheet1','V99:X120');
Data.K090_P30_L_3 = zeros(20,3);
Data.K090_P30_L_3 = xlsread(b,'Sheet1','Y99:AA118');


Data.K110_000_L_1 = zeros(12,3);
Data.K110_000_L_1 = xlsread(b,'Sheet1','A125:C136');
Data.K110_000_L_2 = zeros(15,3);
Data.K110_000_L_2 = xlsread(b,'Sheet1','D125:F139');
Data.K110_000_L_3 = zeros(13,3);
Data.K110_000_L_3 = xlsread(b,'Sheet1','G125:I137');

Data.K110_D10_L_1 = zeros(14,3);
Data.K110_D10_L_1 = xlsread(b,'Sheet1','J125:L138');
Data.K110_D10_L_2 = zeros(12,3);
Data.K110_D10_L_2 = xlsread(b,'Sheet1','M125:O136');
Data.K110_D10_L_3 = zeros(14,3);
Data.K110_D10_L_3 = xlsread(b,'Sheet1','P125:R138');

Data.K110_P30_L_1 = zeros(14,3);
Data.K110_P30_L_1 = xlsread(b,'Sheet1','S125:U138');
Data.K110_P30_L_2 = zeros(15,3);
Data.K110_P30_L_2 = xlsread(b,'Sheet1','V125:X139');
Data.K110_P30_L_3 = zeros(18,3);
Data.K110_P30_L_3 = xlsread(b,'Sheet1','Y125:AA142');

Data.Raj_K0_0 = zeros(14,3);
Data.Raj_K0_0 = xlsread(b,'Sheet1','A144:C157');

#Thelen_0 = xlsread(c,'Sheet1','B16:D26');
#Thelen_60 = xlsread(c,'Sheet1','N16:P26');
#Thelen_110= xlsread(c,'Sheet1','W16:Y26');

#Rajagopal_0 = xlsread(c,'Sheet1','B3:D13');
#Rajagopal_60 = xlsread(c,'Sheet1','N3:P13');
#Rajagopal_110 = xlsread(c,'Sheet1','W3:Y13');

%knee angles
ka = {'000';'030';'060';'090';'110'};
%ankle angles
aa = {'000';'D10';'P30'};

#combining three trials of one position and sorting based on distal distance from tibia head
#these are commented out because we are missing the first trial of k0_0_1
#K0_0(:,1) = vertcat(K0_0_L_1(:,1), K0_0_L_2(:,1), K0_0_L_3(:,1));
#K0_0(:,2) = vertcat(K0_0_L_1(:,2), K0_0_L_2(:,2), K0_0_L_3(:,2));
#K0_0(:,3) = vertcat(K0_0_L_1(:,3), K0_0_L_2(:,3), K0_0_L_3(:,3));

for i = 1:5
  for j = 1:3
    pos = strcat('K',ka{i,1},'_',aa{j,1});
    posn1 = strcat('K',ka{i,1},'_',aa{j,1},'_L_1');
    posn2 = strcat('K',ka{i,1},'_',aa{j,1},'_L_2');
    posn3 = strcat('K',ka{i,1},'_',aa{j,1},'_L_3');

    if posn1 = 'K000_0_L_1'
      Data.(pos) = vertcat(Data.(posn2),Data.(posn3));
      [s, o] = sort(Data.(pos)(:,2));
      Data.(strcat('s',pos)) = [Data.(pos)(o,1),s,Data.(pos)(o,3)];
      continue
    endif

    Data.(pos) = vertcat(Data.(posn1),Data.(posn2),Data.(posn3));
    [s, o] = sort(Data.(pos)(:,2));
    Data.(strcat('s',pos)) = [Data.(pos)(o,1),s,Data.(pos)(o,3)];
  endfor
endfor






for i = 1:5
  for j = 1:3
    polypos = strcat('sK',ka{i},'_',aa{j,1})

    Data.(strcat('latfitx',polypos)) = polyfit (Data.(polypos)(:,2), Data.(polypos)(:,1), 3);
    Data.(strcat('latfitz',polypos)) = polyfit (Data.(polypos)(:,2), Data.(polypos)(:,3), 3);

    Data.(strcat('Poly',polypos))(:,2) = Data.(polypos)(:,2);
    Data.(strcat('Poly',polypos))(:,1) = polyval (Data.(strcat('latfitx',polypos)), Data.(polypos)(:,2));
    Data.(strcat('Poly',polypos))(:,3) = polyval (Data.(strcat('latfitz',polypos)), Data.(polypos)(:,2)); #
  endfor
endfor

##R0 = corr(PolyLat0(:,1),Laterals0(:,1))
##R30 = corr(PolyLatK30(:,1),LateralsK30(:,1))
##R60 = corr(PolyLatK60(:,1),LateralsK60(:,1))
##R90 = corr(PolyLatK90(:,1),LateralsK90(:,1))
##R110 = corr(PolyLatK110(:,1),LateralsK110(:,1))


figure
hold on
h1 = plot(Data.PolysK000_000(:,2),Data.PolysK000_000(:,1),'LineWidth',2.0,'color','g');
#h2 = plot(Data.PolysK030_000(:,2),Data.PolysK030_000(:,1),'LineWidth',2.0,'color','r');
h3 = plot(Data.PolysK060_000(:,2),Data.PolysK060_000(:,1),'LineWidth',2.0,'color','b');
h4 = plot(Data.PolysK090_000(:,2),Data.PolysK090_000(:,1),'LineWidth',2.0,'color','k');
h5 = plot(Data.PolysK110_000(:,2),Data.PolysK110_000(:,1),'LineWidth',2.0,'color','c');
h6 = plot(Data.Raj_K0_0(:,2),Data.Raj_K0_0(:,1),'LineWidth',2.0,'color','r');
xlabel('Distal/Proximal (m)','FontSize',16)
ylabel('Posterior/Anterior (m)','FontSize',16)
#legend([h1, h2, h3, h4, h5],'0 Flexion','30 Knee Flexion', '60 Knee Flexion', '90 Knee Flexion', '110 Knee Flexion','location','northeast')
legend([h1, h3, h4, h5, h6],'0 Flexion', '60 Knee Flexion', '90 Knee Flexion', '110 Knee Flexion','Rajagopal 0 degrees knee flexion','location','northeast')
legend boxoff
hold off
##axis([-0.5,0,-0.08,0.0])



#xlim([-0.3 0])
##subplot(2,3,1)
#hold on

#plot(Thelen_0(:,2),Thelen_0(:,1),':','LineWidth',2.0,'color',[0.4 0.6 1]);
#plot(Rajagopal_0(:,2),Rajagopal_0(:,1),'--','LineWidth',1.5,'color',[0.4 0.6 1]);
#title('0 Knee Flexion')


#plot(Laterals0(:,2), Laterals0(:,1),'o','color','b');
#hold off
#subplot(3,2,2)
#hold on
##plot(PolyLatK30(:,2),PolyLatK30(:,1),'LineWidth',2.0,'color','r');
#plot(LateralsK30(:,2), LateralsK30(:,1),'o','color','r');
#hold off
#subplot(2,3,2)
#hold on
##plot(PolyLatK60(:,2),PolyLatK60(:,1),'LineWidth',2.0,'color','k');
#plot(Thelen_60(:,2),Thelen_60(:,1),':','LineWidth',2.0,'color','g');
#plot(Rajagopal_60(:,2),Rajagopal_60(:,1),'--','LineWidth',1.5,'color','g');
#title('60 Knee Flexion')
#xlabel('Distal/Proximal (m)','FontSize',13)
#ylabel('Posterior/Anterior (m)','FontSize',13)
#axis([-0.5,0,-0.08,0.0])
#legend('Experimental Data','Thelen','Rajagopal','position','southoutside')
#plot(LateralsK60(:,2), LateralsK60(:,1),'o','color','g');
#hold off
#subplot(3,2,4)
#hold on
##plot(PolyLatK90(:,2),PolyLatK90(:,1),'LineWidth',2.0,'color','c');
#plot(LateralsK90(:,2), LateralsK90(:,1),'o','color','c');
#hold off
#subplot(2,3,3)
#hold on
##h1 = plot(PolyLatK110(:,2),PolyLatK110(:,1),'LineWidth',2.0,'color',[0.8 0 0.67]);
#h2 = plot(Thelen_110(:,2),Thelen_110(:,1),':','LineWidth',2.0,'color','m');
#h3 = plot(Rajagopal_110(:,2),Rajagopal_110(:,1),'--','LineWidth',1.5,'color','m');
#title('110 Knee Flexion')
#xlabel('Distal/Proximal (m)','FontSize',13)
#ylabel('Posterior/Anterior (m)','FontSize',13)
#axis([-0.5,0,-0.08,0.0])
#plot(LateralsK110(:,2), LateralsK110(:,1),'o','color','k');
#axis([-0.5,0,-0.1,-0.01])

#plot(Thelen_30(:,2),Thelen_30(:,1),'--','LineWidth',2.0,'color','r');

#plot(Thelen_90(:,2),Thelen_90(:,1),'--','LineWidth',2.0,'color','c');



#plot(Thelen_30(:,2),Thelen_30(:,1),'--','LineWidth',2.0,'color','r');

#plot(Thelen_90(:,2),Thelen_90(:,1),'--','LineWidth',2.0,'color','c');

hold off
#plot(compareral(:,2),compareral(:,1),'LineWidth',2.0,'b');




#title('Lateral Gastrocnemius Sagittal Plane')
#xlabel('Distal/Proximal (m)','FontSize',13)
#ylabel('Posterior/Anterior (m)','FontSize',13)
#axis([-0.5,0,-0.08,0.0])
#'Rajagopal 0 Degrees Flexion','Rajagopal 60 Degrees Flexion','Rajagopal 110 Degrees Flexion',

#subplot(2,3,5)
#hold on
#h1 = PolyLatK110;
#h2 = Thelen_110;
#h3 = Rajagopal_110;

#axis off
##legend('0 Flexion','30 Knee Flexion', '60 Knee Flexion', '90 Knee Flexion', '110 Knee Flexion','location','northeast')
##legend boxoff



%{
subplot(1,2,2)
hold on
plot(PolyLat0(:,2),PolyLat0(:,3),'LineWidth',2.0,'color','b');
plot(PolyLatK30(:,2),PolyLatK30(:,3),'LineWidth',2.0,'color','r');
plot(PolyLatK60(:,2),PolyLatK60(:,3),'LineWidth',2.0,'color','g');
plo2t(PolyLatK90(:,2),PolyLatK90(:,3),'LineWidth',2.0,'color','y');
plot(PolyLatK110(:,2),PolyLatK110(:,3),'LineWidth',2.0,'color','k');
#plot(compareral(:,2),compareral(:,3),'LineWidth',2.0,'b');
axis([-0.35,0,-0.07,0.04])
title('Lateral Gastrocnemius Coronal Plane')
xlabel('Distal/Proximal (m)','FontSize',13)
ylabel('Lateral/Medial (m)','FontSize',13)

hold off



##subplot(3,2,[5,6])

##
##hL = subplot(3,2,[5,6]);
hold on
subplot(1,2,2)
poshL = get(hL,'position');     % Getting its position
legend(hL,[h1; h2; h3; h4],'Polynomial Fit to Data','Thelen','Rajagopal','Experimental Data','Orientation','horizontal','Location','north')
##legend.bkgd='boxoff';
##lgd('boxoff');
##legend 'boxoff';
##set(lgd,'position','west');      % Adjusting legend's position
#axis(hL,'off');
axis off
hold off
# Medialerror = immse(Medials,comparethm)
#Lateralerror = immse(Laterals, comparethl)
%}
