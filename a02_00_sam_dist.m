%% Visualization SAM-Survey Data

%% Setup and create folder

resultsFolder = 'results/a02_sam_analysis';

figuresFolder = fullfile(resultsFolder, 'figures_sam_dist');
if ~exist(figuresFolder, 'dir')
    mkdir(figuresFolder);
end

%% Pleasure Data

% Define groups by gender and valence
malePosRats = sam.Pleasure(strcmp(sam.GenderStr, 'male') & strcmp(sam.ValenceStr, 'positive'));
maleNegRats = sam.Pleasure(strcmp(sam.GenderStr, 'male') & strcmp(sam.ValenceStr, 'negative'));
femalePosRats = sam.Pleasure(strcmp(sam.GenderStr, 'female') & strcmp(sam.ValenceStr, 'positive'));
femaleNegRats = sam.Pleasure(strcmp(sam.GenderStr, 'female') & strcmp(sam.ValenceStr, 'negative'));

% Adapt bins
edges = 0.5:1:9.5;
binCenters = edges(1:end-1) + 0.5;

% Calculation and normalization of data
[countMalePos, ~] = histcounts(malePosRats, edges, 'Normalization', 'probability');
[countFemalePos, ~] = histcounts(femalePosRats, edges, 'Normalization', 'probability');
[countMaleNeg, ~] = histcounts(maleNegRats, edges, 'Normalization', 'probability');
[countFemaleNeg, ~] = histcounts(femaleNegRats, edges, 'Normalization', 'probability');

% Group frequencies by valence
countsNegative = [countFemaleNeg; countMaleNeg]';
countsPositive = [countFemalePos; countMalePos]';

% Plot
figure('Position',[100 100 900 500]); hold on;

% Visualization of negative frequencies
barNegative = bar(binCenters, -countsNegative, 'BarWidth', 1);
barNegative(1).FaceColor = femaleColor; 
barNegative(2).FaceColor = maleColor; 
barNegative(1).EdgeColor = 'k';
barNegative(2).EdgeColor = 'k';
barNegative(1).LineWidth = 1.5;
barNegative(2).LineWidth = 1.5;
barNegative(1).LineStyle = "-";
barNegative(2).LineStyle = "-";
barNegative(1).FaceAlpha = 0.4;
barNegative(2).FaceAlpha = 0.6;

% Visualization of positive frequencies
barPositive = bar(binCenters, countsPositive, 'BarWidth', 1);
barPositive(1).FaceColor = femaleColor;
barPositive(2).FaceColor = maleColor;
barPositive(1).EdgeColor = 'k';
barPositive(2).EdgeColor = 'k';
barPositive(1).LineWidth = 1.5;
barPositive(2).LineWidth = 1.5;
barPositive(1).LineStyle = ":";
barPositive(2).LineStyle = ":";
barPositive(1).FaceAlpha = 0.4;
barPositive(2).FaceAlpha = 0.6;

% Define axes and legend
xlim([0.5 9.5]);
xticks(1:9);
yt = yticks;
yticklabels(arrayfun(@(x) num2str(abs(x)), yt, 'UniformOutput', false));
xlabel('Pleasure Ratings');
ylabel('Relative Frequency');
title('Pleasure Ratings by Gender and Valence');
legend({'Female Unpleasant','Male Unpleasant', 'Female Pleasant','Male Pleasant',}, 'Location', 'northeastoutside');

grid on;
hold off;

% Export figure
exportgraphics(gcf, fullfile(figuresFolder, 'hist_Pleasure_all.png'), 'Resolution', 300);

%% Arousal Data

% Define groups by gender and valence
malePosRats = sam.Arousal(strcmp(sam.GenderStr, 'male') & strcmp(sam.ValenceStr, 'positive'));
maleNegRats = sam.Arousal(strcmp(sam.GenderStr, 'male') & strcmp(sam.ValenceStr, 'negative'));
femalePosRats = sam.Arousal(strcmp(sam.GenderStr, 'female') & strcmp(sam.ValenceStr, 'positive'));
femaleNegRats = sam.Arousal(strcmp(sam.GenderStr, 'female') & strcmp(sam.ValenceStr, 'negative'));

% Adapt bins
edges = 0.5:1:9.5;
binCenters = edges(1:end-1) + 0.5;

% Calculation and normalization of data
[countMalePos, ~] = histcounts(malePosRats, edges, 'Normalization', 'probability');
[countFemalePos, ~] = histcounts(femalePosRats, edges, 'Normalization', 'probability');
[countMaleNeg, ~] = histcounts(maleNegRats, edges, 'Normalization', 'probability');
[countFemaleNeg, ~] = histcounts(femaleNegRats, edges, 'Normalization', 'probability');

% Group frequencies by valence
countsNegative = [countFemaleNeg; countMaleNeg]';
countsPositive = [countFemalePos; countMalePos]';

% Plot
figure('Position',[100 100 900 500]); hold on;

