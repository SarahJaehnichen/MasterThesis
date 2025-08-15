%% Analysis - SAM + AAT --- CONGRUENT Trials

%% Setup and create folders
resultsFolder = 'results/a03_sam_aat_analysis';
figuresFolder = fullfile(resultsFolder, 'figures_sam_aat_con_lmms');
if ~exist(resultsFolder, 'dir')
    mkdir(resultsFolder);
end
if ~exist(figuresFolder, 'dir')
    mkdir(figuresFolder);
end

% File path for the text file and open file for writing
txtFile = fullfile(resultsFolder, 'sam_aat_con_lmms.txt');
fileID = fopen(txtFile, 'w');

%% print headline
fprintf(fileID, '\n======================================\n');
fprintf(fileID, '=== Gender-Specific LMMs AAT + SAM ===\n');
fprintf(fileID, '======================================\n');

%% LMM for male participant data; effects of pleasure on RTs in AAT

fprintf(fileID, '\n-----------------------------------------------\n');
fprintf(fileID, '--- CONGRUENT - MALE PARTICIPANTS: PLEASURE ---\n');
fprintf(fileID, '-----------------------------------------------\n');

lme_all_con_male = fitlme(all_con_male, 'LogRT ~ 1 + pleasure_mean_male + (1|Participant) + (1|Picture)');

