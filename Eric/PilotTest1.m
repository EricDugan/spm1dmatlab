%% GET PATIENT DATA

% Have user browse for a file, from a specified "starting folder."
% For convenience in browsing, set a starting folder from which to browse.
startingFolder = 'Z:\DATABASE\NMG\MatFiles';
if ~exist(startingFolder, 'dir')
  % If that folder doesn't exist, just start in the current folder.
  startingFolder = pwd;
end
% Get the name of the mat file that the user wants to use.
defaultFileName = fullfile(startingFolder, '*.mat');
[baseFileName, folder] = uigetfile(defaultFileName, 'Select a mat file',...
    'MultiSelect','on');
if baseFileName == 0
  % User clicked the Cancel button.
  return;
end

for i = 1:length(baseFileName)
    fullFileName = fullfile(folder, baseFileName{i});
    if i == 1
        dataSet1 = load(fullFileName);
    elseif i == 2
        dataSet2 = load(fullFileName);
    end
end

%% First visit kinematic data
structName1 = erase(baseFileName{1},'_Database_File.mat');

for i = 1:6 
V1L(i,:,1) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.LPELVIS_ANGLE.X.Strides(:,i)','''',';'));
V1L(i,:,2) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.LPELVIS_ANGLE.Y.Strides(:,i)','''',';'));
V1L(i,:,3) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.LPELVIS_ANGLE.Z.Strides(:,i)','''',';'));

V1L(i,:,4) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.LHIP_ANGLE.X.Strides(:,i)','''',';'));
V1L(i,:,5) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.LHIP_ANGLE.Y.Strides(:,i)','''',';'));
V1L(i,:,6) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.LHIP_ANGLE.Z.Strides(:,i)','''',';'));

V1L(i,:,7) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.LKNEE_ANGLE.X.Strides(:,i)','''',';'));
V1L(i,:,8) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.LKNEE_ANGLE.Y.Strides(:,i)','''',';'));
V1L(i,:,9) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.LKNEE2_ANGLE.Z.Strides(:,i)','''',';'));

V1L(i,:,10) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.LSha_Foo.Z.Strides(:,i)','''',';'));
V1L(i,:,11) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.LFT_PROGRESSION_ANGLE.Z.Strides(:,i)','''',';'));

V1R(i,:,1) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.RPELVIS_ANGLE.X.Strides(:,i)','''',';'));
V1R(i,:,2) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.RPELVIS_ANGLE.Y.Strides(:,i)','''',';'));
V1R(i,:,3) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.RPELVIS_ANGLE.Z.Strides(:,i)','''',';'));

V1R(i,:,4) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.RHIP_ANGLE.X.Strides(:,i)','''',';'));
V1R(i,:,5) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.RHIP_ANGLE.Y.Strides(:,i)','''',';'));
V1R(i,:,6) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.RHIP_ANGLE.Z.Strides(:,i)','''',';'));

V1R(i,:,7) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.RKNEE_ANGLE.X.Strides(:,i)','''',';'));
V1R(i,:,8) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.RKNEE_ANGLE.Y.Strides(:,i)','''',';'));
V1R(i,:,9) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.RKNEE2_ANGLE.Z.Strides(:,i)','''',';'));

V1R(i,:,10) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.RSha_Foo.Z.Strides(:,i)','''',';'));
V1R(i,:,11) = eval(strcat('dataSet1.',structName1,'.',...
    'Kinematic.Normalized.RFT_PROGRESSION_ANGLE.Z.Strides(:,i)','''',';'));

end

%% Second visit kinematic data
structName2 = erase(baseFileName{2},'_Database_File.mat');

for i = 1:6 
V2L(i,:,1) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.LPELVIS_ANGLE.X.Strides(:,i)','''',';'));
V2L(i,:,2) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.LPELVIS_ANGLE.Y.Strides(:,i)','''',';'));
V2L(i,:,3) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.LPELVIS_ANGLE.Z.Strides(:,i)','''',';'));

V2L(i,:,4) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.LHIP_ANGLE.X.Strides(:,i)','''',';'));
V2L(i,:,5) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.LHIP_ANGLE.Y.Strides(:,i)','''',';'));
V2L(i,:,6) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.LHIP_ANGLE.Z.Strides(:,i)','''',';'));

