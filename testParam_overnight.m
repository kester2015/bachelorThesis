% calculate gain spectrum 
%% default set up
close all
clear
defaultFreq = linspace(-10e9, 10e9, 20000);

defaultR = 50;
defaultCp = 1e-12;
defaultOmegad = 300e6; % detuning between pump and oscillator resonant freq
defaultPumpFreq = 5e9; % pump freq
defaultZaux = 75;
defalutLambda = 30e6;
%% 
close all
filedir = date + "\\tests";

thisFreq = linspace(-10e9, 10e9, 2000);

RIterate = linspace(0,150,30);
CpIterate = linspace(0.01e-12,20e-12,50);
ZauxIterate = linspace(0, 1000, 50);
OmegadIterate = linspace(0,1000e6,10);
LambdaIterate = linspace(100e6,5e9,10);
% 
% thisR = 20;
% thisCp = 1.2e-12;
% thisOmegad = 500e6;
thisPumpFreq = 5e9;
% thisZaux = 300;
thisLambda = 500e6;


Rii = 0;
Cpii = 0;
Zauxii = 0;
Omegadii = 0;
Lambdaii = 0;
for thisR = RIterate
    Rii = Rii + 1;
    for thisCp = CpIterate
        Cpii = Cpii + 1;
        for thisZaux = ZauxIterate
            Zauxii = Zauxii +1;
            for thisOmegad = OmegadIterate
                Omegadii = Omegadii + 1;
                for thisLambda = LambdaIterate
                    Lambdaii = Lambdaii + 1;
                tic;
                
                thisGain = gainInFreq(thisFreq,'cp',thisCp,'r',thisR,'omegad',thisOmegad,'zaux',thisZaux,'lambda',thisLambda,'pumpFreq',thisPumpFreq);
                saveGainSpectrum(filedir,thisFreq,thisGain,'cp',thisCp,'r',thisR,'omegad',thisOmegad,'zaux',thisZaux,'lambda',thisLambda,'pumpFreq',thisPumpFreq);
                
                gcf = figure('position',[100 100 1000 600]);
                plot( (thisPumpFreq + thisFreq)/1e9, gain2db(thisGain) ); 
                xlabel("freq/GHz")
                ylabel("reflection/dB")
                saveas(gcf,filedir + "/"+ sprintf("cp_%.4f"+"pF_r_%.4f"+"_omegad_%.4f"+"MHz"+"_lambda_%.4f"+"MHz"+"_pumpFreq_%",...
                    thisCp/1e-12,thisR,thisOmegad/1e6,thisLambda/1e6,thisPumpFreq/1e9) + ".fig" );
                saveas(gcf,filedir + "/"+ sprintf("cp_%.4f"+"pF_r_%.4f"+"_omegad_%.4f"+"MHz"+"_lambda_%.4f"+"MHz"+"_pumpFreq_%",...
                    thisCp/1e-12,thisR,thisOmegad/1e6,thisLambda/1e6,thisPumpFreq/1e9) + ".jpg" );
                
                
                
                t = toc;
                predictTime = t * length(RIterate)*length(CpIterate)*length(ZauxIterate)*length(OmegadIterate)/3600;
                fprintf("calculating num (%d,%d,%d,%d) freq response, total (%d,%d,%d,%d), remaining &.2f hours.\n",...
                    Rii, Cpii, Zauxii, Omegadii,...
                    length(RIterate),length(CpIterate),length(ZauxIterate),length(OmegadIterate),...
                    predictTime) ;
                end
            end            
        end
    end
end







