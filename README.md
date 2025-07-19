# Master Thesis Analysis

In this repository, data analyses and visualizations are presented that were performed as part of my master's thesis on gender differences in approach-avoidance behavior and affective experiences, and how gender differences in these two aspects may connect.

The first pre-processing steps, as well as demographic analysis and first plots were run/ created with Python and are provided as [a00_01_MA_Prep_Demographic.ipynb](a00_01_MA_Prep_Demographic.ipynb).
The data used for these steps can be provided on request. However, all further analysis was performed based on the output files of these first data processing steps and are available here since no sensitive information was kept in these files (see the four .csv files in the main folder). 

All other analyses and visualizations were performed in Matlab. It is important to run the analyses in the order indicated by the file names, as some steps build upon previous outputs.\
[a00_02_prep.m](a00_02_prep.m) takes further data preparation steps.\
[a01_aat_lmms.m](a01_aat_lmms.m) analyzes the influence of gender, valence, and condition in the Approach-Avoidance Task on response times and how valence and condition impact responses in men and how they do so in women using linear mixed models.\
All files starting with a02 focus on gender differences in affective experiences when viewing valenced stimuli. Generalized linear mixed models were performed to investigate differences in pleasant and in unpleasant stimuli ([a02_01_sam_glmms.m](a02_01_sam_glmms.m)), and Mann-Whitney-U Tests were performed to examine differences in specific unpleasant ([a02_02_sam_neg_utests.m](a02_02_sam_neg_utests.m)) and pleasant ([a02_03_sam_pos_utests.m](a02_03_sam_pos_utests.m)) pictures. Visualizations were created in [a02_00_sam_dist.m](a02_00_sam_dist.m) and [a02_04_sam_correlations.m](a02_04_sam_correlations.m).\
Lastly, the role of affective experiences on approach-avoidance behavior in men and in women was explored by visualization of regression plots ([a03_01_sam_aat_regression_plots.m](a03_01_sam_aat_regression_plots.m)) and conducting further linear mixed models ([a03_02_sam_aat_lmms.m](a03_02_sam_aat_lmms.m)).

All output files are provided in the results folder.