V2L(i,:,7) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.LKNEE_ANGLE.X.Strides(:,i)','''',';'));
V2L(i,:,8) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.LKNEE_ANGLE.Y.Strides(:,i)','''',';'));
V2L(i,:,9) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.LKNEE2_ANGLE.Z.Strides(:,i)','''',';'));

V2L(i,:,10) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.LSha_Foo.Z.Strides(:,i)','''',';'));
V2L(i,:,11) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.LFT_PROGRESSION_ANGLE.Z.Strides(:,i)','''',';'));

V2R(i,:,1) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.RPELVIS_ANGLE.X.Strides(:,i)','''',';'));
V2R(i,:,2) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.RPELVIS_ANGLE.Y.Strides(:,i)','''',';'));
V2R(i,:,3) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.RPELVIS_ANGLE.Z.Strides(:,i)','''',';'));

V2R(i,:,4) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.RHIP_ANGLE.X.Strides(:,i)','''',';'));
V2R(i,:,5) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.RHIP_ANGLE.Y.Strides(:,i)','''',';'));
V2R(i,:,6) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.RHIP_ANGLE.Z.Strides(:,i)','''',';'));

V2R(i,:,7) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.RKNEE_ANGLE.X.Strides(:,i)','''',';'));
V2R(i,:,8) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.RKNEE_ANGLE.Y.Strides(:,i)','''',';'));
V2R(i,:,9) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.RKNEE2_ANGLE.Z.Strides(:,i)','''',';'));

V2R(i,:,10) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.RSha_Foo.Z.Strides(:,i)','''',';'));
V2R(i,:,11) = eval(strcat('dataSet2.',structName2,'.',...
    'Kinematic.Normalized.RFT_PROGRESSION_ANGLE.Z.Strides(:,i)','''',';'));

end
%% Set path to save outputs

