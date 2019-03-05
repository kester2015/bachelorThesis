

function saveGainSpectrum(dir,omega,gain,varargin)
    in = parseInput(varargin{:});
    R = in.r;
    Cp = in.cp;
    Omegad = in.omegad;
    Zaux = in.zaux;
    Lambda = in.lambda;
    
    filename = dir + sprintf("\\"+"r_%.2f"+"_cp_%.2f"+"pF_omegad_%.2f"+"GHz_zaux_%.2f"+"_lambda_%.2f"+"MHz.mat",...
        R,Cp/1e-12,Omegad/1e9,Zaux,Lambda/1e6);
    
    save(filename,'R','Cp','Omegad','Zaux','Lambda','omega','gain');
end