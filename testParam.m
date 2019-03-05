
% try different coefficient

%% set up 
close all
clear
defaultFreq = linspace(-10e9, 10e9, 20000);

defaultR = 50;
defaultCp = 1e-12;
defaultOmegad = 5e9;
defaultZaux = 75;
defalutLambda = 30e6;
%% sweep cp
cpIterate = linspace(1e-13,9e-13,9);
note = "_Cp_about0.1pF";
% cpIterate = linspace(1e-12,10e-12,10);
step = 0; % the step between different plot lines

thisR = defaultR;
thisOmegad = defaultOmegad;
thisZaux = defaultZaux;
thisLambda = defalutLambda;
thisFreq = defaultFreq;

% do not change anything below in this section
filedir = sprintf("sweep_cp\\"+"r_%.4f"+"_omegad_%.4f"+"GHz_zaux_%.4f"+"_lambda_%.4f"+"MHz"+note,...
    thisR,thisOmegad/1e9,thisZaux,thisLambda/1e6);
if not( exist(filedir,'dir') )
    mkdir(filedir);
end

ii = 0;
gcf = figure('position',[100 100 1000 600]);
legendString = {};
for cp = cpIterate
    gain = gainInFreq(thisFreq,'cp',cp,'r',thisR,'omegad',thisOmegad,'zaux',thisZaux,'lambda',thisLambda);
    saveGainSpectrum(filedir,thisFreq,gain,'cp',cp,'r',thisR,'omegad',thisOmegad,'zaux',thisZaux,'lambda',thisLambda);
   
    hold on
    plot(thisFreq, gain2db(gain) + ii * step); 
    ii = ii +1;
    legendString{ii} = sprintf("%.2f"+"pF",cp/1e-12);
    legend(legendString);
    fprintf("calculating num %d freq response, total %d.\n",ii,length(cpIterate) ) ;
    pause(3)
end

title(sprintf("r %.2f"+" omegad %.2f"+"GHz zaux %.2f"+" lambda %.2f"+"MHz",...
    thisR,thisOmegad/1e9,thisZaux,thisLambda/1e6) );
xlabel("freq/Hz")
ylabel("reflection gain/dB")
saveas(gcf,filedir + "/"+ sprintf("r_%.4f"+"_omegad_%.4f"+"GHz_zaux_%.4f"+"_lambda_%.4f"+"MHz",...
    thisR,thisOmegad/1e9,thisZaux,thisLambda/1e6) + ".jpg" );
%% sweep r
% sweep r at 1-10
% rIterate = linspace(1e-13,9e-13,1);
rIterate = linspace(1,9,9); %,linspace(10,100,10),linspace(200,1000,9)];
note = "_r_about1";
step = 0; % the step between different plot lines

thisCp = 0.9e-12;
thisOmegad = defaultOmegad;
thisZaux = defaultZaux;
thisLambda = defalutLambda;
thisFreq = defaultFreq;

% do not change anything below in this section
filedir = sprintf("sweep_r\\"+"cp_%.4f"+"pF_omegad_%.4f"+"GHz_zaux_%.4f"+"_lambda_%.4f"+"MHz"+note,...
    thisCp/1e-12,thisOmegad/1e9,thisZaux,thisLambda/1e6);
if not( exist(filedir,'dir') )
    mkdir(filedir);
end

close all
ii = 0;
gcf = figure('position',[100 100 1000 600]);
legendString = {};
for r = rIterate
    gain = gainInFreq(thisFreq,'cp',thisCp,'r',r,'omegad',thisOmegad,'zaux',thisZaux,'lambda',thisLambda);
    saveGainSpectrum(filedir,thisFreq,gain,'cp',thisCp,'r',r,'omegad',thisOmegad,'zaux',thisZaux,'lambda',thisLambda);
   
    hold on
    plot(thisFreq, gain2db(gain) + ii * step); 
    ii = ii +1;
    legendString{ii} = sprintf("%.2f"+"次",r);
    legend(legendString);
    fprintf("calculating num %d freq response, total %d.\n",ii,length(rIterate) ) ;
    pause(3)
