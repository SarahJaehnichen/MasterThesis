%% Mann-Whitney-U-Tests to examine gender differences in affective experiences when viewing individual positive pictures

% Setup and create folders
folder = 'results/a02_sam_analysis';
if ~exist(folder, 'dir')
    mkdir(folder);
end

% File path for the text file to save results and open file for writing
txtFile = fullfile(folder, 'pos_pic_utests.txt');
fileID = fopen(txtFile, 'w');

%% Prepare data/ tables

% Identify and count positive pictures
pictures = unique(sam_pos.Picture);
nPics = numel(pictures);

% Define results tables for each rating scale with statistical and descriptive results
varNames = {'Picture','pValue','pSig','Ustat','Zval','r','pFDR', ...
            'n_male','n_female','n_total', ...
            'mean_male','std_male','mean_female','std_female'};
varTypes = {'string','double','string','double','double','double','double', ...
            'double','double','double', ...
            'double','double','double','double'};
results_pl = table('Size', [nPics, length(varNames)], 'VariableTypes', varTypes, 'VariableNames', varNames);
results_ar = results_pl;
results_do = results_pl;

%% Perform statistical analysis
% Iterate through all pictures and collect affective ratings for men and women
for i = 1:nPics
    pic = pictures(i);
    idx = sam_pos.Picture == pic;

    pl_male = sam_pos.Pleasure(idx & sam_pos.Gender == "male");
    pl_female = sam_pos.Pleasure(idx & sam_pos.Gender == "female");

    ar_male = sam_pos.Arousal(idx & sam_pos.Gender == "male");
    ar_female = sam_pos.Arousal(idx & sam_pos.Gender == "female");

    do_male = sam_pos.Dominance(idx & sam_pos.Gender == "male");
    do_female = sam_pos.Dominance(idx & sam_pos.Gender == "female");

    % Perform Mann-Whitney-U-Test for Gender Differences in Pleasure
    % Experience when viewing current picture. Additionally, calculate 
    % Effect Size. Also calculate some descriptive statistics (data count, 
    % mean and std for men and women). Save in results table.
    if ~isempty(pl_male) && ~isempty(pl_female)
        idx_img = img.Picture == pic;
        [p, h, stats] = ranksum(pl_male, pl_female);
        N_m = numel(pl_male);
        N_f = numel(pl_female);
        N = N_m + N_f;
        results_pl.Picture(i) = pic;
        results_pl.pValue(i) = p;
        results_pl.pSig(i) = h;
        results_pl.Ustat(i) = stats.ranksum;
        results_pl.Zval(i) = stats.zval;
        results_pl.r(i) = abs(stats.zval) / sqrt(N);
        results_pl.n_male(i) = N_m;
        results_pl.n_female(i) = N_f;
        results_pl.n_total(i) = N;
        results_pl.mean_male(i) = mean(pl_male);
        results_pl.std_male(i) = std(pl_male);
        results_pl.mean_female(i) = mean(pl_female);
        results_pl.std_female(i) = std(pl_female);
        img.Pleasure_Significance(idx_img) = h;
    end

    % Perform Mann-Whitney-U-Test for Gender Differences in Arousal
    % Experience when viewing current picture. Additionally, calculate 
    % Effect Size. Also calculate some descriptive statistics (data count, 
    % mean and std for men and women). Save in results table.    
    if ~isempty(ar_male) && ~isempty(ar_female)
        idx_img = img.Picture == pic;
        [p, h, stats] = ranksum(ar_male, ar_female);
        N_m = numel(ar_male);
        N_f = numel(ar_female);
        N = N_m + N_f;
        results_ar.Picture(i) = pic;
        results_ar.pValue(i) = p;
        results_ar.pSig(i) = h;
        results_ar.Ustat(i) = stats.ranksum;
        results_ar.Zval(i) = stats.zval;
        results_ar.r(i) = abs(stats.zval) / sqrt(N);
        results_ar.n_male(i) = N_m;
        results_ar.n_female(i) = N_f;
        results_ar.n_total(i) = N;
        results_ar.mean_male(i) = mean(ar_male);
        results_ar.std_male(i) = std(ar_male);
        results_ar.mean_female(i) = mean(ar_female);
        results_ar.std_female(i) = std(ar_female);
        img.Arousal_Significance(idx_img) = h;
    end

    % Perform Mann-Whitney-U-Test for Gender Differences in Dominance
    % Experience when viewing current picture. Additionally, calculate 
    % Effect Size. Also calculate some descriptive statistics (data count, 
    % mean and std for men and women). Save in results table.
    if ~isempty(do_male) && ~isempty(do_female)
        idx_img = img.Picture == pic;
        [p, h, stats] = ranksum(do_male, do_female);
        N_m = numel(do_male);
        N_f = numel(do_female);
        N = N_m + N_f;
        results_do.Picture(i) = pic;
        results_do.pValue(i) = p;
        results_do.pSig(i) = h;
        results_do.Ustat(i) = stats.ranksum;
        results_do.Zval(i) = stats.zval;
        results_do.r(i) = abs(stats.zval) / sqrt(N);
        results_do.n_male(i) = N_m;
        results_do.n_female(i) = N_f;
        results_do.n_total(i) = N;
        results_do.mean_male(i) = mean(do_male);
        results_do.std_male(i) = std(do_male);
        results_do.mean_female(i) = mean(do_female);
        results_do.std_female(i) = std(do_female);
        img.Dominance_Significance(idx_img) = h;
    end
