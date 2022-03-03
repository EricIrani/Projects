#MA plotter Eric Irani
clc, close, clearvars
pkg load io

%data
p1 = 'C:\Octave\Eric Project\Moment Arms\exp9(p1)\MAcomposite.xlsx';
p7 = 'C:\Octave\Eric Project\Moment Arms\exp11(p7)\MAcomp_exp11p7.xlsx';
%sheet name
r = 'Sheet1';
%read data
MAexP1 = xlsread(p1,r,'A2:I5');
MArajP1 = xlsread(p1,r,'A7:I10');
MAthelP1 = xlsread(p1,r,'A12:I15');
%place dara in correct arrays
MAexP1A0 = MAexP1(1:4,1:2);
MAexP1D10 = MAexP1(1:4,4:5);
MAexP1P20 = MAexP1(1:4,7:8);
MArajP1A0 = MArajP1(1:4,1:2);
MArajP1D10 = MArajP1(1:4,4:5);
MArajP1P20 = MArajP1(1:4,7:8);
MAthelP1A0 = MAthelP1(1:4,1:2);
MAthelP1D10 = MAthelP1(1:4,4:5);
MAthelP1P20 = MAthelP1(1:4,7:8);
%read data
MAexP7 = xlsread(p7,r,'A2:I5');
MArajP7 = xlsread(p7,r,'A7:I10');
MAthelP7 = xlsread(p7,r,'A12:I15');
%place dara in correct arrays
MAexP7A0 = MAexP7(1:4,1:2);
MAexP7D10 = MAexP7(1:4,4:5);
MAexP7P20 = MAexP7(1:4,7:8);
MArajP7A0 = MArajP7(1:4,1:2);
MArajP7D10 = MArajP7(1:4,4:5);
MArajP7P20 = MArajP7(1:4,7:8);
MAthelP7A0 = MAthelP7(1:4,1:2);
MAthelP7D10 = MAthelP7(1:4,4:5);
MAthelP7P20 = MAthelP7(1:4,7:8);
%plot da data

subplot(2,2,1)
hold on
xlim([0 120])
ylim([0.005 0.03])
plot(MAexP1A0(:,1),MAexP1A0(:,2),'LineWidth',2.0,'color','b');
plot(MArajP1A0(:,1),MArajP1A0(:,2),'LineWidth',2.0,'color','r');
plot(MAthelP1A0(:,1), MAthelP1A0(:,2),'LineWidth',2.0,'color','g');

plot(MAexP1D10(:,1),MAexP1D10(:,2),'LineWidth',2.0,'LineStyle','--','color','b');
plot(MArajP1D10(:,1),MArajP1D10(:,2),'LineWidth',2.0,'LineStyle','--','color','r');
plot(MAthelP1D10(:,1), MAthelP1D10(:,2),'LineWidth',2.0,'LineStyle','--','color','g');

plot(MAexP1P20(:,1),MAexP1P20(:,2),'LineWidth',2.0,'LineStyle',':','color','b');
plot(MArajP1P20(:,1),MArajP1P20(:,2),'LineWidth',2.0,'LineStyle',':','color','r');
plot(MAthelP1P20(:,1), MAthelP1P20(:,2),'LineWidth',2.0,'LineStyle',':','color','g');
#axis([-0.35,0,-0.07,0.04])

title('Participant 1')
xlabel('Knee Angle (deg)','FontSize',13)
ylabel('Moment Arm (m)','FontSize',13)
hold off

subplot(2,2,2)
hold on
xlim([0 120])
ylim([0.005 0.03])
h1 = plot(MAexP7A0(:,1),MAexP7A0(:,2),'LineWidth',2.0,'color','b');
h2 = plot(MArajP7A0(:,1),MArajP7A0(:,2),'LineWidth',2.0,'color','r');
h3 = plot(MAthelP7A0(:,1), MAthelP7A0(:,2),'LineWidth',2.0,'color','g');

plot(MAexP7D10(:,1),MAexP7D10(:,2),'LineWidth',2.0,'LineStyle','--','color','b');
plot(MArajP7D10(:,1),MArajP7D10(:,2),'LineWidth',2.0,'LineStyle','--','color','r');
plot(MAthelP7D10(:,1), MAthelP7D10(:,2),'LineWidth',2.0,'LineStyle','--','color','g');

plot(MAexP7P20(:,1),MAexP7P20(:,2),'LineWidth',2.0,'LineStyle',':','color','b');
plot(MArajP7P20(:,1),MArajP7P20(:,2),'LineWidth',2.0,'LineStyle',':','color','r');
plot(MAthelP7P20(:,1), MAthelP7P20(:,2),'LineWidth',2.0,'LineStyle',':','color','g');
#axis([-0.35,0,-0.07,0.04])

title('Participant 2')
xlabel('Knee Angle (deg)','FontSize',13)
ylabel('Moment Arm (m)','FontSize',13)
hold off
h4 = ('LineWidth',2.0,'color','k');
h5 = ('LineWidth',2.0,'LineStyle','--','color','k');
h6 = ('LineWidth',2.0,'LineStyle',':','color','k');
subplot(2,2,3:4)
hold on
legend([h1; h2; h3; h4; h5; h6],'Experimental Model','Rajagopal Model','Thelen Model','0 degrees ankle flexion','10 degrees ankle dorsiflexion','20 degrees ankle plantarflexion','Location','north','orientation','horizontal');
legend boxoff
axis off 
hold off