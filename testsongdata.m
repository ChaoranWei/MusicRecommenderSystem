poolindex = randi([0,8000],100,1);

for i = 1:100
    songlist{i} = HDF5_Song_File_Reader(all_files{poolindex(i)});
end

for i = 1:100
    candidatematrix{i,1} = songlist{i}.get_artist_name();
    candidatematrix{i,2} = songlist{i}.get_duration();
    candidatematrix{i,3} = songlist{i}.get_loudness();
    candidatematrix{i,4} = songlist{i}.get_release();
    candidatematrix{i,5} = songlist{i}.get_tempo();
    candidatematrix{i,6} = songlist{i}.get_title();
    candidatematrix{i,7} = songlist{i}.get_year();
    candidatematrix{i,8} = songlist{i}.get_song_id();
end
%This generate candidate pool songs matrix

poolindex2 = randi([0,8000],20,1);
for i = 1:40
    songlist2{i} = HDF5_Song_File_Reader(all_files{poolindex(i)});
end

for i = 1:40
    candidatematrix2{i,1} = songlist2{i}.get_artist_name();
    candidatematrix2{i,2} = songlist2{i}.get_duration();
    candidatematrix2{i,3} = songlist2{i}.get_loudness();
    candidatematrix2{i,4} = songlist2{i}.get_release();
    candidatematrix2{i,5} = songlist2{i}.get_tempo();
    candidatematrix2{i,6} = songlist2{i}.get_title();
    candidatematrix2{i,7} = songlist2{i}.get_year();
    candidatematrix2{i,8} = songlist2{i}.get_song_id();
    candidatematrix2{i,9} = 3*randn();
end %This generate the user-feature matrix