end

title(sprintf("cp %.2f"+"pF omegad %.2f"+"GHz zaux %.2f"+" lambda %.2f"+"MHz",...
    thisCp/1e-12,thisOmegad/1e9,thisZaux,thisLambda/1e6) );
xlabel("freq/Hz")
ylabel("reflection gain/dB")
saveas(gcf,filedir + "/"+ sprintf("cp_%.4f"+"pF_omegad_%.4f"+"GHz_zaux_%.4f"+"_lambda_%.4f"+"MHz",...
    thisCp/1e-12,thisOmegad/1e9,thisZaux,thisLambda/1e6) + ".jpg" );




% sweep r at 10-100
% rIterate = linspace(1e-13,9e-13,1);
rIterate = linspace(10,100,10);
note = "_r_about10";
step = 0; % the step between different plot lines

thisCp = 0.9e-12;
thisOmegad = defaultOmegad;
thisZaux = defaultZaux;
thisLambda = defalutLambda;
thisFreq = defaultFreq;

% do not change anything below in this section
filedir = sprintf("sweep_r\\"+"cp_%.4f"+"pF_omegad_%.4f"+"GHz_zaux_%.4f"+"_lambda_%.4f"+"MHz"+note,...
    thisCp/1e-12,thisOmegad/1e9,thisZaux,thisLambda/1e6);
if not( exist(filedir,'dir') )
    mkdir(filedir);
end

close all
ii = 0;
gcf = figure('position',[100 100 1000 600]);
legendString = {};
for r = rIterate
    gain = gainInFreq(thisFreq,'cp',thisCp,'r',r,'omegad',thisOmegad,'zaux',thisZaux,'lambda',thisLambda);
    saveGainSpectrum(filedir,thisFreq,gain,'cp',thisCp,'r',r,'omegad',thisOmegad,'zaux',thisZaux,'lambda',thisLambda);
   
    hold on
    plot(thisFreq, gain2db(gain) + ii * step); 
    ii = ii +1;
    legendString{ii} = sprintf("%.2f"+"次",r);
    legend(legendString);
    fprintf("calculating num %d freq response, total %d.\n",ii,length(rIterate) ) ;
    pause(3)
end

title(sprintf("cp %.2f"+"pF omegad %.2f"+"GHz zaux %.2f"+" lambda %.2f"+"MHz",...
    thisCp/1e-12,thisOmegad/1e9,thisZaux,thisLambda/1e6) );
xlabel("freq/Hz")
ylabel("reflection gain/dB")
saveas(gcf,filedir + "/"+ sprintf("cp_%.4f"+"pF_omegad_%.4f"+"GHz_zaux_%.4f"+"_lambda_%.4f"+"MHz",...
    thisCp/1e-12,thisOmegad/1e9,thisZaux,thisLambda/1e6) + ".jpg" );




% sweep r at 100-1000
% rIterate = linspace(1e-13,9e-13,1);
rIterate = linspace(200,1000,9);
note = "_r_about100";
step = 0; % the step between different plot lines

thisCp = 0.9e-12;
thisOmegad = defaultOmegad;
thisZaux = defaultZaux;
thisLambda = defalutLambda;
thisFreq = defaultFreq;

% do not change anything below in this section
filedir = sprintf("sweep_r\\"+"cp_%.4f"+"pF_omegad_%.4f"+"GHz_zaux_%.4f"+"_lambda_%.4f"+"MHz"+note,...
    thisCp/1e-12,thisOmegad/1e9,thisZaux,thisLambda/1e6);
if not( exist(filedir,'dir') )
    mkdir(filedir);
end

