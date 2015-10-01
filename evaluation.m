for i = 1:8000
    for j = 1:15
        if all_id{i} == user{1}{j}
            songlist2{j,1} = HDF5_Song_File_Reader(all_files{i});
            songlist2{j,2} = user{2}{j};
        end
    end
end
