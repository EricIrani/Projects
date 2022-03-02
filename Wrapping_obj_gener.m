clc, close, clearvars, clear all

%composite file with pathway coordinates
b = 'C:\Eric\exp11_p7\Composite.xlsx';
x=-1.5:0.01:3.5;
y=sqrt(6-(x-1).^2)-2;
yr=y+rand(1,length(y));
xr=x+rand(1,length(x));
% for K=1:length(Knee)
%     for A=1:length(Ankle)
%         for T=1:length(Trial)
%             count=count+1;
%             x = append(Knee(K),"_",Ankle(A),"_L_",Trial(T),"(:,2)");
%             y = append(Knee(K),"_",Ankle(A),"_L_",Trial(T),"(:,1)");
%             plot(x, y)
%         end
%     end
% end
%l = 'C:\Octave\Eric Project\Centerline_results\reduced moco fps results\composite.xlsx';
Data.K00_0_L_1 = xlsread(b,'Sheet1','A2:C16');
Data.K00_0_L_2 = xlsread(b,'Sheet1','D2:F17');
Data.K00_0_L_3 = xlsread(b,'Sheet1','G2:I18');
Data.K00_D10_L_1 = xlsread(b,'Sheet1','J2:L18');
Data.K00_D10_L_2 = xlsread(b,'Sheet1','M2:O14');
Data.K00_D10_L_3 = xlsread(b,'Sheet1','P2:R15');
Data.K00_P20_L_1 = xlsread(b,'Sheet1','S2:U20');
Data.K00_P20_L_2 = xlsread(b,'Sheet1','V2:X18');
Data.K00_P20_L_3 = xlsread(b,'Sheet1','Y2:AA16');

Data.K60_0_L_1 = xlsread(b,'Sheet1','A22:C39');
Data.K60_0_L_2 = xlsread(b,'Sheet1','D22:F38');
Data.K60_0_L_3 = xlsread(b,'Sheet1','G22:I35');
Data.K60_D10_L_1 = xlsread(b,'Sheet1','J22:L39');
Data.K60_D10_L_2 = xlsread(b,'Sheet1','M22:O38');
Data.K60_D10_L_3 = xlsread(b,'Sheet1','P22:R35');
Data.K60_P20_L_1 = xlsread(b,'Sheet1','S22:U37');
Data.K60_P20_L_2 = xlsread(b,'Sheet1','V22:X34');
Data.K60_P20_L_3 = xlsread(b,'Sheet1','Y22:AA38');

Data.K90_0_L_1 = xlsread(b,'Sheet1','A41:C52');
Data.K90_0_L_2 = xlsread(b,'Sheet1','D41:F57');
Data.K90_0_L_3 = xlsread(b,'Sheet1','G41:I55');
Data.K90_D10_L_1 = xlsread(b,'Sheet1','J41:L58');
Data.K90_D10_L_2 = xlsread(b,'Sheet1','M41:O59');
Data.K90_D10_L_3 = xlsread(b,'Sheet1','P41:R55');
Data.K90_P20_L_1 = xlsread(b,'Sheet1','S41:U52');
Data.K90_P20_L_2 = xlsread(b,'Sheet1','V41:X52');
Data.K90_P20_L_3 = xlsread(b,'Sheet1','Y41:AA56');

Data.K110_0_L_1 = xlsread(b,'Sheet1','A61:C75');
Data.K110_0_L_2 = xlsread(b,'Sheet1','D61:F72');
Data.K110_0_L_3 = xlsread(b,'Sheet1','G61:I72');
Data.K110_D10_L_1 = xlsread(b,'Sheet1','J61:L73');
Data.K110_D10_L_2 = xlsread(b,'Sheet1','M61:O72');
Data.K110_D10_L_3 = xlsread(b,'Sheet1','P61:R72');
Data.K110_P20_L_1 = xlsread(b,'Sheet1','S61:U71');
Data.K110_P20_L_2 = xlsread(b,'Sheet1','V61:X71');
Data.K110_P20_L_3 = xlsread(b,'Sheet1','Y61:AA70');

%OriginFan = xlsread(b,'Sheet1','Q2:S11');
% o_gin = [-0.0237,-0.0346394, -0.0231902; -0.00331671, 0.0190276, -0.0265248];


