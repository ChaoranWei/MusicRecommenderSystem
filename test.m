finalscore1 = candidatescore*transpose(featureweight);
finalscore = cell(length(finalscore1),2);
for i = 1:length(finalscore)
    finalscore{i,1} = finalscore1(i);
    finalscore{i,2} = candidatematrix{i,4};
end

finalscore = sortrows(finalscore,-1);