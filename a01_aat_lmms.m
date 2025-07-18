%% Analysis - AAT

%% Setup and create folders
resultsFolder = 'results/a01_aat_lmms';
figuresFolder = fullfile(resultsFolder, 'figures_aat_lmms');
if ~exist(resultsFolder, 'dir')
    mkdir(resultsFolder);
end
if ~exist(figuresFolder, 'dir')
    mkdir(figuresFolder);
end

% File path for the text file and open file for writing
txtFile = fullfile(resultsFolder, 'aat_lmms.txt');
fileID = fopen(txtFile, 'w');

%% AAT: Descriptive Analysis
fprintf(fileID, '\n======================================\n');
fprintf(fileID, '=== AAT: Descriptive Analysis ========\n');
fprintf(fileID, '======================================\n');

% Histogram all RTs
figure;
histogram(aat.RTms);
xlim([0 5000]);
xlabel('RT in ms');
ylabel('Frequency');
title('Frequencies of Reaction Times in AAT');
exportgraphics(gcf, fullfile(figuresFolder, 'histogram_all_RTs.png'), 'Resolution', 300);

% Histogram all LogRTs
figure;
histogram(aat.LogRT);
xlabel('LogRT');
ylabel('Frequency');
title('All Logarithmic Reaction Times');
exportgraphics(gcf, fullfile(figuresFolder, 'histogram_all_LogRTs.png'), 'Resolution', 300);

% Overall Mean + SD
mean_overall = mean(aat.RTms);
std_overall = std(aat.RTms);

% Mean + SD by Gender
stats_gender = grpstats(aat, 'GenderStr', {'mean', 'std'}, 'DataVars', 'RTms');
% Mean + SD by Valence
stats_valence = grpstats(aat, 'ValenceStr', {'mean', 'std'}, 'DataVars', 'RTms');
% Mean + SD by Condition
stats_condition = grpstats(aat, 'ConditionStr', {'mean', 'std'}, 'DataVars', 'RTms');
% Mean + SD by Gender + Valence
stats_gender_valence = grpstats(aat, {'GenderStr', 'ValenceStr'}, {'mean', 'std'}, 'DataVars', 'RTms');
% Mean + SD by Gender + Condition
stats_gender_condition = grpstats(aat, {'GenderStr', 'ConditionStr'}, {'mean', 'std'}, 'DataVars', 'RTms');

% print overall mean and SD in file
fprintf(fileID, '\nMean RT overall: %.2f ms; ', abs(mean_overall));
fprintf(fileID, 'SD overall: %.2f ms\n', abs(std_overall));

% print mean + SD by gender
fprintf(fileID, '\nGender\t\tn\t    mean RT in ms\tSD\n');
for i = 1:height(stats_gender)
    fprintf(fileID, '%s\t\t%.0f\t%.2f\t\t\t%.2f\n', stats_gender{i, :});
end

% Calculate and print gender difference in ms and percent
mean_male = stats_gender.mean_RTms(strcmpi(stats_gender.GenderStr, 'male'));
mean_female = stats_gender.mean_RTms(strcmpi(stats_gender.GenderStr, 'female'));
percent_diff = (mean_male - mean_female) / mean_female * 100;
if percent_diff > 0
    direction = 'higher';
else
    direction = 'lower';
end
fprintf(fileID, '\nMean RT in men was %.2f ms or %.2f%% %s than mean RT in women.\n', abs(mean_male-mean_female), abs(percent_diff), direction);
fprintf(fileID, 'Thus, men responded %.2f ms or %.2f%% faster than women.\n', abs(mean_male-mean_female), abs(percent_diff));

% print mean + SD by valence
fprintf(fileID, '\nValence\t\tn\t    mean RT in ms\tSD\n');
for i = 1:height(stats_valence)
    fprintf(fileID, '%s\t%.0f\t%.2f\t\t\t%.2f\n', stats_valence{i, :});
end

% Calculate and print valence difference in ms and percent
mean_pos = stats_valence.mean_RTms(strcmpi(stats_valence.ValenceStr, 'positive'));
mean_neg = stats_valence.mean_RTms(strcmpi(stats_valence.ValenceStr, 'negative'));
percent_diff = (mean_pos - mean_neg) / mean_neg * 100;
if percent_diff > 0
    direction = 'higher';
else
    direction = 'lower';
end
fprintf(fileID, '\nMean RT to pleasant stimuli was %.2f ms or %.2f%% %s than to unpleasant ones.\n', abs(mean_pos - mean_neg), abs(percent_diff), direction);
fprintf(fileID, 'Thus, pleasant stimuli were reacted to %.2f ms or %.2f%% faster than unpleasant ones.\n', abs(mean_pos - mean_neg), abs(percent_diff));