close all
ii = 0;
gcf = figure('position',[100 100 1000 600]);
legendString = {};
for r = rIterate
    gain = gainInFreq(thisFreq,'cp',thisCp,'r',r,'omegad',thisOmegad,'zaux',thisZaux,'lambda',thisLambda);
    saveGainSpectrum(filedir,thisFreq,gain,'cp',thisCp,'r',r,'omegad',thisOmegad,'zaux',thisZaux,'lambda',thisLambda);
   
    hold on
    plot(thisFreq, gain2db(gain) + ii * step); 
    ii = ii +1;
    legendString{ii} = sprintf("%.2f"+"次",r);
    legend(legendString);
    fprintf("calculating num %d freq response, total %d.\n",ii,length(rIterate) ) ;
    pause(3)
end

title(sprintf("cp %.2f"+"pF omegad %.2f"+"GHz zaux %.2f"+" lambda %.2f"+"MHz",...
    thisCp/1e-12,thisOmegad/1e9,thisZaux,thisLambda/1e6) );
xlabel("freq/Hz")
ylabel("reflection gain/dB")
saveas(gcf,filedir + "/"+ sprintf("cp_%.4f"+"pF_omegad_%.4f"+"GHz_zaux_%.4f"+"_lambda_%.4f"+"MHz",...
    thisCp/1e-12,thisOmegad/1e9,thisZaux,thisLambda/1e6) + ".jpg" );

%% sweep zaux
% sweep zaux at 1-10
% rIterate = linspace(1e-13,9e-13,1);
zauxIterate = linspace(1,9,9); %,linspace(10,100,10),linspace(200,1000,9)]
note = "_zaux_about1";
step = 0; % the step between different plot lines

thisCp = 0.9e-12;
thisOmegad = defaultOmegad;
thisR = 60;
thisLambda = defalutLambda;
thisFreq = defaultFreq;

% do not change anything below in this section
filedir = sprintf("sweep_zaux\\"+"cp_%.4f"+"pF_r_%.4f_omegad_%.4f"+"GHz"+"_lambda_%.4f"+"MHz"+note,...
    thisCp/1e-12,thisR,thisOmegad/1e9,thisLambda/1e6);
if not( exist(filedir,'dir') )
    mkdir(filedir);
end

close all
ii = 0;
gcf = figure('position',[100 100 1000 600]);
legendString = {};
for zaux = zauxIterate
    gain = gainInFreq(thisFreq,'cp',thisCp,'r',thisR,'omegad',thisOmegad,'zaux',zaux,'lambda',thisLambda);
    saveGainSpectrum(filedir,thisFreq,gain,'cp',thisCp,'r',thisR,'omegad',thisOmegad,'zaux',zaux,'lambda',thisLambda);
   
    hold on
    plot(thisFreq, gain2db(gain) + ii * step); 
    ii = ii +1;
    legendString{ii} = sprintf("zaux %.2f"+"次",zaux);
    legend(legendString);
    fprintf("calculating num %d freq response, total %d.\n",ii,length(zauxIterate) ) ;
    pause(3)
end

title(sprintf("cp %.2f"+"pF r %.2f"+" omegad %.2f"+"GHz"+" lambda %.2f"+"MHz",...
    thisCp/1e-12,thisR,thisOmegad/1e9,thisLambda/1e6) );
xlabel("freq/Hz")
ylabel("reflection gain/dB")
saveas(gcf,filedir + "/"+ sprintf("cp_%.4f"+"pF_r_%.4f"+"_omegad_%.4f"+"GHz"+"_lambda_%.4f"+"MHz",...
    thisCp/1e-12,thisR,thisOmegad/1e9,thisLambda/1e6) + ".jpg" );




% sweep zaux at 10-100
% rIterate = linspace(1e-13,9e-13,1);
zauxIterate = linspace(10,100,10); %,linspace(200,1000,9)]
note = "_zaux_about10";
step = 0; % the step between different plot lines

thisCp = 0.9e-12;
thisOmegad = defaultOmegad;
thisR = 60;
thisLambda = defalutLambda;
thisFreq = defaultFreq;

