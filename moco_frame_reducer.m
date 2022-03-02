#US interpolator Eric Irani
clc, close, clearvars
pkg load io

%ultrasound data
b = 'C:\Octave\Eric Project\Ultrasound\Experiment 9 (P1)\EXP 9-2.xlsx';
%moco data
d = 'C:\Octave\Eric Project\IK\trial9-p1\K0_D10_L_3.xlsx';
%moco sheet name
r = 'K0_D10_L_3';
%file for selected moco data
%prod = 'C:\Octave\Eric Project\3DUS_TRC\T3_50_L11_goodmoco.xlsx';
F_fnames='K0_D10_L_3_goodmoco.mot';
Datafolder='C:\Octave\Eric Project\IK\trial9-p1';
Dataheadermotion = 'time\tpelvis_tilt\tpelvis_list\tpelvis_rotation\tpelvis_tx\tpelvis_ty\tpelvis_tz\thip_flexion_r\thip_adduction_r\thip_rotation_r\tknee_angle_r\tankle_angle_r\tsubtalar_angle_r\tmtp_angle_r\thip_flexion_l\thip_adduction_l\thip_rotation_l\tknee_angle_l\tankle_angle_l\tsubtalar_angle_l\tmtp_angle_l\tlumbar_extension\tlumbar_bending\tlumbar_rotation\tUS_rx\tUS_ry\tUS_rz\tUS_tx\tUS_ty\tUS_tz\tCLine_rx\tCLine_ry\tCLine_rz\tCLine_tx\tCLine_ty\tCLine_tz';


numberofframesUS = 14;
fpsUS = 5;     
numberofframesMOCO = 4626;
fpsMOCO = 100;
gmoco = zeros(numberofframesUS,35);
%locations in excel files for octave to take data from  
%ustimeloc = B2:B(1+numberofframesUS);
%uscentroidloc = D2:E(1+numberofframesUS);
%mocoloc = B12:AI(12+numberofframesMOCO);
#timestamps
us(:,1) = (1/fpsUS)*xlsread(b,'K0_D10_L','Q3:Q16');
#centroid data
us(:,2:3) = xlsread(b,'K0_D10_L','S3:T16');
#us(:,2:3) = us(:,2:3); 
#timestamps and position data, make sure that the columns encompass all of the markers used
moco = xlsread(d,r,'A12:AI4637');
% convert units to meters and subtract distance between imagej origin and origin of US images in imagej
gmoco(:,36) = ((us(:,3)-13.016)/1000);
gmoco(:,34) = ((us(:,2)-115.623)/1000);
gmoco(:,1)  = us(:,1);
for k = 2:30 #2nd number based off # of markers and results desired in final mot
   gmoco(:,k) = interp1(moco(:,1),moco(:,k),us(:,1));
endfor
#gmoco = xlsread(b,'Sheet1','A12:AJ24');  commented bc gmoco based of interpolated and actual timestams matching that in US, not just based on certain cells in excel file
## rstatus = xlswrite (prod, gmoco)
delimiterIn='\t';
##F_fnames=append(Subjectname,char(filename),'_Motion.mot');
Title='\nversion=1\nnRows=%d\nnColumns=%d\ninDegrees=yes\nendheader\n';
MDatadata=gmoco;
[r,c] = size(gmoco);
Titledata = [r,c];
makefile(Datafolder,F_fnames,Title,Titledata,Dataheadermotion,MDatadata,5,delimiterIn);