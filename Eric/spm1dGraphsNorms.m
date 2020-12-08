function [ ] = spm1dGraphsNorms(V1, V3, side, graphTitle, ymin, ymax,savePath)

savePathFull = strcat(savePath,'\spm1d\');

if ~exist(char(savePathFull) , 'dir')
    % Folder does not exist so create it.
    mkdir(char(savePathFull));
end

% Check side
if strcmpi('left',side)==1
    color = [8 81 156] ./ 255;% blue
else
    color = [222 45 38] ./ 255; %red
end

%remove any NaNs
V1 = V1(all(~isnan(V1),2),:);
V3 = V3(all(~isnan(V3),2),:);

%% Statistical parameteric mapping
spm = spm1d.stats.ttest2(V1, V3);
spmi = spm.inference(0.05, 'two_tailed', true);
disp(spmi)

f1 = figure;
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();
title(graphTitle);
StatImage = strcat(char(savePathFull),'\',graphTitle,'_',side,'_statImage');
print(StatImage,'-dpng');
close(f1)

Threshold = abs(spmi.z/spmi.zstar);
%% Calculate mean and standard deviation for plotting
V1mean  = mean(V1);
V1std = std(V1);
V1plus = V1mean+V1std;
V1minus = V1mean-V1std;

V3mean  = mean(V3);
V3std = std(V3);
V3plus = V3mean+V3std;
V3minus = V3mean-V3std;

x = 0:numel(V1mean)-1;
x2 = [x,fliplr(x)];
%% check y-axis limits and adjust if outside pre-defined limits
ytempmin = min(min([V1',V3']));
ytempmax = max(max([V1',V3']));

if ytempmin < ymin
    ymin = 5*floor(ytempmin/5);
end

if ytempmax > ymax
    ymax = 5*ceil(ytempmax/5);
end


%% Set up axes for figure
f2 = figure();
ax_main = axes('Position', [0.1 0.3 .8 0.55]);
ax_bottom = axes('Position', [0.1 0.1 .8 0.1]);
%% plot kinematic data in main axis
axes(ax_main);
inBetweenV1 = [V1plus, fliplr(V1minus)];
fill(x2,inBetweenV1,color,'FaceAlpha',0.50, 'EdgeColor','none')
hold on
% plot(x,V1mean,color, 'Linestyle','-.','LineWidth',2);
% hold on
inBetweenV3 = [V3plus, fliplr(V3minus)];
fill(x2,inBetweenV3,[106 193 99]./ 255,'FaceAlpha',0.50,'EdgeColor','none')
hold on
% plot(x,V3mean,'g','LineWidth',2);
title(graphTitle, 'FontSize',12);
ylim([ymin,ymax]);
ylabel('Degrees');
%% plot spm1d results as color bar in secondary axis
axes(ax_bottom);
imagesc(Threshold);
colormap('jet');
caxis([0 4]);
xlabel('% Gait Cycle','FontSize',12);
set(gca,'ytick',[]);
set(gca,'xtick',[]);
%% save image to patients folder
CombinedImage = strcat(char(savePathFull),'\',graphTitle,'_',side,'_combinedImage');
print(CombinedImage,'-dpng');
close(f2)






