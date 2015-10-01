% set up Million Song paths
cd mksqlite
mksqlite('typedBLOBs',2)

cd ..
% add mksqlite to the path
addpath('mksqlite');

global MillionSong MSDsubset
MillionSong ='MillionSongSubset';  % or 'MillionSong' for full set
msd_data_path=[MillionSong,'/data'];
msd_test_path = [MillionSong,'/test data'];
msd_addf_path=[MillionSong,'/AdditionalFiles'];
MSDsubset='subset_'; % or '' for full set
msd_addf_prefix=[msd_addf_path,'/',MSDsubset];
% Check that we can actually read the dataset
assert(exist(msd_data_path,'dir')==7,['msd_data_path ',msd_data_path,' is not found.']);

% path to the Million Song Dataset code
msd_code_path='MSongsDB';
assert(exist(msd_code_path,'dir')==7,['msd_code_path ',msd_code_path,' is wrong.']);
% add to the path
addpath([msd_code_path,'/MatlabSrc']);

all_files = findAllFiles(msd_data_path);
test_files = findAllFiles(msd_test_path);
lendata = length(all_files);
lentest = length(test_files);
disp(['Number of h5 data files: ',num2str(lendata)]);
disp(['Number of h5 test files: ',num2str(lentest)]);
%all_id = cellfun(@(f) get_song_id(HDF5_Song_File_Reader(f)), ...
                          % all_files, 'UniformOutput', false);

%what we get from questionnaire and users history will fill in the gap
duration = 1/6;
loudness = 1/3;
tempo = 1/5;
year = 1/2;
release = 1;
artist = 1;
featureweight = [duration, loudness,tempo,year,release, artist];
count = 0;
for i = 1:length(featureweight)
    count = count + featureweight(i);
end

featureweight = featureweight / count;

fileID = fopen('triplet.txt');
C = textscan(fileID, '%s %s %s');
fclose(fileID);



