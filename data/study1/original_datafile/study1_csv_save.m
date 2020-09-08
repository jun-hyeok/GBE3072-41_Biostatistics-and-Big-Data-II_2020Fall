basedir = '/Users/clinpsywoo/Dropbox/2011-yr/Teaching/R_stats/Stats2_2020Fall/data/study1';
original_dat_dir = fullfile(basedir, 'original_datafile');
load(fullfile(original_dat_dir, 'wani_33_variables.mat'));

temperature = wani_33.curtemp(:)+32;
ratings = wani_33.currep(:);
regulation = wani_33.imaginecode(:);
subjects = repmat(1:33, 97,1);
subjects = subjects(:);

T = table(subjects, temperature, ratings, regulation);
writetable(T, fullfile(basedir, 'temp_ratings_regulation_data.csv'),'Delimiter','\t','QuoteStrings',true)