% Model summary and fit
lme_all_con_male_disp = evalc('disp(lme_all_con_male)');
clean_output = regexprep(lme_all_con_male_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_all_con_male);
ytrue = all_con_male.LogRT;
f_all_m_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_all_m_FO, fullfile(figuresFolder, 'con_LME_plRT_male_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_all_con_male);
yfit = fitted(lme_all_con_male);
f_all_m_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0);
grid on
exportgraphics(f_all_m_RF, fullfile(figuresFolder, 'con_LME_plRT_male_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_all_con_male);
f_all_m_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_all_m_R, fullfile(figuresFolder, 'con_LME_plRT_male_residuals_hist.png'), 'Resolution', 300);

%% LMM for female participant data; effects of pleasure on RTs in AAT
fprintf(fileID, '\n-------------------------------------------------\n');
fprintf(fileID, '--- CONGRUENT - FEMALE PARTICIPANTS: PLEASURE ---\n');
fprintf(fileID, '-------------------------------------------------\n');

lme_all_con_female = fitlme(all_con_female, 'LogRT ~ 1 + pleasure_mean_female + (1|Participant) + (1|Picture)');

% Model summary and fit
lme_all_con_female_disp = evalc('disp(lme_all_con_female)');
clean_output = regexprep(lme_all_con_female_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_all_con_female);
ytrue = all_con_female.LogRT;
f_all_f_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_all_f_FO, fullfile(figuresFolder, 'con_LME_plRT_female_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_all_con_female);
yfit = fitted(lme_all_con_female);
f_all_f_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0); 
grid on
exportgraphics(f_all_f_RF, fullfile(figuresFolder, 'con_LME_plRT_female_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_all_con_female);
f_all_f_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_all_f_R, fullfile(figuresFolder, 'con_LME_plRT_female_residuals_hist.png'), 'Resolution', 300);

%% LMM for male participant data; effects of arousal on RTs in AAT

fprintf(fileID, '\n----------------------------------------------\n');
fprintf(fileID, '--- CONGRUENT - MALE PARTICIPANTS: AROUSAL ---\n');
fprintf(fileID, '----------------------------------------------\n');

lme_all_con_male = fitlme(all_con_male, 'LogRT ~ 1 + arousal_mean_male + (1|Participant) + (1|Picture)');

% Model summary and fit
lme_all_con_male_disp = evalc('disp(lme_all_con_male)');
clean_output = regexprep(lme_all_con_male_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_all_con_male);
ytrue = all_con_male.LogRT;
f_all_m_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_all_m_FO, fullfile(figuresFolder, 'conLME_arRT_male_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_all_con_male);
yfit = fitted(lme_all_con_male);
f_all_m_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0);
grid on
exportgraphics(f_all_m_RF, fullfile(figuresFolder, 'conLME_arRT_male_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_all_con_male);
f_all_m_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_all_m_R, fullfile(figuresFolder, 'conLME_arRT_male_residuals_hist.png'), 'Resolution', 300);

%% LMM for female participant data; effects of arousal on RTs in AAT
fprintf(fileID, '\n------------------------------------------------\n');
fprintf(fileID, '--- CONGRUENT - FEMALE PARTICIPANTS: AROUSAL ---\n');
fprintf(fileID, '------------------------------------------------\n');

lme_all_con_female = fitlme(all_con_female, 'LogRT ~ 1 + arousal_mean_female + (1|Participant) + (1|Picture)');

% Model summary and fit
lme_all_con_female_disp = evalc('disp(lme_all_con_female)');
clean_output = regexprep(lme_all_con_female_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_all_con_female);
ytrue = all_con_female.LogRT;
f_all_f_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_all_f_FO, fullfile(figuresFolder, 'conLME_arRT_female_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_all_con_female);
yfit = fitted(lme_all_con_female);
f_all_f_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0); 
grid on
exportgraphics(f_all_f_RF, fullfile(figuresFolder, 'conLME_arRT_female_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_all_con_female);
f_all_f_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_all_f_R, fullfile(figuresFolder, 'conLME_arRT_female_residuals_hist.png'), 'Resolution', 300);

%% LMM for male participant data; effects of dominance on RTs in AAT

fprintf(fileID, '\n------------------------------------------------\n');
fprintf(fileID, '--- CONGRUENT - MALE PARTICIPANTS: DOMINANCE ---\n');
fprintf(fileID, '------------------------------------------------\n');

lme_all_con_male = fitlme(all_con_male, 'LogRT ~ 1 + dominance_mean_male + (1|Participant) + (1|Picture)');

% Model summary and fit
lme_all_con_male_disp = evalc('disp(lme_all_con_male)');
clean_output = regexprep(lme_all_con_male_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_all_con_male);
ytrue = all_con_male.LogRT;
f_all_m_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_all_m_FO, fullfile(figuresFolder, 'conLME_doRT_male_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_all_con_male);
yfit = fitted(lme_all_con_male);
f_all_m_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0);
grid on
exportgraphics(f_all_m_RF, fullfile(figuresFolder, 'conLME_doRT_male_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_all_con_male);
f_all_m_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_all_m_R, fullfile(figuresFolder, 'conLME_doRT_male_residuals_hist.png'), 'Resolution', 300);

%% LMM for female participant data; effects of dominance on RTs in AAT
fprintf(fileID, '\n--------------------------------------------------\n');
fprintf(fileID, '--- CONGRUENT - FEMALE PARTICIPANTS: DOMINANCE ---\n');
fprintf(fileID, '--------------------------------------------------\n');

lme_all_con_female = fitlme(all_con_female, 'LogRT ~ 1 + dominance_mean_female + (1|Participant) + (1|Picture)');

% Model summary and fit
lme_all_con_female_disp = evalc('disp(lme_all_con_female)');
clean_output = regexprep(lme_all_con_female_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_all_con_female);
ytrue = all_con_female.LogRT;
f_all_f_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_all_f_FO, fullfile(figuresFolder, 'conLME_doRT_female_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_all_con_female);
yfit = fitted(lme_all_con_female);
f_all_f_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0); 
grid on
exportgraphics(f_all_f_RF, fullfile(figuresFolder, 'conLME_doRT_female_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_all_con_female);
f_all_f_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_all_f_R, fullfile(figuresFolder, 'conLME_doRT_female_residuals_hist.png'), 'Resolution', 300);

%% LMM for male participant data; effects of pleasure, arousal on RTs in AAT

fprintf(fileID, '\n---------------------------------------------------------\n');
fprintf(fileID, '--- CONGRUENT - MALE PARTICIPANTS: AROUSAL * PLEASURE ---\n');
fprintf(fileID, '---------------------------------------------------------\n');

lme_all_con_male = fitlme(all_con_male, 'LogRT ~ 1 + pleasure_mean_male*arousal_mean_male + (1|Participant) + (1|Picture)');

% Model summary and fit
lme_all_con_male_disp = evalc('disp(lme_all_con_male)');
clean_output = regexprep(lme_all_con_male_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_all_con_male);
ytrue = all_con_male.LogRT;
f_all_m_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_all_m_FO, fullfile(figuresFolder, 'conLME_plarRT_male_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_all_con_male);
yfit = fitted(lme_all_con_male);
f_all_m_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0);
grid on
exportgraphics(f_all_m_RF, fullfile(figuresFolder, 'conLME_plarRT_male_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_all_con_male);
f_all_m_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_all_m_R, fullfile(figuresFolder, 'conLME_plarRT_male_residuals_hist.png'), 'Resolution', 300);

%% LMM for female participant data; effects of arousal, pleasure on RTs in AAT
fprintf(fileID, '\n-----------------------------------------------------------\n');
fprintf(fileID, '--- CONGRUENT - FEMALE PARTICIPANTS: AROUSAL * PLEASURE ---\n');
fprintf(fileID, '-----------------------------------------------------------\n');

lme_all_con_female = fitlme(all_con_female, 'LogRT ~ 1 + pleasure_mean_female*arousal_mean_female + (1|Participant) + (1|Picture)');

% Model summary and fit
lme_all_con_female_disp = evalc('disp(lme_all_con_female)');
clean_output = regexprep(lme_all_con_female_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_all_con_female);
ytrue = all_con_female.LogRT;
f_all_f_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_all_f_FO, fullfile(figuresFolder, 'conLME_plarRT_female_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_all_con_female);
yfit = fitted(lme_all_con_female);
f_all_f_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0); 
grid on
exportgraphics(f_all_f_RF, fullfile(figuresFolder, 'conLME_plarRT_female_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_all_con_female);
f_all_f_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_all_f_R, fullfile(figuresFolder, 'conLME_plarRT_female_residuals_hist.png'), 'Resolution', 300);

%% LMM for male participant data; effects of pleasure, dominance on RTs in AAT

fprintf(fileID, '\n-----------------------------------------------------------\n');
fprintf(fileID, '--- CONGRUENT - MALE PARTICIPANTS: DOMINANCE * PLEASURE ---\n');
fprintf(fileID, '-----------------------------------------------------------\n');

lme_all_con_male = fitlme(all_con_male, 'LogRT ~ 1 + pleasure_mean_male*dominance_mean_male + (1|Participant) + (1|Picture)');

% Model summary and fit
lme_all_con_male_disp = evalc('disp(lme_all_con_male)');
clean_output = regexprep(lme_all_con_male_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_all_con_male);
ytrue = all_con_male.LogRT;
f_all_m_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_all_m_FO, fullfile(figuresFolder, 'conLME_pldoRT_male_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_all_con_male);
yfit = fitted(lme_all_con_male);
f_all_m_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0);
grid on
exportgraphics(f_all_m_RF, fullfile(figuresFolder, 'conLME_pldoRT_male_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_all_con_male);
f_all_m_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_all_m_R, fullfile(figuresFolder, 'conLME_pldoRT_male_residuals_hist.png'), 'Resolution', 300);

%% LMM for female participant data; effects of dominance, pleasure on RTs in AAT
fprintf(fileID, '\n-------------------------------------------------------------\n');
fprintf(fileID, '--- CONGRUENT - FEMALE PARTICIPANTS: DOMINANCE * PLEASURE ---\n');
fprintf(fileID, '-------------------------------------------------------------\n');

lme_all_con_female = fitlme(all_con_female, 'LogRT ~ 1 + pleasure_mean_female*dominance_mean_female + (1|Participant) + (1|Picture)');

% Model summary and fit
lme_all_con_female_disp = evalc('disp(lme_all_con_female)');
clean_output = regexprep(lme_all_con_female_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot fitted vs observed values
yfit = fitted(lme_all_con_female);
ytrue = all_con_female.LogRT;
f_all_f_FO = figure;
scatter(ytrue, yfit)
xlabel('Observed')
ylabel('Fitted')
title('Fitted vs. Observed')
grid on
exportgraphics(f_all_f_FO, fullfile(figuresFolder, 'conLME_pldoRT_female_fitted_vs_observed.png'), 'Resolution', 300);

% Plot residuals against fitted values
res = residuals(lme_all_con_female);
yfit = fitted(lme_all_con_female);
f_all_f_RF = figure;
scatter(yfit, res)
xlabel('Fitted Values')
ylabel('Residuals')
title('Residuals vs. Fitted')
refline(0,0); 
grid on
exportgraphics(f_all_f_RF, fullfile(figuresFolder, 'conLME_pldoRT_female_residuals_vs_fitted.png'), 'Resolution', 300);

% Residuals Histogram
res = residuals(lme_all_con_female);
f_all_f_R = figure;
histogram(res)
title('Residuals Histogram')
exportgraphics(f_all_f_R, fullfile(figuresFolder, 'conLME_pldoRT_female_residuals_hist.png'), 'Resolution', 300);

close all;