base = 'Z:\DATA\NM GAIT\Clinical';
patFolder_temp = extractBetween(baseFileName{1},"NMG_","_DB");
patFolder = insertBefore(patFolder_temp,"_P","_NMG");
savePath = strcat(base,'\',patFolder);

%% Individual Graphs

spm1dGraphs(V1L(:,:,1), V2L(:,:,1), 'Pelvic Tilt', savePath);










% raw1 = NMG_00613_P_DB_V1_BF;
% 
% for i = 1:6
%    V1(i,:,1)= raw1.Kinematic.Normalized.LPELVIS_ANGLE.X.Strides(:,i)';
%    V1(i,:,2)= raw1.Kinematic.Normalized.LPELVIS_ANGLE.Y.Strides(:,i)';
%    V1(i,:,3)= raw1.Kinematic.Normalized.LPELVIS_ANGLE.Z.Strides(:,i)';
%    
%    V1(i,:,4)= raw1.Kinematic.Normalized.LHIP_ANGLE.X.Strides(:,i)';
%    V1(i,:,5)= raw1.Kinematic.Normalized.LHIP_ANGLE.Y.Strides(:,i)';
%    V1(i,:,6)= raw1.Kinematic.Normalized.LHIP_ANGLE.Z.Strides(:,i)';
%    
%    V1(i,:,7)= raw1.Kinematic.Normalized.LKNEE_ANGLE.X.Strides(:,i)';
%    V1(i,:,8)= raw1.Kinematic.Normalized.LKNEE_ANGLE.Y.Strides(:,i)';
%    V1(i,:,9)= raw1.Kinematic.Normalized.LKNEE2_ANGLE.Z.Strides(:,i)';
%    
%    V1(i,:,10)= raw1.Kinematic.Normalized.LSha_Foo.Z.Strides(:,i)';
%    V1(i,:,11)= raw1.Kinematic.Normalized.LFT_PROGRESSION_ANGLE.Z.Strides(:,i)';
%    
% end

%% Second visit kinematic data

% raw2 = NMG_00613_P_DB_V2_BF;
% 
% for i = 1:6
%    V2(i,:,1)= raw2.Kinematic.Normalized.LPELVIS_ANGLE.X.Strides(:,i)';
%    V2(i,:,2)= raw2.Kinematic.Normalized.LPELVIS_ANGLE.Y.Strides(:,i)';
%    V2(i,:,3)= raw2.Kinematic.Normalized.LPELVIS_ANGLE.Z.Strides(:,i)';
%    
%    V2(i,:,4)= raw2.Kinematic.Normalized.LHIP_ANGLE.X.Strides(:,i)';
%    V2(i,:,5)= raw2.Kinematic.Normalized.LHIP_ANGLE.Y.Strides(:,i)';
%    V2(i,:,6)= raw2.Kinematic.Normalized.LHIP_ANGLE.Z.Strides(:,i)';
%    
%    V2(i,:,7)= raw2.Kinematic.Normalized.LKNEE_ANGLE.X.Strides(:,i)';
%    V2(i,:,8)= raw2.Kinematic.Normalized.LKNEE_ANGLE.Y.Strides(:,i)';
%    V2(i,:,9)= raw2.Kinematic.Normalized.LKNEE2_ANGLE.Z.Strides(:,i)';
%    
%    V2(i,:,10)= raw2.Kinematic.Normalized.LSha_Foo.Z.Strides(:,i)';
%    V2(i,:,11)= raw2.Kinematic.Normalized.LFT_PROGRESSION_ANGLE.Z.Strides(:,i)';
%    
% end 

%% Multivariate Analysis - Hotellings_paired test

%% By Segment

% Pelvis
spm_Pelvis = spm1d.stats.hotellings_paired(V1(:,:,1:3), V2(:,:,1:3));
spmi_Pelvis = spm_Pelvis.inference(0.05);
disp(spmi_Pelvis)
figure
spmi_Pelvis.plot();
spmi_Pelvis.plot_threshold_label();
spmi_Pelvis.plot_p_values();
PelvisThreshold = spmi_Pelvis.z/spmi_Pelvis.zstar;

figure
imagesc(PelvisThreshold);
colormap(jet);
%-------------------------------------------------------------------
% Hip
spm_Hip = spm1d.stats.hotellings_paired(V1(:,:,4:6), V2(:,:,4:6));
spmi_Hip = spm_Hip.inference(0.05);
disp(spmi_Hip)
figure
spmi_Hip.plot();
spmi_Hip.plot_threshold_label();
spmi_Hip.plot_p_values();
HipThreshold = spmi_Hip.z/spmi_Hip.zstar;

figure
imagesc(HipThreshold);
colormap(jet);
%---------------------------------------------------------------------
% Knee
spm_Knee = spm1d.stats.hotellings_paired(V1(:,:,7:9), V2(:,:,7:9));
spmi_Knee = spm_Knee.inference(0.05);
disp(spmi_Knee)
figure
spmi_Knee.plot();
spmi_Knee.plot_threshold_label();
spmi_Knee.plot_p_values();
KneeThreshold = spmi_Knee.z/spmi_Knee.zstar;

figure
imagesc(KneeThreshold);
colormap(jet);
%---------------------------------------------------------------------
% AnkleFoot
spm_AnkleFoot = spm1d.stats.hotellings_paired(V1(:,:,10:11), V2(:,:,10:11));
spmi_AnkleFoot = spm_AnkleFoot.inference(0.05);
disp(spmi_AnkleFoot)
figure
spmi_AnkleFoot.plot();
spmi_AnkleFoot.plot_threshold_label();
spmi_AnkleFoot.plot_p_values();
AnkleFootThreshold = spmi_AnkleFoot.z/spmi_AnkleFoot.zstar;

figure
imagesc(AnkleFootThreshold);
colormap(jet);
%---------------------------------------------------------------------

%% By Plane

% Sagittal
spm_Sag = spm1d.stats.hotellings_paired(V1(:,:,[1,4,7,10]), V2(:,:,[1,4,7,10]));
spmi_Sag = spm_Sag.inference(0.05);
disp(spmi_Sag)
figure
spmi_Sag.plot();
spmi_Sag.plot_threshold_label();
spmi_Sag.plot_p_values();
SagThreshold = spmi_Sag.z/spmi_Sag.zstar;

figure
imagesc(SagThreshold);
colormap(jet);
%-------------------------------------------------------------------
% Coronal
spm_Cor = spm1d.stats.hotellings_paired(V1(:,:,[2,5,8]), V2(:,:,[2,5,8]));
spmi_Cor = spm_Cor.inference(0.05);
disp(spmi_Cor)
figure
spmi_Cor.plot();
spmi_Cor.plot_threshold_label();
spmi_Cor.plot_p_values();
CorThreshold = spmi_Cor.z/spmi_Cor.zstar;

figure
imagesc(CorThreshold);
colormap(jet);
%---------------------------------------------------------------------
% Transverse
spm_Tra = spm1d.stats.hotellings_paired(V1(:,:,[3,6,9,11]), V2(:,:,[3,6,9,11]));
spmi_Tra = spm_Tra.inference(0.05);
disp(spmi_Tra)
figure
spmi_Tra.plot();
spmi_Tra.plot_threshold_label();
spmi_Tra.plot_p_values();
TraThreshold = spmi_Tra.z/spmi_Tra.zstar;

figure
imagesc(TraThreshold);
colormap(jet);
%--------------------------------------------------------------------------
%% Indvididual Segment/Joint Angle

% Pelvic Tilt
spm_PelvicTilt = spm1d.stats.ttest_paired(V1(:,:,1), V2(:,:,1));
spmi_PelvicTilt = spm_PelvicTilt.inference(0.05, 'two_tailed', true);
disp(spmi_PelvicTilt)
figure
spmi_PelvicTilt.plot();
spmi_PelvicTilt.plot_threshold_label();
spmi_PelvicTilt.plot_p_values();
PelvicTiltThreshold = abs(spmi_PelvicTilt.z/spmi_PelvicTilt.zstar);

V1mean  = mean(V1(:,:,1));
V1std = std(V1(:,:,1));
V1plus = V1mean+V1std;
V1minus = V1mean-V1std;

V2mean  = mean(V2(:,:,1));
V2std = std(V2(:,:,1));
V2plus = V2mean+V2std;
V2minus = V2mean-V2std;

x = 0:numel(V1mean)-1;
x2 = [x,fliplr(x)];

figure();
ax_main = axes('Position', [0.1 0.4 .8 0.55]);
ax_bottom = axes('Position', [0.1 0.2 .8 0.1]);

axes(ax_main);
inBetweenV1 = [V1plus, fliplr(V1minus)];
fill(x2,inBetweenV1,'b','FaceAlpha',0.25)
hold on
plot(x,V1mean,'b', 'Linestyle','-.','LineWidth',2);
hold on
inBetweenV2 = [V2plus, fliplr(V2minus)];
fill(x2,inBetweenV2,'b','FaceAlpha',0.25)
hold on
plot(x,V2mean,'b','LineWidth',2);


ylabel('Degrees');

axes(ax_bottom);
imagesc(PelvicTiltThreshold);
colormap(jet);
xlabel('% Gait Cycle','FontSize',12);
set(gca,'ytick',[])
set(gca,'xtick',[])
%--------------------------------------------------------------------------

% Pelvic Obliquity
spm_PelvicObliq = spm1d.stats.ttest_paired(V1(:,:,2), V2(:,:,2));
spmi_PelvicObliq = spm_PelvicObliq.inference(0.05, 'two_tailed', true);
disp(spmi_PelvicObliq)
figure
spmi_PelvicObliq.plot();
spmi_PelvicObliq.plot_threshold_label();
spmi_PelvicObliq.plot_p_values();
PelvicObliqThreshold = abs(spmi_PelvicObliq.z/spmi_PelvicObliq.zstar);

figure
imagesc(PelvicObliqThreshold);
colormap(jet);
%--------------------------------------------------------------------------

% Pelvic Rotation
spm_PelvicRot = spm1d.stats.ttest_paired(V1(:,:,3), V2(:,:,3));
spmi_PelvicRot = spm_PelvicRot.inference(0.05, 'two_tailed', true);
disp(spmi_PelvicRot)
figure
spmi_PelvicRot.plot();
spmi_PelvicRot.plot_threshold_label();
spmi_PelvicRot.plot_p_values();
PelvicRotThreshold = abs(spmi_PelvicRot.z/spmi_PelvicRot.zstar);

figure
imagesc(PelvicRotThreshold);
colormap(jet);
%--------------------------------------------------------------------------






%(1) Conduct SPM analysis:
spm       = spm1d.stats.hotellings_paired(V1, V2);
spmi      = spm.inference(0.05);
disp(spmi)


%(2) Plot:
close all
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();

V1Pelvis = V1(:,:,[3,6,9,11]);
V2Pelvis = V2(:,:,[3,6,9,11]);

spm       = spm1d.stats.hotellings_paired(V1Pelvis, V2Pelvis);
spmi      = spm.inference(0.05);
disp(spmi)
