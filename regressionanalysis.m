%Normalization of the features
    
for i = 1:length(songlist2)
    response(i) = candidatematrix2{i,9};
end

for i = 1:length(songlist2)
    duration(i) = candidatematrix2{i,2};
end

for i = 1:length(songlist2)
    Duration(i) = (duration(i) - mean(duration))/std(duration); %normalization
end

durationfit = polyfit(Duration,response,1);

for i = 1:length(songlist2)
    loudness(i) = candidatematrix2{i,3};
end

for i = 1:length(songlist2)
    Loudness(i) = (loudness(i) - mean(loudness))/std(loudness);
end

loudnessfit = polyfit(Loudness,response,1);

for i = 1:length(songlist2)
    tempo(i) = candidatematrix2{i,5};
end

for i = 1:length(songlist2)
    Tempo(i) = (tempo(i) - mean(tempo))/std(tempo);
end

tempofit = polyfit(Tempo,response,1);

for i = length(songlist2)
    year(i) = candidatematrix2{i,7};
end
for i = 1:length(songlist2)
    Year(i) = (year(i) - mean(year))/std(year);
end
yearfit = polyfit(Year,response,1);





%Now the prediction
%for duration
for i = 1: length(candidatematrix)
    temp1(i) = candidatematrix{i,2};
end
for i = 1:length(candidatematrix)
    candidatescore(i,1) = polyval(durationfit, (temp1(i) - mean(temp1))/std(temp1));
end
%for loudness
for i = 1: length(candidatematrix)
    temp2(i) = candidatematrix{i,3};
end
for i = 1:length(candidatematrix)
    candidatescore(i,2) = polyval(loudnessfit, (temp2(i) - mean(temp2))/std(temp2));
end
%for tempo

for i = 1: length(candidatematrix)
    temp3(i) = candidatematrix{i,5};
end
for i = 1:length(candidatematrix)
    candidatescore(i,3) = polyval(tempofit, (temp3(i) - mean(temp3))/std(temp3));
end
%for year
for i = 1: length(candidatematrix)
    temp4(i) = candidatematrix{i,7};
end
for i = 1:length(candidatematrix)
    candidatescore(i,4) = polyval(yearfit, (double(temp4(i)) - mean(double(temp4)))/std(double(temp4)));
end
%for release
for i = 1:length(candidatematrix2)
    releaselist{i} = candidatematrix2{i,4};
end
for i = 1:length(candidatematrix)
    if ismember(candidatematrix{i,4}, releaselist) == 1
        candidatescore(i,5) = 1;
    else
        candidatescore(i,5) = 0;
    end
end
%for artist
for i = 1:length(candidatematrix2)
    artistlist{i} = candidatematrix2{i,1};
end
        
for i = 1:length(candidatematrix)
    if ismember(candidatematrix{i,1}, artistlist) == 1
        candidatescore(i,6) = 1;
        
    else
        candidatescore(i,6) = 0; %sequence: duration, loudness, tempo, year, release, artists
    end
end

%here comes the AHP part
finalscore1 = candidatescore*transpose(featureweight);
finalscore = cell(length(finalscore1),2);
for i = 1:length(finalscore)
    finalscore{i,1} = finalscore1(i);
    finalscore{i,2} = candidatematrix{i,4};
end

finalscore = sortrows(finalscore,-1);

%Please calculate the r-squared and cite the code in http://www.mathworks.com/matlabcentral/fileexchange/34492-r-square-the-coefficient-of-determination/content/rsquare.m
