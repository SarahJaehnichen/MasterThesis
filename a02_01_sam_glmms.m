%% Analysis SAM-Survey - Impact of Valence and Gender Differences in Affective Experiences

%% Setup and create folders
resultsFolder = 'results/a02_sam_analysis';
figuresFolder = fullfile(resultsFolder, 'figures_sam_glmms');
if ~exist(resultsFolder, 'dir')
    mkdir(resultsFolder);
end
if ~exist(figuresFolder, 'dir')
    mkdir(figuresFolder);
end

% File path for the text file and open file for writing
txtFile = fullfile(resultsFolder, 'sam_glmms.txt');
fileID = fopen(txtFile, 'w');

%% Print title
fprintf(fileID, '\n==============================================================================\n');
fprintf(fileID, '=== GLMMS SAM: Gender Effects on Affective Experiences of Valenced stimuli ===\n');
fprintf(fileID, '==============================================================================\n');

%% Print subtitle - Pleasant Picture Stimuli, effects of gender on affective experiences
fprintf(fileID, '\n------------------------------------------------------------------------------\n');
fprintf(fileID, '--- GLMMS SAM: Gender Effects on Affective Experiences of Pleasant stimuli ---\n');
fprintf(fileID, '------------------------------------------------------------------------------\n');

%% GLMM for Pleasure ~ Gender (positive stimuli)
fprintf(fileID, '\n=== GLMM: Gender Effects On Experiences Of PLEASURE When Viewing PLEASANT Pictures ===\n\n');

% fit model
glmm_pos_g_p = fitglme(sam_pos, 'Pleasure ~ Gender + (1|Picture) + (1|Participant)', 'Distribution', 'Poisson', 'Link', 'log', 'DummyVarCoding','effects');

