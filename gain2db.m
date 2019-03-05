
function [dbGain] = gain2db(gain)
    dbGain = arrayfun(@(x)10*log(x),gain);
end