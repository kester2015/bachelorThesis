% This is the code implementation of Eq(2) of article: arXiv:1510.03065v2
% Title: "Broadband parametric amplification with impedance engineering: 
% Beyond the gain-bandwidth product"
%
% this script is based on the calculation of \Sigma, which is realized in
% the script called "bigSigma.m"
%
% the first return value is the chi matrix itself;
% the second return value is 11 element of chi matrix
% 11 element is cricual to freq response calculation, so return 11 seperately.
%
% lambda is strength of effective parametric pumping ( see Eq(1) ).
%
% Maodong Gao, March 2, 2019 at Tsinghua. version 0.
function [varargout] = chiMatrix(omega,varargin)
%     ip = inputParser;
%     ip.addParameter('r', 100, @isnumeric);
%     ip.addParameter('cp', 100, @isnumeric);
%     ip.addParameter('omegad', 5e9, @isnumeric);
%     ip.addParameter('zaux', 75, @isnumeric);
%     ip.parse(varargin{:});
%     in = ip.Results;
    
%     if not(mod(nargin,2)) % if omegad' is given, then

    in = parseInput(varargin{:});    
    lambda = in.lambda;    
    omegadPrime = in.omegad - 2 * lambda;

    chiInverse11 = arrayfun(@(x)x-omegadPrime-bigSigma(x,varargin{:}),omega);
    chiInverse12 = arrayfun(@(x)lambda, omega);
    chiInverse21 = arrayfun(@(x)lambda, omega);
    chiInverse22 = arrayfun(@(x)x+omegadPrime-bigSigma(x,varargin{:}),omega);

    chiResult = arrayfun(@(a,b,c,d)inv([a,b;c,d]),...
        chiInverse11,chiInverse12,chiInverse21,chiInverse22,...
        'UniformOutput',false);
    varargout{1} = chiResult;
    varargout{2} = zeros(1,length(omega));
    for ii = 1:length(omega)
        varargout{2}(ii) = chiResult{ii}(1,1);
    end
%     else % if lambda is not given, then let it be the same with omegad
%         chiResult = chiMatrix(omega,0 ,varargin{:});
%     end
end