% Model summary and fit
glmm_pos_g_p_disp = evalc('disp(glmm_pos_g_p)');
clean_output = regexprep(glmm_pos_g_p_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot: Fitted vs. Observed values for Pleasure Ratings (positive)
y_obs = sam_pos.Pleasure;
y_fit = fitted(glmm_pos_g_p);
f_pos_g_p = figure;
scatter(y_obs, y_fit);
xlabel('Observed');
ylabel('Fitted');
title('Fitted vs. Observed (GLMM) - Positive Stimuli Pleasure');
grid on;
hold on;
plot(xlim, xlim, 'r--');
exportgraphics(f_pos_g_p, fullfile(figuresFolder, 'GLMM_Pos_Gender_Pleasure.png'), 'Resolution', 300);

% Plot: Residuals vs. Fitted values for Pleasure Ratings (positive)
res = residuals(glmm_pos_g_p);
f_pos_g_p_res = figure;
scatter(y_fit, res);
xlabel('Fitted');
ylabel('Residuals');
title('Residuals vs. Fitted (GLMM) - Positive Stimuli Pleasure');
refline(0,0);
grid on;
exportgraphics(f_pos_g_p_res, fullfile(figuresFolder, 'GLMM_Pos_Gender_Pleasure_Residuals.png'), 'Resolution', 300);

%% GLMM for Arousal ~ Gender (positive stimuli)
fprintf(fileID, '\n=== GLMM: Gender Effects On Experiences Of AROUSAL When Viewing PLEASANT Pictures ===\n\n');

% Fit model
glmm_pos_g_a = fitglme(sam_pos, 'Arousal ~ Gender + (1|Picture) + (1|Participant)', 'Distribution', 'Poisson', 'Link', 'log', 'DummyVarCoding','effects');

% Model summary and fit
glmm_pos_g_a_disp = evalc('disp(glmm_pos_g_a)');
clean_output = regexprep(glmm_pos_g_a_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot Fitted vs. Observed values for Arousal Ratings (positive)
y_obs = sam_pos.Arousal;
y_fit = fitted(glmm_pos_g_a);
f_pos_g_a = figure;
scatter(y_obs, y_fit);
xlabel('Observed');
ylabel('Fitted');
title('Fitted vs. Observed (GLMM) - Positive Stimuli Arousal');
grid on;
hold on;
plot(xlim, xlim, 'r--');
exportgraphics(f_pos_g_a, fullfile(figuresFolder, 'GLMM_Pos_Gender_Arousal.png'), 'Resolution', 300);

% Plot Residuals vs. Fitted values for Arousal Ratings (positive)
res = residuals(glmm_pos_g_a);
f_pos_g_a_res = figure;
scatter(y_fit, res);
xlabel('Fitted');
ylabel('Residuals');
title('Residuals vs. Fitted (GLMM) - Positive Stimuli Arousal');
refline(0,0);
grid on;
exportgraphics(f_pos_g_a_res, fullfile(figuresFolder, 'GLMM_Pos_Gender_Arousal_Residuals.png'), 'Resolution', 300);

%% GLMM for Dominance ~ Gender (positive stimuli)
fprintf(fileID, '\n=== GLMM: Gender Effects On Experiences Of DOMINANCE When Viewing PLEASANT Pictures ===\n\n');

% Fit model
glmm_pos_g_d = fitglme(sam_pos, 'Dominance ~ Gender + (1|Picture) + (1|Participant)', 'Distribution', 'Poisson', 'Link', 'log', 'DummyVarCoding','effects');

% Model summary and fit
glmm_pos_g_d_disp = evalc('disp(glmm_pos_g_d)');
clean_output = regexprep(glmm_pos_g_d_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot Fitted vs. Observed values for Dominance Ratings (positive)
y_obs = sam_pos.Dominance;
y_fit = fitted(glmm_pos_g_d);
f_pos_g_d = figure;
scatter(y_obs, y_fit);
xlabel('Observed');
ylabel('Fitted');
title('Fitted vs. Observed (GLMM) - Positive Stimuli Dominance');
grid on;
hold on;
plot(xlim, xlim, 'r--');
exportgraphics(f_pos_g_d, fullfile(figuresFolder, 'GLMM_Pos_Gender_Dominance.png'), 'Resolution', 300);

% Plot Residuals vs. Fitted values for Dominance Ratings (positive)
res = residuals(glmm_pos_g_d);
f_pos_g_d_res = figure;
scatter(y_fit, res);
xlabel('Fitted');
ylabel('Residuals');
title('Residuals vs. Fitted (GLMM) - Positive Stimuli Dominance');
refline(0,0);
grid on;
exportgraphics(f_pos_g_d_res, fullfile(figuresFolder, 'GLMM_Pos_Gender_Dominance_Residuals.png'), 'Resolution', 300);

%% Print subtitle - Unpleasant Picture Stimuli, effects of gender on affective experiences
fprintf(fileID, '\n--------------------------------------------------------------------------------\n');
fprintf(fileID, '--- GLMMS SAM: Gender Effects on Affective Experiences of Unpleasant stimuli ---\n');
fprintf(fileID, '--------------------------------------------------------------------------------\n');

%% GLMM for Pleasure ~ Gender (negative stimuli)
fprintf(fileID, '\n=== GLMM: Gender Effects On Experiences Of PLEASURE When Viewing UNPLEASANT Pictures ===\n\n');

% Model fit
glmm_neg_g_p = fitglme(sam_neg, 'Pleasure ~ Gender + (1|Picture) + (1|Participant)', 'Distribution', 'Poisson', 'Link', 'log', 'DummyVarCoding','effects');

% Model summary and fit
glmm_neg_g_p_disp = evalc('disp(glmm_neg_g_p)');
clean_output = regexprep(glmm_neg_g_p_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot: Fitted vs. Observed values for Pleasure Ratings (negative)
y_obs = sam_neg.Pleasure;
y_fit = fitted(glmm_neg_g_p);
f_neg_g_p = figure;
scatter(y_obs, y_fit);
xlabel('Observed');
ylabel('Fitted');
title('Fitted vs. Observed (GLMM) - Negative Stimuli Pleasure');
grid on;
hold on;
plot(xlim, xlim, 'r--');
exportgraphics(f_neg_g_p, fullfile(figuresFolder, 'GLMM_Neg_Gender_Pleasure.png'), 'Resolution', 300);

% Plot: Residuals vs. Fitted values for Pleasure Ratings (negative)
res = residuals(glmm_neg_g_p);
f_neg_g_p_res = figure;
scatter(y_fit, res);
xlabel('Fitted');
ylabel('Residuals');
title('Residuals vs. Fitted (GLMM) - Negative Stimuli Pleasure');
refline(0,0);
grid on;
exportgraphics(f_neg_g_p_res, fullfile(figuresFolder, 'GLMM_Neg_Gender_Pleasure_Residuals.png'), 'Resolution', 300);

%% GLMM for Arousal ~ Gender (negative stimuli)
fprintf(fileID, '\n=== GLMM: Gender Effects On Experiences Of AROUSAL When Viewing UNPLEASANT Pictures ===\n\n');

% Model fit
glmm_neg_g_a = fitglme(sam_neg, 'Arousal ~ Gender + (1|Picture) + (1|Participant)', 'Distribution', 'Poisson', 'Link', 'log', 'DummyVarCoding','effects');

% Model summary and fit
glmm_neg_g_a_disp = evalc('disp(glmm_neg_g_a)');
clean_output = regexprep(glmm_neg_g_a_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot Fitted vs. Observed values for Arousal Ratings (negative)
y_obs = sam_neg.Arousal;
y_fit = fitted(glmm_neg_g_a);
f_neg_g_a = figure;
scatter(y_obs, y_fit);
xlabel('Observed');
ylabel('Fitted');
title('Fitted vs. Observed (GLMM) - Negative Stimuli Arousal');
grid on;
hold on;
plot(xlim, xlim, 'r--');
exportgraphics(f_neg_g_a, fullfile(figuresFolder, 'GLMM_Neg_Gender_Arousal.png'), 'Resolution', 300);

% Plot Residuals vs. Fitted values for Arousal Ratings (negative)
res = residuals(glmm_neg_g_a);
f_neg_g_a_res = figure;
scatter(y_fit, res);
xlabel('Fitted');
ylabel('Residuals');
title('Residuals vs. Fitted (GLMM) - Negative Stimuli Arousal');
refline(0,0);
grid on;
exportgraphics(f_neg_g_a_res, fullfile(figuresFolder, 'GLMM_Neg_Gender_Arousal_Residuals.png'), 'Resolution', 300);

%% GLMM for Dominance ~ Gender (negative stimuli)
fprintf(fileID, '\n=== GLMM: Gender Effects On Experiences Of DOMINANCE When Viewing UNPLEASANT Pictures ===\n\n');

% Fit model
glmm_neg_g_d = fitglme(sam_neg, 'Dominance ~ Gender + (1|Picture) + (1|Participant)', 'Distribution', 'Poisson', 'Link', 'log', 'DummyVarCoding','effects');

% Model summary and fit
glmm_neg_g_d_disp = evalc('disp(glmm_neg_g_d)');
clean_output = regexprep(glmm_neg_g_d_disp, '<.*?>', '');
fprintf(fileID, '%s\n', clean_output);

% Plot Fitted vs. Observed values for Dominance Ratings (negative)
y_obs = sam_neg.Dominance;
y_fit = fitted(glmm_neg_g_d);
f_neg_g_d = figure;
scatter(y_obs, y_fit);
xlabel('Observed');
ylabel('Fitted');
title('Fitted vs. Observed (GLMM) - Negative Stimuli Dominance');
grid on;
hold on;
plot(xlim, xlim, 'r--');
exportgraphics(f_neg_g_d, fullfile(figuresFolder, 'GLMM_Neg_Gender_Dominance.png'), 'Resolution', 300);

% Plot Residuals vs. Fitted values for Dominance Ratings (negative)
res = residuals(glmm_neg_g_d);
f_neg_g_d_res = figure;
scatter(y_fit, res);
xlabel('Fitted');
ylabel('Residuals');
title('Residuals vs. Fitted (GLMM) - Negative Stimuli Dominance');
refline(0,0);
grid on;
exportgraphics(f_neg_g_d_res, fullfile(figuresFolder, 'GLMM_Neg_Gender_Dominance_Residuals.png'), 'Resolution', 300);

%% Close text file and figures
fclose(fileID);
close all;