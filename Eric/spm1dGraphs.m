function [ ] = spm1dGraphs(V1, V2, side, graphTitle, ymin, ymax,savePath)

savePathFull = strcat(savePath,'\spm1d\');

if ~exist(char(savePathFull) , 'dir')
    % Folder does not exist so create it.
    mkdir(char(savePathFull));
end

% Check side
if strcmpi('left',side)==1
    color = [8 81 156] ./ 255;
else
    color = [222 45 38] ./ 255;
end

%% Statistical parameteric mapping
spm = spm1d.stats.ttest_paired(V1, V2);
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

V2mean  = mean(V2);
V2std = std(V2);
V2plus = V2mean+V2std;
V2minus = V2mean-V2std;

x = 0:numel(V1mean)-1;
x2 = [x,fliplr(x)];
%% check y-axis limits and adjust if outside pre-defined limits
ytempmin = min(min([V1',V2']));
ytempmax = max(max([V1',V2']));

if ytempmin < ymin
    ymin = 5*floor(ytempmin/5);
end

if ytempmax > ymax
    ymax = 5*ceil(ytempmax/5);
end


%% Set up axes for figure
f2 = figure();
ax_main = axes('Position', [0.1 0.4 .8 0.55]);
ax_bottom = axes('Position', [0.1 0.2 .8 0.1]);
%% plot kinematic data in main axis
axes(ax_main);
inBetweenV1 = [V1plus, fliplr(V1minus)];
fill(x2,inBetweenV1,color,'FaceAlpha',0.25)
hold on
plot(x,V1mean,color, 'Linestyle','-.','LineWidth',2);
hold on
inBetweenV2 = [V2plus, fliplr(V2minus)];
fill(x2,inBetweenV2,color,'FaceAlpha',0.25)
hold on
plot(x,V2mean,color,'LineWidth',2);
title(graphTitle);
ylim([ymin,ymax]);
ylabel('Degrees');
%% plot spm1d results as color bar in secondary axis
axes(ax_bottom);
imagesc(Threshold);
colormap(jet);
caxis([0 4]);
xlabel('% Gait Cycle','FontSize',12);
set(gca,'ytick',[]);
set(gca,'xtick',[]);
%% save image to patients folder
CombinedImage = strcat(char(savePathFull),'\',graphTitle,'_',side,'_combinedImage');
print(CombinedImage,'-dpng');
close(f2)




















