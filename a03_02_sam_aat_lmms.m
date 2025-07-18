%% Analysis - SAM + AAT

%% Setup and create folders
resultsFolder = 'results/a03_sam_aat_analysis';
figuresFolder = fullfile(resultsFolder, 'figures_sam_aat_lmms');
if ~exist(resultsFolder, 'dir')
    mkdir(resultsFolder);
end
if ~exist(figuresFolder, 'dir')
    mkdir(figuresFolder);
end

% File path for the text file and open file for writing
txtFile = fullfile(resultsFolder, 'sam_aat_lmms.txt');
fileID = fopen(txtFile, 'w');

%% print headline
fprintf(fileID, '\n======================================\n');
fprintf(fileID, '=== Gender-Specific LMMs AAT + SAM ===\n');
fprintf(fileID, '======================================\n');

%% LMM for male participant data; effects of pleasure and condition on RTs in AAT

fprintf(fileID, '\n-----------------------------------------------\n');
fprintf(fileID, '--- MALE PARTICIPANTS: PLEASURE + CONDITION ---\n');
fprintf(fileID, '-----------------------------------------------\n');

lme_all_male = fitlme(all_male, 'LogRT ~ 1 + Condition + pleasure_mean_male + (1|Participant) + (1|Picture)');

% Model summary and fit
lme_all_male_disp = evalc('disp(lme_all_male)');
clean_output = regexprep(lme_all_male_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_all_male);
ytrue = all_male.LogRT;
f_all_m_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_all_m_FO, fullfile(figuresFolder, 'LME_plRT_male_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_all_male);
yfit = fitted(lme_all_male);
f_all_m_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0);
grid on
exportgraphics(f_all_m_RF, fullfile(figuresFolder, 'LME_plRT_male_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_all_male);
f_all_m_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_all_m_R, fullfile(figuresFolder, 'LME_plRT_male_residuals_hist.png'), 'Resolution', 300);

%% LMM for female participant data; effects of pleasure and condition on RTs in AAT
fprintf(fileID, '\n-------------------------------------------------\n');
fprintf(fileID, '--- FEMALE PARTICIPANTS: PLEASURE + CONDITION ---\n');
fprintf(fileID, '-------------------------------------------------\n');

lme_all_female = fitlme(all_female, 'LogRT ~ 1 + Condition + pleasure_mean_female + (1|Participant) + (1|Picture)');

% Model summary and fit
lme_all_female_disp = evalc('disp(lme_all_female)');
clean_output = regexprep(lme_all_female_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_all_female);
ytrue = all_female.LogRT;
f_all_f_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_all_f_FO, fullfile(figuresFolder, 'LME_plRT_female_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_all_female);
yfit = fitted(lme_all_female);
f_all_f_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0); 
grid on
exportgraphics(f_all_f_RF, fullfile(figuresFolder, 'LME_plRT_female_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_all_female);
f_all_f_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_all_f_R, fullfile(figuresFolder, 'LME_plRT_female_residuals_hist.png'), 'Resolution', 300);

%% LMM for male participant data; effects of arousal and condition on RTs in AAT

fprintf(fileID, '\n----------------------------------------------\n');
fprintf(fileID, '--- MALE PARTICIPANTS: AROUSAL + CONDITION ---\n');
fprintf(fileID, '----------------------------------------------\n');

lme_all_male = fitlme(all_male, 'LogRT ~ 1 + Condition + arousal_mean_male + (1|Participant) + (1|Picture)');

% Model summary and fit
lme_all_male_disp = evalc('disp(lme_all_male)');
clean_output = regexprep(lme_all_male_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_all_male);
ytrue = all_male.LogRT;
f_all_m_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_all_m_FO, fullfile(figuresFolder, 'LME_arRT_male_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_all_male);
yfit = fitted(lme_all_male);
f_all_m_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0);
grid on
exportgraphics(f_all_m_RF, fullfile(figuresFolder, 'LME_arRT_male_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_all_male);
f_all_m_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_all_m_R, fullfile(figuresFolder, 'LME_arRT_male_residuals_hist.png'), 'Resolution', 300);

%% LMM for female participant data; effects of arousal and condition on RTs in AAT
fprintf(fileID, '\n------------------------------------------------\n');
fprintf(fileID, '--- FEMALE PARTICIPANTS: AROUSAL + CONDITION ---\n');
fprintf(fileID, '------------------------------------------------\n');

lme_all_female = fitlme(all_female, 'LogRT ~ 1 + Condition + arousal_mean_female + (1|Participant) + (1|Picture)');

% Model summary and fit
lme_all_female_disp = evalc('disp(lme_all_female)');
clean_output = regexprep(lme_all_female_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_all_female);
ytrue = all_female.LogRT;
f_all_f_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_all_f_FO, fullfile(figuresFolder, 'LME_arRT_female_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_all_female);
yfit = fitted(lme_all_female);
f_all_f_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0); 
grid on
exportgraphics(f_all_f_RF, fullfile(figuresFolder, 'LME_arRT_female_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_all_female);
f_all_f_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_all_f_R, fullfile(figuresFolder, 'LME_arRT_female_residuals_hist.png'), 'Resolution', 300);

%% LMM for male participant data; effects of dominance and condition on RTs in AAT

fprintf(fileID, '\n------------------------------------------------\n');
fprintf(fileID, '--- MALE PARTICIPANTS: DOMINANCE + CONDITION ---\n');
fprintf(fileID, '------------------------------------------------\n');

lme_all_male = fitlme(all_male, 'LogRT ~ 1 + Condition + dominance_mean_male + (1|Participant) + (1|Picture)');

% Model summary and fit
lme_all_male_disp = evalc('disp(lme_all_male)');
clean_output = regexprep(lme_all_male_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_all_male);
ytrue = all_male.LogRT;
f_all_m_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_all_m_FO, fullfile(figuresFolder, 'LME_doRT_male_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_all_male);
yfit = fitted(lme_all_male);
f_all_m_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0);
grid on
exportgraphics(f_all_m_RF, fullfile(figuresFolder, 'LME_doRT_male_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_all_male);
f_all_m_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_all_m_R, fullfile(figuresFolder, 'LME_doRT_male_residuals_hist.png'), 'Resolution', 300);

%% LMM for female participant data; effects of dominance and condition on RTs in AAT
fprintf(fileID, '\n--------------------------------------------------\n');
fprintf(fileID, '--- FEMALE PARTICIPANTS: DOMINANCE + CONDITION ---\n');
fprintf(fileID, '--------------------------------------------------\n');

lme_all_female = fitlme(all_female, 'LogRT ~ 1 + Condition + dominance_mean_female + (1|Participant) + (1|Picture)');

% Model summary and fit
lme_all_female_disp = evalc('disp(lme_all_female)');
clean_output = regexprep(lme_all_female_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_all_female);
ytrue = all_female.LogRT;
f_all_f_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_all_f_FO, fullfile(figuresFolder, 'LME_doRT_female_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_all_female);
yfit = fitted(lme_all_female);
f_all_f_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0); 
grid on
exportgraphics(f_all_f_RF, fullfile(figuresFolder, 'LME_doRT_female_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_all_female);
f_all_f_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_all_f_R, fullfile(figuresFolder, 'LME_doRT_female_residuals_hist.png'), 'Resolution', 300);

%% LMM for male participant data; effects of pleasure, arousal and condition on RTs in AAT

fprintf(fileID, '\n---------------------------------------------------------\n');
fprintf(fileID, '--- MALE PARTICIPANTS: AROUSAL * PLEASURE + CONDITION ---\n');
fprintf(fileID, '---------------------------------------------------------\n');

lme_all_male = fitlme(all_male, 'LogRT ~ 1 + Condition + pleasure_mean_male*arousal_mean_male + (1|Participant) + (1|Picture)');

% Model summary and fit
lme_all_male_disp = evalc('disp(lme_all_male)');
clean_output = regexprep(lme_all_male_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_all_male);
ytrue = all_male.LogRT;
f_all_m_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_all_m_FO, fullfile(figuresFolder, 'LME_plarRT_male_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_all_male);
yfit = fitted(lme_all_male);
f_all_m_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0);
grid on
exportgraphics(f_all_m_RF, fullfile(figuresFolder, 'LME_plarRT_male_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_all_male);
f_all_m_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_all_m_R, fullfile(figuresFolder, 'LME_plarRT_male_residuals_hist.png'), 'Resolution', 300);

%% LMM for female participant data; effects of arousal, pleasure and condition on RTs in AAT
fprintf(fileID, '\n-----------------------------------------------------------\n');
fprintf(fileID, '--- FEMALE PARTICIPANTS: AROUSAL * PLEASURE + CONDITION ---\n');
fprintf(fileID, '-----------------------------------------------------------\n');

lme_all_female = fitlme(all_female, 'LogRT ~ 1 + Condition + pleasure_mean_female*arousal_mean_female + (1|Participant) + (1|Picture)');

% Model summary and fit
lme_all_female_disp = evalc('disp(lme_all_female)');
clean_output = regexprep(lme_all_female_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_all_female);
ytrue = all_female.LogRT;
f_all_f_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_all_f_FO, fullfile(figuresFolder, 'LME_plarRT_female_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_all_female);
yfit = fitted(lme_all_female);
f_all_f_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0); 
grid on
exportgraphics(f_all_f_RF, fullfile(figuresFolder, 'LME_plarRT_female_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_all_female);
f_all_f_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_all_f_R, fullfile(figuresFolder, 'LME_plarRT_female_residuals_hist.png'), 'Resolution', 300);

%% LMM for male participant data; effects of pleasure, dominance and condition on RTs in AAT

fprintf(fileID, '\n-----------------------------------------------------------\n');
fprintf(fileID, '--- MALE PARTICIPANTS: DOMINANCE * PLEASURE + CONDITION ---\n');
fprintf(fileID, '-----------------------------------------------------------\n');

lme_all_male = fitlme(all_male, 'LogRT ~ 1 + Condition + pleasure_mean_male*dominance_mean_male + (1|Participant) + (1|Picture)');

% Model summary and fit
lme_all_male_disp = evalc('disp(lme_all_male)');
clean_output = regexprep(lme_all_male_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_all_male);
ytrue = all_male.LogRT;
f_all_m_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_all_m_FO, fullfile(figuresFolder, 'LME_pldoRT_male_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_all_male);
yfit = fitted(lme_all_male);
f_all_m_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0);
grid on
exportgraphics(f_all_m_RF, fullfile(figuresFolder, 'LME_pldoRT_male_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_all_male);
f_all_m_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_all_m_R, fullfile(figuresFolder, 'LME_pldoRT_male_residuals_hist.png'), 'Resolution', 300);

%% LMM for female participant data; effects of dominance, pleasure and condition on RTs in AAT
fprintf(fileID, '\n-------------------------------------------------------------\n');
fprintf(fileID, '--- FEMALE PARTICIPANTS: DOMINANCE * PLEASURE + CONDITION ---\n');
fprintf(fileID, '-------------------------------------------------------------\n');

lme_all_female = fitlme(all_female, 'LogRT ~ 1 + Condition + pleasure_mean_female*dominance_mean_female + (1|Participant) + (1|Picture)');

% Model summary and fit
lme_all_female_disp = evalc('disp(lme_all_female)');
clean_output = regexprep(lme_all_female_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_all_female);
ytrue = all_female.LogRT;
f_all_f_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_all_f_FO, fullfile(figuresFolder, 'LME_pldoRT_female_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_all_female);
yfit = fitted(lme_all_female);
f_all_f_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0); 
grid on
exportgraphics(f_all_f_RF, fullfile(figuresFolder, 'LME_pldoRT_female_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_all_female);
f_all_f_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_all_f_R, fullfile(figuresFolder, 'LME_pldoRT_female_residuals_hist.png'), 'Resolution', 300);

close all;