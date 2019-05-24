
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


%% first approximately find parameters
close all
filedir = date + "\\tests";

thisFreq = linspace(-10e9, 10e9, 20000);

thisR = 50;
thisCp = 1.2e-12;
thisOmegad = 300e6;
thisPumpFreq = 5e9;
thisZaux = 75;
thisLambda = 900e6;

thisGain = gainInFreq(thisFreq,'cp',thisCp,'r',thisR,'omegad',thisOmegad,'zaux',thisZaux,'lambda',thisLambda,'pumpFreq',thisPumpFreq);
saveGainSpectrum(filedir,thisFreq,thisGain,'cp',thisCp,'r',thisR,'omegad',thisOmegad,'zaux',thisZaux,'lambda',thisLambda,'pumpFreq',thisPumpFreq);

gcf = figure('position',[100 100 1000 600]);
plot( (thisPumpFreq + thisFreq)/1e9, gain2db(thisGain) ); 
xlabel("freq/GHz")
ylabel("reflection gain/dB")
saveas(gcf,filedir + "/"+ sprintf("cp_%.4f"+"pF_r_%.4f"+"_omegad_%.4f"+"MHz"+"_lambda_%.4f"+"MHz"+"_pumpFreq_%",...
    thisCp/1e-12,thisR,thisOmegad/1e6,thisLambda/1e6,thisPumpFreq/1e9) + ".fig" );
saveas(gcf,filedir + "/"+ sprintf("cp_%.4f"+"pF_r_%.4f"+"_omegad_%.4f"+"MHz"+"_lambda_%.4f"+"MHz"+"_pumpFreq_%",...
    thisCp/1e-12,thisR,thisOmegad/1e6,thisLambda/1e6,thisPumpFreq/1e9) + ".jpg" );

 %% first approximately find parameters(exactly the same as last one)
close all
filedir = date + "\\tests";

thisFreq = linspace(-10e9, 10e9, 4000);

thisR = 20;
thisCp = 1.2e-12;
thisOmegad = 500e6;
thisPumpFreq = 5e9;
thisZaux = 300;
thisLambda = 500e6;

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

%% sweep Zaux
zauxIterate = linspace(10,3000,20);

thisFreq = linspace(-10e9, 10e9, 4000);

thisR = 20;
thisCp = 1.2e-12;
thisOmegad = 500e6;
thisPumpFreq = 5e9;
% thisZaux = 300;
thisLambda = 500e6;


gainResults = zeros( length(zauxIterate),length(thisFreq) );

filedir = "new\\_test_sweepZaux";

ii = 0;
gcf = figure('position',[100 100 1000 600]);
legendString = {};
for zaux = zauxIterate
    ii = ii + 1;
    thisGain = gainInFreq(thisFreq,'cp',thisCp,'r',thisR,'omegad',thisOmegad,'zaux',zaux,'lambda',thisLambda,'pumpFreq',thisPumpFreq);
    saveGainSpectrum(filedir,thisFreq,thisGain,'cp',thisCp,'r',thisR,'omegad',thisOmegad,'zaux',zaux,'lambda',thisLambda,'pumpFreq',thisPumpFreq);
    
    gainResults(ii,:) = thisGain;
    
    hold on
    plot( (thisPumpFreq + thisFreq)/1e9, gain2db(thisGain) ); 
    legendString{ii} = sprintf("zaux %.2f"+"¦¸",zaux);
    legend(legendString);
    fprintf("calculating num %d freq response, total %d.\n",ii,length(zauxIterate) ) ;
    pause(3)
end

% title(sprintf("cp %.2f"+"pF r %.2f"+" omegad %.2f"+"GHz"+" lambda %.2f"+"MHz",...
%     thisCp/1e-12,thisR,thisOmegad/1e9,thisLambda/1e6) );
xlabel("freq/GHz")
ylabel("reflection gain/dB")
saveas(gcf,filedir + "/"+ sprintf("cp_%.4f"+"pF_r_%.4f"+"_omegad_%.4f"+"MHz"+"_lambda_%.4f"+"MHz"+"_pumpFreq_%",...
    thisCp/1e-12,thisR,thisOmegad/1e6,thisLambda/1e6,thisPumpFreq/1e9) + ".fig" );

%% pcolor plot
% close all
% colormap(flipud(hot));
gcf = figure('position',[100 100 1000 600]);
pcolor(thisFreq, zauxIterate,gainResults)
shading interp
colorbar;


%% sweep r
rIterate = linspace(10,3000,20);

thisFreq = linspace(-10e9, 10e9, 4000);

thisR = 20;
thisCp = 1.2e-12;
thisOmegad = 500e6;
thisPumpFreq = 5e9;
thisZaux = 75;
thisLambda = 500e6;


gainResults = zeros( length(rIterate),length(thisFreq) );

filedir = "new\\_test_sweepZaux";

ii = 0;
gcf = figure('position',[100 100 1000 600]);
legendString = {};
for r = rIterate
    ii = ii + 1;
    thisGain = gainInFreq(thisFreq,'cp',thisCp,'r',thisR,'omegad',thisOmegad,'zaux',zaux,'lambda',thisLambda,'pumpFreq',thisPumpFreq);
    saveGainSpectrum(filedir,thisFreq,thisGain,'cp',thisCp,'r',thisR,'omegad',thisOmegad,'zaux',zaux,'lambda',thisLambda,'pumpFreq',thisPumpFreq);
    
    gainResults(ii,:) = thisGain;
    
    hold on
    plot( (thisPumpFreq + thisFreq)/1e9, gain2db(thisGain) ); 
    legendString{ii} = sprintf("zaux %.2f"+"¦¸",zaux);
    legend(legendString);
    fprintf("calculating num %d freq response, total %d.\n",ii,length(zauxIterate) ) ;
    pause(3)
end

% title(sprintf("cp %.2f"+"pF r %.2f"+" omegad %.2f"+"GHz"+" lambda %.2f"+"MHz",...
%     thisCp/1e-12,thisR,thisOmegad/1e9,thisLambda/1e6) );
xlabel("freq/GHz")
ylabel("reflection gain/dB")
saveas(gcf,filedir + "/"+ sprintf("cp_%.4f"+"pF_r_%.4f"+"_omegad_%.4f"+"MHz"+"_lambda_%.4f"+"MHz"+"_pumpFreq_%",...
    thisCp/1e-12,thisR,thisOmegad/1e6,thisLambda/1e6,thisPumpFreq/1e9) + ".fig" );

%% pcolor plot
% close all
% colormap(flipud(hot));
gcf = figure('position',[100 100 1000 600]);
pcolor(thisFreq, zauxIterate,gainResults)
shading interp
colorbar;


