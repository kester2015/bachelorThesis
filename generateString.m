function s = generateString(varargin)
    in = parseInput(varargin{:});
    s = sprintf("cp %.2f pF"+", r %.2f"+", omegad %.2f MHz"+", zaux %.2f"+", lambda %.2f MHz"+", pumpFreq %.2f GHz",...
                            in.cp/1e-12,in.r,in.omegad/1e6,in.zaux,in.lambda/1e6,in.pumpFreq/1e9);
end