% print mean + SD by condition
fprintf(fileID, '\nCondition\t\tn\t    mean RT in ms\tSD\n');
for i = 1:height(stats_condition)
    fprintf(fileID, '%s\t\t%.0f\t%.2f\t\t\t%.2f\n', stats_condition{i, :});
end

% Calculate and print condition difference in ms and percent
mean_con = stats_condition.mean_RTms(strcmpi(stats_condition.ConditionStr, 'congruent'));
mean_incon = stats_condition.mean_RTms(strcmpi(stats_condition.ConditionStr, 'incongruent'));
percent_diff = (mean_con - mean_incon) / mean_incon * 100;
if percent_diff > 0
    direction = 'higher';
else
    direction = 'lower';
end
fprintf(fileID, '\nMean RT to the congruent condition was %.2f ms or %.2f%% %s than to the incongruent one.\n', abs(mean_con - mean_incon), abs(percent_diff), direction);
fprintf(fileID, 'Thus, in the congruent condition, participants reacted %.2f ms or %.2f%% faster than in the incongruent one.\n', abs(mean_con - mean_incon), abs(percent_diff));

% print mean + SD by gender and valence
fprintf(fileID, '\nGender\tValence\t\tn\t    mean RT in ms\tSD\n');
for i = 1:height(stats_gender_valence)
    fprintf(fileID, '%s\t%s\t%.0f\t%.2f\t\t\t%.2f\n', stats_gender_valence{i, :});
end

% Calculate and print valence difference by gender in ms and percent
mean_male_pos = stats_gender_valence.mean_RTms(strcmpi(stats_gender_valence.GenderStr, 'male') & strcmpi(stats_gender_valence.ValenceStr, 'positive'));
mean_male_neg = stats_gender_valence.mean_RTms(strcmpi(stats_gender_valence.GenderStr, 'male') & strcmpi(stats_gender_valence.ValenceStr, 'negative'));
mean_female_pos = stats_gender_valence.mean_RTms(strcmpi(stats_gender_valence.GenderStr, 'female') & strcmpi(stats_gender_valence.ValenceStr, 'positive'));
mean_female_neg = stats_gender_valence.mean_RTms(strcmpi(stats_gender_valence.GenderStr, 'female') & strcmpi(stats_gender_valence.ValenceStr, 'negative'));

% male participants
percent_diff = (mean_male_pos - mean_male_neg) / mean_male_neg * 100;
if percent_diff > 0
    direction = 'higher';
else
    direction = 'lower';
end
fprintf(fileID, '\nMean RT in men to pleasant stimuli was %.2f ms or %.2f%% %s than to unpleasant ones.\n', abs(mean_male_pos - mean_male_neg), abs(percent_diff), direction);
fprintf(fileID, 'Thus, men reacted %.2f ms or %.2f%% faster to pleasant than to unpleasant stimuli.\n', abs(mean_male_pos - mean_male_neg), abs(percent_diff));

% female participants
percent_diff = (mean_female_pos - mean_female_neg) / mean_female_neg * 100;
if percent_diff > 0
    direction = 'higher';
else
    direction = 'lower';
end
fprintf(fileID, '\nMean RT in women to pleasant stimuli was %.2f ms or %.2f%% %s than to unpleasant ones.\n', abs(mean_female_pos - mean_female_neg), abs(percent_diff), direction);
fprintf(fileID, 'Thus, women reacted %.2f ms or %.2f%% faster to pleasant than to unpleasant stimuli.\n', abs(mean_female_pos - mean_female_neg), abs(percent_diff));

% print mean + SD by gender and condition
fprintf(fileID, '\nGender\tCondition\t\tn\t    mean RT in ms\tSD\n');
for i = 1:height(stats_gender_valence)
    fprintf(fileID, '%s\t%s\t\t%.0f\t%.2f\t\t\t%.2f\n', stats_gender_condition{i, :});
end

% Calculate and print condition difference by gender in ms and percent
mean_male_con = stats_gender_condition.mean_RTms(strcmpi(stats_gender_condition.GenderStr, 'male') & strcmpi(stats_gender_condition.ConditionStr, 'congruent'));
mean_male_incon = stats_gender_condition.mean_RTms(strcmpi(stats_gender_condition.GenderStr, 'male') & strcmpi(stats_gender_condition.ConditionStr, 'incongruent'));
mean_female_con = stats_gender_condition.mean_RTms(strcmpi(stats_gender_condition.GenderStr, 'female') & strcmpi(stats_gender_condition.ConditionStr, 'congruent'));
mean_female_incon = stats_gender_condition.mean_RTms(strcmpi(stats_gender_condition.GenderStr, 'female') & strcmpi(stats_gender_condition.ConditionStr, 'incongruent'));

