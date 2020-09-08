basedir = '/Users/clinpsywoo/Dropbox/2011-yr/Teaching/R_stats/Stats2_2020Fall/data/study2';
original_dat_dir = fullfile(basedir, 'original_datafile');

load(fullfile(original_dat_dir, 'CRB_demographics.mat'));

participant_id = crb_demog.id';
participant_id = cat(1,participant_id{:});

clear sex;
sex_num = crb_demog.data(:,1);
for i = 1:numel(sex_num)
    if sex_num(i) == 2
        sex(i,1) = 'M';
    else
        sex(i,1) = 'F';
    end
end

age = crb_demog.data(:,2);

T = table(participant_id, sex, age);
writetable(T, fullfile(basedir, 'demographics.csv'),'Delimiter','\t','QuoteStrings',true)

%% temp/ratings/reg data
subjects = [];
temperature = [];
ratings_intensity = [];
ratings_unpleasantness = [];
regulation = [];

for i = 1:numel(D.Event_Level.data)
    sub_data = D.Event_Level.data{i}(:,[11 12 13 16]);
    subjects = [subjects;repmat(i, size(sub_data,1),1)];
    temperature = [temperature;sub_data(:,1)];
    ratings_intensity = [ratings_intensity;sub_data(:,2)];
    ratings_unpleasantness = [ratings_unpleasantness;sub_data(:,3)];
    regulation = [regulation;sub_data(:,4)];
end

T = table(subjects, temperature, ratings_intensity, ratings_unpleasantness, regulation);
writetable(T, fullfile(basedir, 'temp_ratings_regulation_data.csv'),'Delimiter','\t','QuoteStrings',true)

% temperature = wani_33.curtemp(:)+32;
% ratings = wani_33.currep(:);
% regulation = wani_33.imaginecode(:);
% subjects = repmat(1:33, 97,1);
% subjects = subjects(:);