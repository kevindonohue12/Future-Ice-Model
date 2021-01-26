function[Extent,Area]=forecast(year)
%When given a year, shows the estimate for minimum ice extent
%and ice area in the Arctic region
%Meant as a FORECAST MODEL, going far into the past makes it inaccurate

%Sets two visual figures, and reads data from NASA
IceArea = readtable("2264_N_09_extent_v3.0.xlsx","PreserveVariableNames",true);
LargerView = figure;
SmallerView = figure;

%Creates lines of best fit for extent and area relationships
Ef = fit(IceArea.year,IceArea.extent,"exp1");
Af = fit(IceArea.year,IceArea.area,"exp1");

%Two assigned outputs, displaying the minimum extent and area
Extent = "The Minimum Extent of the Arctic Ice in " + year + " will be " + Ef(year)+ " million square km.";
Area = "The Minimum Area of the Arctic Ice in " + year + " will be " + Af(year) + " million square km.";

%Two Visuals (ArcticBorders Credit to Chad A. Greene) and adjusted by
%myself
figure(LargerView);
arcticborders('k-',year);
figure(SmallerView);
arcticborders('k-',year);
xlim([-3000000,3000000]);
ylim([-3000000,3000000]);
end