% male participants
percent_diff = (mean_male_con - mean_male_incon) / mean_male_incon * 100;
if percent_diff > 0
    direction = 'higher';
else
    direction = 'lower';
end
fprintf(fileID, '\nMean RT in men in the congruent condition was %.2f ms or %.3f%% %s than in the incongruent one.\n', abs(mean_male_con - mean_male_incon), abs(percent_diff), direction);
fprintf(fileID, 'Thus, men reacted %.2f ms or %.2f%% faster in the congruent than in the incongruent condition.\n', abs(mean_male_con - mean_male_incon), abs(percent_diff));

% female participants
percent_diff = (mean_female_con - mean_female_incon) / mean_female_incon * 100;
if percent_diff > 0
    direction = 'higher';
else
    direction = 'lower';
end
fprintf(fileID, '\nMean RT in women in the congruent condition was %.2f ms or %.2f%% %s than in the incongruent one.\n', abs(mean_female_con - mean_female_incon), abs(percent_diff), direction);
fprintf(fileID, 'Thus, women reacted %.2f ms or %.2f%% faster in the congruent than in the incongruent condition.\n', abs(mean_female_con - mean_female_incon), abs(percent_diff));

%% All data, effects of gender, valence and condition on RTs in AAT
fprintf(fileID, '\n=================================================\n');
fprintf(fileID, '=== LMM AAT - GENDER, VALENCE, CONDITION ========\n');
fprintf(fileID, '=================================================\n');

%% Effect-coded LMM for all data; effects of gender, valence, condition on RTs in AAT
lme_aat = fitlme(aat, 'LogRT ~ 1 + Gender*Condition + Gender*Valence + (1|Participant) + (1|Picture)', 'DummyVarCoding','effects');

