
function [NOD,HOD,MOD,SOD]=number_of_day(time_start,time_end)

day_s=jday(time_start(1), time_start(2), time_start(3), time_start(4), time_start(5), time_start(6))

day_en=jday(time_end(3), time_end(2), time_end(1), time_end(4), time_end(5), time_end(6))
% number of day
NOD=day_en-day_s;
% hour of day
HOD=NOD*24;
MOD=HOD*60;
SOD=MOD*60;