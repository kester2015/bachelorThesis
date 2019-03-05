% This is the code implementation of Eq(4a) of article: arXiv:1510.03065v2
% Title: "Broadband parametric amplification with impedance engineering: 
% Beyond the gain-bandwidth product"
%
% this script is based on the calculation of \chi11, which is realized in
% the script called "chiMatrix.m"(the second return value is chi11)
%

function [gainResult] = gainInFreq(omega,varargin)
    kappa = smallKappa(omega,varargin{:});
    [~,chi11] = chiMatrix(omega,varargin{:});
    transmission = arrayfun( @(a,b)a*b, kappa, chi11 );
    reflection = 1 - transmission;
    gainResult = abs(reflection).^2;
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
    
    kappa = in.omegad * in.r / in.zaux;
    kappa0 = 1 / (in.r * in.cp);
    alpha = 2 * in.r / kappa;
%     disp(in.r/alpha); % pole position
    coeff = in.r/(alpha^2 * in.cp);
    kappaResult = arrayfun(@(x)coeff / (x^2 + in.r^2 / alpha^2),omega);
end