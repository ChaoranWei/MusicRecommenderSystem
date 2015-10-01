candidate = sortrows(score,2);
count = 0;
i = length(score);
finalset = [];
while candidate(i,2) > 1
    count = count + 1;
    finalset(count) = candidate(i,1);
    i = i - 1;
end
poolset = {};
count1 = 0;
for i = 1:length(finalset)
    for j = 1:length(userstorage{finalset(i)})
        count1 = count1 + 1;
        poolset{count1} = userstorage{finalset(i)}{j,1};
    end
end  
usersongs = {};
for i = 1:length(userinfo{2})
    usersongs{i} = userinfo{2}{i};
end

poolset = setdiff(poolset,usersongs); %This is the pool of all song candidate
