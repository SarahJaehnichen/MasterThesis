# Master Thesis Analysis

This repository contains data analyses and visualizations conducted as part of my master's thesis on **gender differences in approach-avoidance behavior** and **affective experiences**, and how gender differences in these two aspects may connect.

The initial **pre-processing** steps, as well as **demographic analyses** and first **visualizations** were performed in **Python** and are documented in [a00_00_MA_Prep_Demographic.ipynb](a00_00_MA_Prep_Demographic.ipynb).
The raw data used for these steps can be provided on request. However, all further analysis are based on output files from these pre-processing steps, which are included in this repository (see the four .csv files in the main folder). They do not contain any sensitive or identifiying information.

All subsequent **analyses** and **visualizations** were performed in **Matlab**. It is important to run the analysis scripts in the order indicated by the file names, as some steps build upon previous outputs.

[a00_01_prep.m](a00_01_prep.m) performs further **data preparation** steps.\
[a01_aat_lmms.m](a01_aat_lmms.m) analyzes the influence of gender, valence, and condition on response times in the **Approach-Avoidance Task** using linear mixed models. Additional models assess how valence and condition impact responses in **men and women** separately. \
All files starting with a02 focus on **gender differences in affective experiences when viewing valenced stimuli**. Generalized linear mixed models were performed to investigate differences in pleasant and in unpleasant stimuli ([a02_01_sam_glmms.m](a02_01_sam_glmms.m)), and Mann-Whitney-U Tests were performed to examine differences in specific unpleasant ([a02_02_sam_neg_utests.m](a02_02_sam_neg_utests.m)) and pleasant ([a02_03_sam_pos_utests.m](a02_03_sam_pos_utests.m)) pictures. Visualizations were created in [a02_00_sam_dist.m](a02_00_sam_dist.m) and [a02_04_sam_correlations.m](a02_04_sam_correlations.m).\
Lastly, **the role of affective experiences on approach-avoidance behavior in men and in women** was explored by visualization of regression plots ([a03_01_sam_aat_regression_plots.m](a03_01_sam_aat_regression_plots.m)) and conducting further linear mixed models ([a03_02_sam_aat_lmms.m](a03_02_sam_aat_lmms.m)).

All output files are available in the results folder.

Any questions or feedback regarding the code or analyses are welcome. Don't hesitate to reach out via email (sjaehnichen@uni-osnabrueck.de).
