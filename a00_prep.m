%% Additional data preparation

%% Preparation - set to zero

clear; close all;

%% Read and adapt previously pre-processed .csv files

opts1 = detectImportOptions('aat_data.csv');
opts1 = setvartype(opts1, {'Participant', 'Gender', 'Picture', 'Valence', 'Condition'}, 'categorical');
aat = readtable('aat_data.csv', opts1); 

opts2 = detectImportOptions('survey_data.csv');
opts2 = setvartype(opts2, {'Participant', 'Gender', 'Picture', 'Valence'}, 'categorical');
sam = readtable('survey_data.csv', opts2); 

opts3 = detectImportOptions('picture_data.csv');
opts3 = setvartype(opts3, {'Picture', 'Valence'}, 'categorical');
img = readtable('picture_data.csv', opts3); 

opts4 = detectImportOptions('all_data.csv');
opts4 = setvartype(opts4, {'Participant', 'Gender', 'Picture', 'Valence', 'Condition'}, 'categorical');
all = readtable('all_data.csv', opts4); 

%% Data Preparation

% add some variables in data type string in addition to category for
% further processing
aat.GenderStr = string(aat.Gender);
aat.ValenceStr = string(aat.Valence);
aat.ConditionStr = string(aat.Condition);

% add RTs in ms in addition to s
aat.RTms = aat.RT * 1000;

% add some variables in data type string in addition to category for
% further processing
sam.GenderStr = string(sam.Gender);
sam.ValenceStr = string(sam.Valence);

% Create tables for aat data for male and female participants separately
aat_male = aat(aat.Gender == 'male', :);
aat_female = aat(aat.Gender == 'female', :);

% Create tables for aat data for male and female participants separately
aat_pos = aat(aat.Valence == 'positive', :);
aat_neg = aat(aat.Valence == 'negative', :);

% Create tables for survey for pleasant and unpleasant stimuli separately
sam_pos = sam(sam.Valence == 'positive', :);
sam_neg = sam(sam.Valence == 'negative', :);

% Create tables for survey data for male and female participants separately
sam_male = sam(sam.Gender == 'male', :);
sam_female = sam(sam.Gender == 'female', :);

% Create tables for survey data for male and female participants and for pleasant and unpleasant separately
sam_pos_male = sam_pos(sam_pos.Gender == 'male', :);
sam_pos_female = sam_pos(sam_pos.Gender == 'female', :);
sam_neg_male = sam_neg(sam_neg.Gender == 'male', :);
sam_neg_female = sam_neg(sam_neg.Gender == 'female', :);

% Initalize table columns for further processing
all.pleasure_mean_this = NaN(height(all),1);
all.arousal_mean_this = NaN(height(all),1);
all.dominance_mean_this = NaN(height(all),1);

% Add truth operators for gender identity for further processing
isFemale = all.Gender == 'female';
isMale = all.Gender == 'male';

% Add mean affective rating values to table depending on gender
all.pleasure_mean_this(isFemale) = all.pleasure_mean_female(isFemale);
all.pleasure_mean_this(isMale) = all.pleasure_mean_male(isMale);
all.arousal_mean_this(isFemale) = all.arousal_mean_female(isFemale);
all.arousal_mean_this(isMale) = all.arousal_mean_male(isMale);
all.dominance_mean_this(isFemale) = all.dominance_mean_female(isFemale);
all.dominance_mean_this(isMale) = all.dominance_mean_male(isMale);

% Create tables for all data for male and female participants separately
all_male = all(all.Gender == 'male', :);
all_female = all(all.Gender == 'female', :);

% Define color palette used in all figures to differentiate women's and
% men's data
femaleColor = [1, 0.5, 0];   
maleColor   = [0, 0.6, 0]; 