% This is a deprecated version
function [kappaResult] = smallKappa( omega, varargin )
%     ip = inputParser;
%     ip.addParameter('r', 100, @isnumeric);
%     ip.addParameter('cp', 100, @isnumeric);
%     ip.addParameter('omegad', 5e9, @isnumeric);
%     ip.addParameter('zaux', 75, @isnumeric);
%     ip.parse(varargin{:});
%     in = ip.Results;
    in = parseInput(varargin{:});
    
%     kappa = in.omegad * in.r / in.zaux;
%     kappa0 = 1 / (in.r * in.cp);
%     alpha = 2 * in.r / kappa;

    alpha = 2 * in.zaux / in.pumpFreq;
    kappa = 2 * in.r / alpha;
    kappa0 = 1/ (in.r * in.cp);    
%     disp(in.r/alpha); % pole position
    coeff = in.r/(alpha^2 * in.cp);
    
    % This is Eq(S28b)
    kappaResult = arrayfun(@(x)coeff / (x^2 + in.r^2 / alpha^2),omega);
end

% 
% function [kappaResult] = smallKappa( omega, varargin )
% %     ip = inputParser;
% %     ip.addParameter('r', 100, @isnumeric);
% %     ip.addParameter('cp', 100, @isnumeric);
% %     ip.addParameter('omegad', 5e9, @isnumeric);
% %     ip.addParameter('zaux', 75, @isnumeric);
% %     ip.parse(varargin{:});
% %     in = ip.Results;
%     in = parseInput(varargin{:});
%     
%     kappa = in.omegad * in.r / in.zaux;
%     kappa0 = 1 / (in.r * in.cp);
%     alpha = 2 * in.r / kappa;
% %     disp(in.r/alpha); % pole position
%     coeff = in.r/(alpha^2 * in.cp);
%     kappaResult = arrayfun(@(x)coeff / (x^2 + in.r^2 / alpha^2),omega);
% end