% Model summary and fit
lme_aat_disp = evalc('disp(lme_aat)');
clean_output = regexprep(lme_aat_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values and export
yfit = fitted(lme_aat);
ytrue = aat.LogRT;
f_aat_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_aat_FO, fullfile(figuresFolder, 'LME_AAT_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_aat);
yfit = fitted(lme_aat);
f_aat_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0); 
grid on
exportgraphics(f_aat_RF, fullfile(figuresFolder, 'LME_AAT_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_aat);
f_aat_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_aat_R, fullfile(figuresFolder, 'LME_AAT_residuals_hist.png'), 'Resolution', 300);


%% Transformation of estimates

fprintf(fileID, '\n===Transformed Estimates===\n');

[estimates, names, stats] = fixedEffects(lme_aat);
re_part = 0.071001;
re_pic = 0.027285;
re_res = 0.117;

re = zeros(3, 1);
re(1) = re_part;
re(2) = re_pic;
re(3) = re_res;
reSD = zeros(3, 1);
rePer = zeros(3, 1);
re_name = {'Participant', 'Picture', 'Residual'};

beta_inter = estimates(1);
inter_back = 10^beta_inter;
inter_RT = inter_back * 1000;

fprintf(fileID, '\n---Random Effects---\n');

for i = 1:3
    rePer(i) = 100 * (10^re(i) - 1);
    reSD(i) = inter_RT * rePer(i) / 100;
    fprintf(fileID, '%s: Estimate = %.4f, SD percentage = %.2f%%, SD = %.2f ms\n', ...
        re_name{i}, ...
        re(i), ...
        rePer(i), ...
        reSD(i));
end

fprintf(fileID, '\n');

l = length(estimates);
this_back = zeros(l,1);
this_RT = zeros(l,1);
diff_RT = zeros(l,1);
percentage_diff = zeros(l,1);

this_back(1) = 10^estimates(1);
this_RT(1) = this_back(1) * 1000;
diff_RT(1) = this_RT(1) - inter_RT;
percentage_diff(1) = 100*diff_RT(1)/inter_RT;

for i = 2:4
    this_back(i) = 10^(estimates(i)+beta_inter);
    this_RT(i) = this_back(i)*1000;
    diff_RT(i) = this_RT(i) - inter_RT;
    percentage_diff(i) = 100*diff_RT(i)/inter_RT;
end

for i = 5:6
    this_back(i) = 10^(beta_inter + estimates(2) + estimates(i-2) + estimates(i));
    this_RT(i) = this_back(i) * 1000;
    back_minus_this = 10^(beta_inter + estimates(2) + estimates(i-2));
    this_diff = this_back(i) - back_minus_this;
    diff_RT(i) = this_diff * 1000;
    percentage_diff(i) = 100*diff_RT(i)/inter_RT;
end

fprintf(fileID, '\n---Fixed Effects---\n');

for i = 1:length(estimates)
    fprintf(fileID, '%s: beta = %.4f, 10^beta = %.4f, RT = %.3f ms, deltaRT = %.3f ms, diff percentage = %.3f%%\n', ...
        strjoin(names{i, :}), ...
        estimates(i), ...
        this_back(i), ...
        this_RT(i), ...
        diff_RT (i), ...
        percentage_diff(i));
end


%% Gender-specific LMMs
fprintf(fileID, '\n=====================================================\n');
fprintf(fileID, '=== LMM AAT - GENDER-SPECIFIC: VALENCE, CONDITION ===\n');
fprintf(fileID, '=====================================================\n');

%% Effect-coded LMM for male participant data; effects of valence and condition on RTs in AAT

fprintf(fileID, '\n-------------------------------------------------------\n');
fprintf(fileID, '--- LMM AAT - MALE PARTICIPANTS: VALENCE, CONDITION ---\n');
fprintf(fileID, '-------------------------------------------------------\n');

lme_aat_male = fitlme(aat_male, 'LogRT ~ 1 + Condition + Valence + (1|Participant) + (1|Picture)', 'DummyVarCoding','effects');

% Model summary and fit
lme_aat_male_disp = evalc('disp(lme_aat_male)');
clean_output = regexprep(lme_aat_male_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_aat_male);
ytrue = aat_male.LogRT;
f_aat_m_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_aat_m_FO, fullfile(figuresFolder, 'LME_AAT_male_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_aat_male);
yfit = fitted(lme_aat_male);
f_aat_m_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0);
grid on
exportgraphics(f_aat_m_RF, fullfile(figuresFolder, 'LME_AAT_male_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_aat_male);
f_aat_m_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_aat_m_R, fullfile(figuresFolder, 'LME_AAT_male_residuals_hist.png'), 'Resolution', 300);

%% Effect-coded LMM for female participant data; effects of valence and condition on RTs in AAT
fprintf(fileID, '\n---------------------------------------------------------\n');
fprintf(fileID, '--- LMM AAT - FEMALE PARTICIPANTS: VALENCE, CONDITION ---\n');
fprintf(fileID, '---------------------------------------------------------\n');

lme_aat_female = fitlme(aat_female, 'LogRT ~ 1 + Condition + Valence + (1|Participant) + (1|Picture)', 'DummyVarCoding','effects');

% Model summary and fit
lme_aat_female_disp = evalc('disp(lme_aat_female)');
clean_output = regexprep(lme_aat_female_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_aat_female);
ytrue = aat_female.LogRT;
f_aat_f_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_aat_f_FO, fullfile(figuresFolder, 'LME_AAT_female_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_aat_female);
yfit = fitted(lme_aat_female);
f_aat_f_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0); 
grid on
exportgraphics(f_aat_f_RF, fullfile(figuresFolder, 'LME_AAT_female_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_aat_female);
f_aat_f_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_aat_f_R, fullfile(figuresFolder, 'LME_AAT_female_residuals_hist.png'), 'Resolution', 300);


%% Effect-coded LMM for pleasant stimuli data; effects of gender and condition on RTs in AAT
fprintf(fileID, '\n---------------------------------------------------------\n');
fprintf(fileID, '--- LMM AAT - PLEASANT STIMULI: GENDER, CONDITION ---\n');
fprintf(fileID, '---------------------------------------------------------\n');

lme_aat_pos = fitlme(aat_pos, 'LogRT ~ 1 + Condition * Gender + (1|Participant) + (1|Picture)', 'DummyVarCoding','effects');

% Model summary and fit
lme_aat_pos_disp = evalc('disp(lme_aat_pos)');
clean_output = regexprep(lme_aat_pos_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_aat_pos);
ytrue = aat_pos.LogRT;
f_aat_f_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_aat_f_FO, fullfile(figuresFolder, 'LME_AAT_positive_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_aat_pos);
yfit = fitted(lme_aat_pos);
f_aat_f_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0); 
grid on
exportgraphics(f_aat_f_RF, fullfile(figuresFolder, 'LME_AAT_positive_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_aat_pos);
f_aat_f_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_aat_f_R, fullfile(figuresFolder, 'LME_AAT_positive_residuals_hist.png'), 'Resolution', 300);

close all;