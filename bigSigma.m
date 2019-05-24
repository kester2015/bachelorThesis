% This is the code implementation of Eq(S28) of article: arXiv:1510.03065v2
% Title: "Broadband parametric amplification with impedance engineering: 
% Beyond the gain-bandwidth product"
%
% Want to ultimately simulate freq respond, which is basically calculate
% Eq(S30) of this article, so calculate \Sigma first.
%
% Maodong Gao, March 1, 2019 at Tsinghua. version 0.
% Maodong Gao, May 24, 2019 at Tsinghua. version 1.
function [sigmaResult] = bigSigma(omega, varargin)
    % This equ can be found in the next line of Eq(S30)
    sigmaResult = bigDelta(omega,varargin{:}) - 1i * smallKappa(omega,varargin{:})/2 ;
end


% defaultR = 100;
% defaultCp = 100;
% defaultOmegad = 5e9;
% defaultZaux = 75;

function [deltaResult] = bigDelta( omega, varargin )
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
%     coeff = 1/(2 * alpha * in.cp);

    alpha = 2 * in.zaux / in.pumpFreq;
    kappa = 2 * in.r / alpha;
    kappa0 = 1/ (in.r * in.cp);
    coeff = 1/( 2 * alpha * in.cp);
    
    % This is Eq(S28a)
    deltaResult = arrayfun(@(x)coeff * x / (x^2 + in.r^2 / alpha^2),omega);
end

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