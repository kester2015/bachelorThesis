% This code serves for the simulation of article: arXiv:1510.03065v2
% Title: "Broadband parametric amplification with impedance engineering: 
% Beyond the gain-bandwidth product"
%
% This script is only auxiliary for input control in other scripts.
% The words used here are all transformed in lowercase.
% The exact meaning of r, cp can be found in Eq(S28)
% The exact meaning of omegad, zaux can be found in the next line of Eq(S22b)
%
% alpha in Eq(S28) is related to the former amounts
function result = parseInput(varargin)
    ip = inputParser;
    ip.addParameter('r', 10, @isnumeric); % environmrnt impedance real part
    ip.addParameter('cp', 1e-9, @isnumeric); % junction capcitance
    ip.addParameter('omegad', 300e6, @isnumeric); % smallomegad in paper, Oscillator(junction) freq - Pump freq
    
    ip.addParameter('pumpFreq', 5e9, @isnumeric); % denoted as bigOmegad in paper
    ip.addParameter('zaux', 50, @isnumeric); 
    ip.addParameter('lambda', 30e6, @isnumeric); % strength of parameteric pumping
    
    
    ip.parse(varargin{:});
    result = ip.Results;
end