basedir = '/Users/clinpsywoo/Dropbox/2011-yr/Teaching/R_stats/Stats2_2020Fall/data/study1';
original_dat_dir = fullfile(basedir, 'original_datafile');
load(fullfile(original_dat_dir, 'wani_33_variables.mat'));

temperature = wani_33.curtemp(:)+32;
ratings = wani_33.currep(:);
regulation = wani_33.imaginecode(:);
subjects = repmat(1:33, 97,1);
subjects = subjects(:);

% T = table(subjects, temperature, ratings, regulation);
% writetable(T, fullfile(basedir, 'temp_ratings_regulation_data.csv'),'Delimiter','\t','QuoteStrings',true)

%%

u = unique(wani_33.curtemp);

% [(1:size(u,1))' u]
% 
% ans =
% 
%     1.0000   42.8000
%     2.0000   44.1000
%     3.0000   44.3000
%     4.0000   45.3000
%     5.0000   45.4000
%     6.0000   46.0000
%     7.0000   46.3000
%     8.0000   46.7000
%     9.0000   47.0000
%    10.0000   47.3000
%    11.0000   48.0000
%    12.0000   48.3000
%    13.0000   49.3000

curtemp = NaN(size(wani_33.curtemp));

curtemp(wani_33.curtemp == u(1) | wani_33.curtemp == u(2) | wani_33.curtemp == u(3)) = 44.3;

curtemp(wani_33.curtemp == u(4) | wani_33.curtemp == u(5)) = 45.3;

curtemp(wani_33.curtemp == u(6) | wani_33.curtemp == u(7) | wani_33.curtemp == u(8)) = 46.3;

curtemp(wani_33.curtemp == u(9) | wani_33.curtemp == u(10)) = 47.3;

curtemp(wani_33.curtemp == u(11) | wani_33.curtemp == u(12)) = 48.3;

curtemp(wani_33.curtemp == u(13)) = 49.3;


T = table(subjects, curtemp(:), ratings, regulation);
writetable(T, fullfile(basedir, 'temp_ratings_regulation_data.csv'),'Delimiter','\t','QuoteStrings',true)

%%

uu = unique(curtemp);
avg_temp = NaN(max(subjects), 6);

for i = 1:max(subjects)
    rat_temp = ratings(subjects==i);
    for j = 1:6
        avg_temp(i,j) = mean(rat_temp(curtemp(subjects==i)==uu(j)));
    end
end