% Visualization of negative frequencies
barNegative = bar(binCenters, -countsNegative, 'BarWidth', 1);
barNegative(1).FaceColor = femaleColor; 
barNegative(2).FaceColor = maleColor; 
barNegative(1).EdgeColor = 'k';
barNegative(2).EdgeColor = 'k';
barNegative(1).LineWidth = 1.5;
barNegative(2).LineWidth = 1.5;
barNegative(1).LineStyle = "-";
barNegative(2).LineStyle = "-";
barNegative(1).FaceAlpha = 0.4;
barNegative(2).FaceAlpha = 0.6;

% Visualization of positive frequencies
barPositive = bar(binCenters, countsPositive, 'BarWidth', 1);
barPositive(1).FaceColor = femaleColor;
barPositive(2).FaceColor = maleColor;
barPositive(1).EdgeColor = 'k';
barPositive(2).EdgeColor = 'k';
barPositive(1).LineWidth = 1.5;
barPositive(2).LineWidth = 1.5;
barPositive(1).LineStyle = ":";
barPositive(2).LineStyle = ":";
barPositive(1).FaceAlpha = 0.4;
barPositive(2).FaceAlpha = 0.6;

% Define axes and legend
xlim([0.5 9.5]);
xticks(1:9);
yt = yticks;
yticklabels(arrayfun(@(x) num2str(abs(x)), yt, 'UniformOutput', false));
xlabel('Arousal Ratings');
ylabel('Relative Frequency');
title('Arousal Ratings by Gender and Valence');
legend({'Female Unpleasant','Male Unpleasant', 'Female Pleasant','Male Pleasant',}, 'Location', 'northeastoutside');

grid on;
hold off;

% Export figure
exportgraphics(gcf, fullfile(figuresFolder, 'hist_Arousal_all.png'), 'Resolution', 300);

%% Dominance Data

% Define groups by gender and valence
malePosRats = sam.Dominance(strcmp(sam.GenderStr, 'male') & strcmp(sam.ValenceStr, 'positive'));
maleNegRats = sam.Dominance(strcmp(sam.GenderStr, 'male') & strcmp(sam.ValenceStr, 'negative'));
femalePosRats = sam.Dominance(strcmp(sam.GenderStr, 'female') & strcmp(sam.ValenceStr, 'positive'));
femaleNegRats = sam.Dominance(strcmp(sam.GenderStr, 'female') & strcmp(sam.ValenceStr, 'negative'));

% Adapt bins
edges = 0.5:1:9.5;
binCenters = edges(1:end-1) + 0.5;

% Calculation and normalization of data
[countMalePos, ~] = histcounts(malePosRats, edges, 'Normalization', 'probability');
[countFemalePos, ~] = histcounts(femalePosRats, edges, 'Normalization', 'probability');
[countMaleNeg, ~] = histcounts(maleNegRats, edges, 'Normalization', 'probability');
[countFemaleNeg, ~] = histcounts(femaleNegRats, edges, 'Normalization', 'probability');

% Group frequencies by valence
countsNegative = [countFemaleNeg; countMaleNeg]';
countsPositive = [countFemalePos; countMalePos]';

% Plot
figure('Position',[100 100 900 500]); hold on;

% Visualization of negative frequencies
barNegative = bar(binCenters, -countsNegative, 'BarWidth', 1);
barNegative(1).FaceColor = femaleColor; 
barNegative(2).FaceColor = maleColor; 
barNegative(1).EdgeColor = 'k';
barNegative(2).EdgeColor = 'k';
barNegative(1).LineWidth = 1.5;
barNegative(2).LineWidth = 1.5;
barNegative(1).LineStyle = "-";
barNegative(2).LineStyle = "-";
barNegative(1).FaceAlpha = 0.4;
barNegative(2).FaceAlpha = 0.6;

% Visualization of positive frequencies
barPositive = bar(binCenters, countsPositive, 'BarWidth', 1);
barPositive(1).FaceColor = femaleColor;
barPositive(2).FaceColor = maleColor;
barPositive(1).EdgeColor = 'k';
barPositive(2).EdgeColor = 'k';
barPositive(1).LineWidth = 1.5;
barPositive(2).LineWidth = 1.5;
barPositive(1).LineStyle = ":";
barPositive(2).LineStyle = ":";
barPositive(1).FaceAlpha = 0.4;
barPositive(2).FaceAlpha = 0.6;

% Define axes and legend
xlim([0.5 9.5]);
xticks(1:9);
yt = yticks;
yticklabels(arrayfun(@(x) num2str(abs(x)), yt, 'UniformOutput', false));
xlabel('Dominance Ratings');
ylabel('Relative Frequency');
title('Dominance Ratings by Gender and Valence');
legend({'Female Unpleasant','Male Unpleasant', 'Female Pleasant','Male Pleasant',}, 'Location', 'northeastoutside');

grid on;
hold off;

% Export figure
exportgraphics(gcf, fullfile(figuresFolder, 'hist_Dominance_all.png'), 'Resolution', 300);

close all;
