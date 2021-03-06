

function saveGainSpectrum(dir,omega,gain,varargin)
    in = parseInput(varargin{:});
    R = in.r;
    Cp = in.cp;
    omegad = in.omegad;
    Zaux = in.zaux;
    Lambda = in.lambda;
    pumpFreq = in.pumpFreq;
    
    % dir = date + dir;
    
    if not( exist(dir,'dir') )
        mkdir(dir);
    end
    
    filename = dir + sprintf("\\"+"r_%.2f"+"_cp_%.2f"+"pF_omegad_%.2f"+"MHz_zaux_%.2f"+"_lambda_%.2f"+"MHz_pump_%.2f"+"GHz.mat",...
        R,Cp/1e-12,omegad/1e6,Zaux,Lambda/1e6,pumpFreq/1e9);
    
    save(filename,'R','Cp','omegad','Zaux','Lambda','pumpFreq','omega','gain');
end