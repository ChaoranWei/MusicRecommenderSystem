%This script output the coefficient of determination for each regression

[r1, error1] = rsquare(response, Duration)
[r2, error2] = rsquare(response, Loudness)
[r3, error3] = rsquare(response, Tempo)
[r4, error4] = rsquare(response, Year)
[r5, error5] = rsquare(response, ones(1,40))
[r6, error6] = rsquare(response, ones(1,40))