Lateral0 = vertcat(Data.K00_0_L_1, Data.K00_0_L_2, Data.K00_0_L_3, Data.K00_D10_L_1, Data.K00_D10_L_2, Data.K00_D10_L_3, Data.K00_P20_L_1, Data.K00_P20_L_2, Data.K00_P20_L_3);
Lateral0 = vertcat(Lateral0, Data.K60_0_L_1, Data.K60_0_L_2, Data.K60_0_L_3, Data.K60_D10_L_1, Data.K60_D10_L_2, Data.K60_D10_L_3, Data.K60_P20_L_1, Data.K60_P20_L_2, Data.K60_P20_L_3);
Lateral0 = vertcat(Lateral0, Data.K90_0_L_1, Data.K90_0_L_2, Data.K90_0_L_3, Data.K90_D10_L_1, Data.K90_D10_L_2, Data.K90_D10_L_3, Data.K90_P20_L_1, Data.K90_P20_L_2, Data.K90_P20_L_3);
Lateral0 = vertcat(Lateral0, Data.K110_0_L_1, Data.K110_0_L_2, Data.K110_0_L_3, Data.K110_D10_L_1, Data.K110_D10_L_2, Data.K110_D10_L_3, Data.K110_P20_L_1, Data.K110_P20_L_2, Data.K110_P20_L_3);
% Lateral0(:,1) = vertcat(K00_0_L_1(:,1), K00_0_L_2(:,1), K00_0_L_3(:,1)); 
% Lateral0(:,2) = vertcat(K00_0_L_1(:,2), K00_0_L_2(:,2), K00_0_L_3(:,2));
% Lateral0(:,3) = vertcat(K00_0_L_1(:,3), K00_0_L_2(:,3), K00_0_L_3(:,3));

% Lateral0(:,1) = vertcat(K00_0_L_1(:,1), K00_0_L_2(:,1)); 
% Lateral0(:,2) = vertcat(K00_0_L_1(:,2), K00_0_L_2(:,2));
% Lateral0(:,3) = vertcat(K00_0_L_1(:,3), K00_0_L_2(:,3));

[s, o] = sort(Lateral0(:,2), 'descend');
Laterals0 = [-1*Lateral0(o,1),-1*s,Lateral0(o,3)];
L = length(Laterals0);

latfit = polyfit(Laterals0(:,2),Laterals0(:,1), 3);

poly = latfit(1)*Laterals0(:,2).^3 + latfit(2)*Laterals0(:,2).^2 + latfit(3)*Laterals0(:,2).^1 + latfit(4);
%y' = 3ax^2 + 2bx + c
%y'' = 6ax+ 2b
%x = (-2b)/(6a)
%val = polyval(poly,x)
% lbx = Laterals0(1,2); changed so tht the lower bound is what the upper
% bound would normally be so that the wraping object better fits distal data points 
ubx = (-2*latfit(2))/(6*latfit(1));
lbx = (-2*latfit(2))/(6*latfit(1));
% lbx = (((-2*latfit(2)) + sqrt(((2*latfit(2)).^2) - (12 * latfit(1) * latfit(3)))) / (2*latfit(1)));
lbx = 0.1411;
% ubx = Laterals0(end,2);
redlat = zeros(L,3);
k = 0;
for i = 1:L   
    if Laterals0(i,2) > lbx
        redlat(i,:) = Laterals0(i,:);
        if k == 0
            p = i;
        end
        k = k+1;
    end
end
redlat = redlat(p:k+p-1,:);


fun = @(w)sseval(w,redlat(:,2),redlat(:,1));
x0 = [0.1;0.1;-0.05];
options = optimset('MaxFunEvals',100000,'MaxIter',100000,'TolFun',1e-10);
bestx = fminsearch(fun,x0,options);
% bestx = fminsearch(fun,x0);

ye=CurveFun(bestx,Laterals0(:,2));
colors = distinguishable_colors(12);
Knee=["K00","K60","K90","K110"];
Ankle=["0","D10","P20"];
Trial=["1","2","3"];
count=1;

figure
hold on
plot(Laterals0(:,2),ye, 'Linewidth',2, 'DisplayName','Combined') 
for K=1:length(Knee)
    for A=1:length(Ankle)
        for T=1:length(Trial)
            x = Data.(append(Knee(K),"_",Ankle(A),"_L_",Trial(T)))(:,2);
            y = Data.(append(Knee(K),"_",Ankle(A),"_L_",Trial(T)))(:,1);
            plot(-1*x, -1*y, 'DisplayName',append(Knee(K),"_",Ankle(A),"_L_",Trial(T)), 'color', colors(count,:))
        end
        count = count + 1;
    end
end
plot(Laterals0(:,2), poly,'Linewidth',2,'DisplayName','Polynomial Fit to Data')
legend
hold off
% 
% hold on 
% plot
% plot plot
%  hold off

function sse = sseval(parm,xdata,ydata)
A = parm(1);
B = parm(2);
C = parm(3);
% D = parm(4);
n = length(xdata);
% E = x(5);
%y = sqrt((b^2)*(1 - (x-h)^2/a^2)) +k;
% sse = 1/n*sum(abs(ydata - sqrt((B.^2)*(1 - ((xdata - C).^2)/A.^2)) + D));
sse = 1/n*sum(abs(ydata - sqrt(A.^2 - (xdata-B).^2) + C));
end
function ydata = CurveFun(parm,xdata)
A = parm(1);
B = parm(2);
C = parm(3);
% D = parm(4);
% E=x(5);
% ydata = sqrt((B.^2)*(1 - ((xdata - C).^2)/A.^2)) + D;
ydata = sqrt(A.^2-(xdata-B).^2)-C;
end