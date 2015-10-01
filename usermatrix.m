fileID = fopen('user1.txt');
userinfo = textscan(fileID, '%s %s %s');
fclose(fileID);
score = zeros(length(userstorage),2);
for i = 1: length(userstorage)
    score(i,1) = i;
    count = 0;
    for j = 1:length(userstorage{i})
        for k = 1:length(userinfo{2})
            if strcmp(userstorage{i}{j,1},userinfo{2}{k}) == 1
                score(i,2) = score(i,2) + str2double(userstorage{i}{j,2}) * str2double(userinfo{3}{k});
                count = count + 1;
            end
        end
    end
    if score(i,2) ~= 0
        score(i,2) = score(i,2) / count; %This is to normalize similarity per song
    end
end

