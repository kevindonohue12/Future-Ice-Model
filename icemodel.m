%Pretty much a testing ground or playground, isn't a needed file,
%but it is important for the process. It is like scrap paper for an exam!

%So far, just modeling Ice Extent and Area 1979-2020
Extent = figure;
Area = figure;
Arctic = figure;
IceArea = readtable("2264_N_09_extent_v3.0.xlsx","PreserveVariableNames",true);

%Ice Extent Over Time
figure(Extent);
IceExtentPlot = plot(IceArea.year,IceArea.extent);
title("Arctic Sea Ice Extent 1979-2020");
xlim([1978 2021]);
hold on
ExpE = plot(fit(IceArea.year,IceArea.extent,"exp1"));
xlabel("Year");
ylabel("Arctic Sea Ice Extent (million square km)");
legend((ExpE),("Prediction"))
hold off

%Ice Area Over Time
figure(Area)
IceAreaPlot = plot(IceArea.year,IceArea.area);
title("Arctic Sea Ice Area 1979-2020");
xlim([1978 2021]);
hold on
%Testing fits on same axes as graphs (Exponential, Linear)
ExpA=plot(fit(IceArea.year,IceArea.area,"exp1"));
xlabel("Year");
ylabel("Arctic Sea Ice Area (million square km)");
legend((ExpA),("Prediction"))
%f=polyfit(IceArea.year,IceArea.area,1);
%Linear = plot(IceArea.year,f(1)*IceArea.year+f(2))
hold off

%Visual
figure(Arctic)
arcticborders('k-',2020);