% do not change anything below in this section
filedir = sprintf("sweep_zaux\\"+"cp_%.4f"+"pF_r_%.4f_omegad_%.4f"+"GHz"+"_lambda_%.4f"+"MHz"+note,...
    thisCp/1e-12,thisR,thisOmegad/1e9,thisLambda/1e6);
if not( exist(filedir,'dir') )
    mkdir(filedir);
end

close all
ii = 0;
gcf = figure('position',[100 100 1000 600]);
legendString = {};
for zaux = zauxIterate
    gain = gainInFreq(thisFreq,'cp',thisCp,'r',thisR,'omegad',thisOmegad,'zaux',zaux,'lambda',thisLambda);
    saveGainSpectrum(filedir,thisFreq,gain,'cp',thisCp,'r',thisR,'omegad',thisOmegad,'zaux',zaux,'lambda',thisLambda);
   
    hold on
    plot(thisFreq, gain2db(gain) + ii * step); 
    ii = ii +1;
    legendString{ii} = sprintf("zaux %.2f"+"次",zaux);
    legend(legendString);
    fprintf("calculating num %d freq response, total %d.\n",ii,length(zauxIterate) ) ;
    pause(3)
end

title(sprintf("cp %.2f"+"pF r %.2f"+" omegad %.2f"+"GHz"+" lambda %.2f"+"MHz",...
    thisCp/1e-12,thisR,thisOmegad/1e9,thisLambda/1e6) );
xlabel("freq/Hz")
ylabel("reflection gain/dB")
saveas(gcf,filedir + "/"+ sprintf("cp_%.4f"+"pF_r_%.4f"+"_omegad_%.4f"+"GHz"+"_lambda_%.4f"+"MHz",...
    thisCp/1e-12,thisR,thisOmegad/1e9,thisLambda/1e6) + ".jpg" );


% sweep zaux at 100-1000
% rIterate = linspace(1e-13,9e-13,1);
zauxIterate = linspace(200,1000,9);
note = "_zaux_about100";
step = 0; % the step between different plot lines

thisCp = 0.9e-12;
thisOmegad = defaultOmegad;
thisR = 60;
thisLambda = defalutLambda;
thisFreq = defaultFreq;

% do not change anything below in this section
filedir = sprintf("sweep_zaux\\"+"cp_%.4f"+"pF_r_%.4f_omegad_%.4f"+"GHz"+"_lambda_%.4f"+"MHz"+note,...
    thisCp/1e-12,thisR,thisOmegad/1e9,thisLambda/1e6);
if not( exist(filedir,'dir') )
    mkdir(filedir);
end

close all
ii = 0;
gcf = figure('position',[100 100 1000 600]);
legendString = {};
for zaux = zauxIterate
    gain = gainInFreq(thisFreq,'cp',thisCp,'r',thisR,'omegad',thisOmegad,'zaux',zaux,'lambda',thisLambda);
    saveGainSpectrum(filedir,thisFreq,gain,'cp',thisCp,'r',thisR,'omegad',thisOmegad,'zaux',zaux,'lambda',thisLambda);
   
    hold on
    plot(thisFreq, gain2db(gain) + ii * step); 
    ii = ii +1;
    legendString{ii} = sprintf("zaux %.2f"+"次",zaux);
    legend(legendString);
    fprintf("calculating num %d freq response, total %d.\n",ii,length(zauxIterate) ) ;
    pause(3)
end

title(sprintf("cp %.2f"+"pF r %.2f"+" omegad %.2f"+"GHz"+" lambda %.2f"+"MHz",...
    thisCp/1e-12,thisR,thisOmegad/1e9,thisLambda/1e6) );
xlabel("freq/Hz")
ylabel("reflection gain/dB")
saveas(gcf,filedir + "/"+ sprintf("cp_%.4f"+"pF_r_%.4f"+"_omegad_%.4f"+"GHz"+"_lambda_%.4f"+"MHz",...
    thisCp/1e-12,thisR,thisOmegad/1e9,thisLambda/1e6) + ".jpg" );

