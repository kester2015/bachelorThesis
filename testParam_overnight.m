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
clear
warning('off');
thisFreq = linspace(-10e9, 10e9, 2000);

RIterate = [1,5,linspace(10,50,5),100]% linspace(10,150,15);
CpIterate = [0.01e-12, 0.1e-12, 1e-12,1.2e-12, 3e-12, 5e-12, 10e-12, 50e-12, 100e-12]% linspace(0.1e-12,10e-12,5);
ZauxIterate = [1,5,linspace(10,100,10),200,300,500,1000,10000]% linspace(10, 1000, 20);
OmegadIterate = [100e6, 500e6, 1000e6];% linspace(100e6,1000e6,10);
LambdaIterate = [100e6, 500e6, 1000e6];%500e6; %linspace(100e6,5e9,10);
% 
% thisR = 20;
% thisCp = 1.2e-12;
% thisOmegad = 500e6;
thisPumpFreq = 5e9;
% thisZaux = 300;
% thisLambda = 500e6;

filedir = "overnight_"+date;
Rii = 0;
Cpii = 0;
Zauxii = 0;
Omegadii = 0;
Lambdaii = 0;
for thisR = RIterate
    Rii = Rii + 1;
    Cpii = 0;
    Zauxii = 0;
    Omegadii = 0;
    Lambdaii = 0;
    for thisCp = CpIterate
        Cpii = Cpii + 1;
        Zauxii = 0;
        Omegadii = 0;
        Lambdaii = 0;
        for thisZaux = ZauxIterate
            Zauxii = Zauxii +1;
            Omegadii = 0;
            Lambdaii = 0;
            for thisOmegad = OmegadIterate
                Omegadii = Omegadii + 1;
                Lambdaii = 0;
                for thisLambda = LambdaIterate
                    Lambdaii = Lambdaii + 1;
                    
                        tic;

                        thisGain = gainInFreq(thisFreq,'cp',thisCp,'r',thisR,'omegad',thisOmegad,'zaux',thisZaux,'lambda',thisLambda,'pumpFreq',thisPumpFreq);
                        saveGainSpectrum(filedir,thisFreq,thisGain,'cp',thisCp,'r',thisR,'omegad',thisOmegad,'zaux',thisZaux,'lambda',thisLambda,'pumpFreq',thisPumpFreq);

                        close all
                        gcf = figure('position',[150 150 1050 650]);
                        plot( (thisPumpFreq + thisFreq)/1e9, gain2db(thisGain) ); 
                        xlabel("freq/GHz")
                        ylabel("reflection/dB")
                        title( generateString('cp',thisCp,'r',thisR,'omegad',thisOmegad,'zaux',thisZaux,'lambda',thisLambda,'pumpFreq',thisPumpFreq) );
                        saveas(gcf,filedir + "/"+ generateString('cp',thisCp,'r',thisR,'omegad',thisOmegad,'zaux',thisZaux,'lambda',thisLambda,'pumpFreq',thisPumpFreq) + ".fig" );
                        saveas(gcf,filedir + "/"+ generateString('cp',thisCp,'r',thisR,'omegad',thisOmegad,'zaux',thisZaux,'lambda',thisLambda,'pumpFreq',thisPumpFreq) + ".jpg" );



                        t = toc;
                        predictTime = t * length(RIterate)*length(CpIterate)*length(ZauxIterate)*length(OmegadIterate)*length(LambdaIterate)/3600;
                        fprintf("calculating num (%d,%d,%d,%d,%d) freq response, total (%d,%d,%d,%d,%d), remaining %.2f hours.\n",...
                            Rii, Cpii, Zauxii, Omegadii, Lambdaii,...
                            length(RIterate),length(CpIterate),length(ZauxIterate),length(OmegadIterate),length(LambdaIterate),...
                            predictTime) ;
                        
                end
            end            
        end
    end
end







