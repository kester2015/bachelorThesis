% This is a deprecated version

function [deltaResult] = bigDelta( omega, varargin )
%     ip = inputParser;
%     ip.addParameter('r', 100, @isnumeric);
%     ip.addParameter('cp', 100, @isnumeric);
%     ip.addParameter('omegad', 5e9, @isnumeric);
%     ip.addParameter('zaux', 75, @isnumeric);
%     ip.parse(varargin{:});
%     in = ip.Results;
    in = parseInput(varargin{:});
    kappa = in.omegad * in.r / in.zaux;
    kappa0 = 1 / (in.r * in.cp);
    alpha = 2 * in.r / kappa;
    
    coeff = 1/(2 * alpha * in.cp);
    deltaResult = arrayfun(@(x)coeff * x / (x^2 + in.r^2 / alpha^2),omega);
end