end

% Sort tables by pValues
results_pl = sortrows(results_pl, 'pValue');
results_ar = sortrows(results_ar, 'pValue');
results_do = sortrows(results_do, 'pValue');

% Add FDR-Corrections to tables
results_pl.pFDR = mafdr(results_pl.pValue, 'BHFDR', true);
results_ar.pFDR = mafdr(results_ar.pValue, 'BHFDR', true);
results_do.pFDR = mafdr(results_do.pValue, 'BHFDR', true);

%% Data processing

% Adapt data type for further processing
results_pl.Picture = categorical(results_pl.Picture);
results_ar.Picture = categorical(results_ar.Picture);
results_do.Picture = categorical(results_do.Picture);

% Add pFDR values for Pleasure/ Arousal/ Dominance to images in img table
% (will not be relevant for further processing since none of the pleasant 
% images showed significant pFDRs - processing step kept for consistency)
if ~ismember('pFDR_pleasure_pos', img.Properties.VariableNames)
    pic_pFDR = results_pl(:, {'Picture', 'pFDR'});
    pic_pFDR.Properties.VariableNames{'pFDR'} = 'pFDR_pleasure_pos';
    img = outerjoin(img, pic_pFDR, 'Keys', 'Picture', 'MergeKeys', true);
end
if ~ismember('pFDR_arousal_pos', img.Properties.VariableNames)
    pic_pFDR = results_ar(:, {'Picture', 'pFDR'});
    pic_pFDR.Properties.VariableNames{'pFDR'} = 'pFDR_arousal_pos';
    img = outerjoin(img, pic_pFDR, 'Keys', 'Picture', 'MergeKeys', true);
end
if ~ismember('pFDR_dominance_pos', img.Properties.VariableNames)
    pic_pFDR = results_do(:, {'Picture', 'pFDR'});
    pic_pFDR.Properties.VariableNames{'pFDR'} = 'pFDR_dominance_pos';
    img = outerjoin(img, pic_pFDR, 'Keys', 'Picture', 'MergeKeys', true);
end

%% Save results in txt file

% Create heading
fprintf(fileID, '\n=====================================================\n');
fprintf(fileID, '=== Gender Differences in Affective Experiences ===\n');
fprintf(fileID, '===  When Viewing Individual Positive Pictures. ===\n');
fprintf(fileID, '===   Mann-Whitney-U-Tests for all SAM-scales.  ===\n');
fprintf(fileID, '====================================================\n');

% Create arrays for results tables and labels to iterat through them
rating_labels = {'Pleasure', 'Arousal', 'Dominance'};
results_all = {results_pl, results_ar, results_do};
% Iterate through results tables and print label and heads of tables in
% file.
for k = 1:3
    fprintf(fileID, '\n--- %s ---\n', rating_labels{k});
    fprintf(fileID, '%-20s %6s %6s %6s %6s %6s %6s %6s %6s %6s %6s %6s %6s %6s\n', ...
        'Picture','pVal','pSig','U','Z','r','pFDR','n_m','n_f','n','M_m','SD_m','M_f','SD_f');
    % Refer to current table.
    R = results_all{k};
    % Iterate through pictures and print statistical results for each
    % picture in file.
    for i = 1:height(R)
        fprintf(fileID, '%-20s %6.3f %7.7s %7.1f %6.2f %6.3f %6.3f %6.0f %6.0f %6.0f %6.2f %6.2f %6.2f %6.2f\n', ...
            R.Picture(i), R.pValue(i), R.pSig(i), R.Ustat(i), R.Zval(i), R.r(i), R.pFDR(i), ...
            R.n_male(i), R.n_female(i), R.n_total(i), ...
            R.mean_male(i), R.std_male(i), R.mean_female(i), R.std_female(i));
    end
    % Also print summary in file.
    summary_txt = evalc('summary(R)');
    summary_txt = regexprep(summary_txt, '<.*?>', '');
    fprintf(fileID, '\n--- Summary für %s ---\n', rating_labels{k});
    fprintf(fileID, '%s\n', summary_txt);
end

% close file
fclose(fileID);

%% Organize workspace to avoid confusion and keep results in workspace when 
% performing analysis for gender differences in affective experiences when 
% viewing negative pictures

% Rename results tables to make more clear what the files contain
sam_pos_pic_results_pl = results_pl;
sam_pos_pic_results_ar = results_ar;
sam_pos_pic_results_do = results_do;
% Delete identical files with ambiguous titles
clear results_*

% Add pos_ to file names of Affective Ratings Tables for men and women for 
% positive pictures to make more clear what the files contain
pos_pl_male = pl_male;
pos_pl_female = pl_female;
pos_ar_male = ar_male;
pos_ar_female = ar_female;
pos_do_male = do_male;
pos_do_female = do_female;
% Delete identical files with ambiguous titles
clear pl*
clear ar*
clear do*