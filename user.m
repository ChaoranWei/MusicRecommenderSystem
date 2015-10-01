userstorage = cell(1,length(C{1}));
userid = cell(1,length(C{1}));
count = 1;
for i = 1: length(C{1})
    if i > 1
        if strcmp(C{1}{i}, C{1}{i-1}) == 0
            count = count + 1;
        end
    end
    
    songname = C{2}{i};
    playcount = C{3}{i};
    song_info = {songname, playcount};   
    
    if size(userstorage{count}) == 0,0;
        userstorage{count} = song_info;
        count2 = 1;
    else
        count2 = count2 + 1;
        userstorage{count}{count2, 1} = song_info{1};
        userstorage{count}{count2, 2} = song_info{2};
    end
end
userstorage = userstorage(:,1:count);