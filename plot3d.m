function [ hFig,hSurf ] = plot3d( plotter,xMin,xStep, xMax,yMin,yStep, yMax,startX,startY,xlab,ylab,zlab,scaleR,figNum,fontSize)
%plot3D Interpolates 3D plots
%   Used the interp2 function
% Plotter is the function to be plotted. xMin in the minimum. xStep is the
% step between them. xMax is the max. Same for y. startX,Y is the starting
% index. Not used yet, but they may be necessary in the future. x,y,z lab
% are labels. scaleR is the scaling factor for interp - higher is more 
% interpolation. fignum is figure number. fontSize is fontsize. Returns
% fig handle as hFig, surf handle as hSurf

lengthX = size(plotter,1);
lengthY = size(plotter,2);

x = xMin:xStep:xMax;
y = yMin:yStep:yMax;
Z = plotter(startX:lengthX,startY:lengthY)';

[X,Y] = meshgrid(x,y);
[X1, Y1] = meshgrid(xMin:xStep/scaleR:xMax,yMin:yStep/scaleR:yMax);
Z1 = interp2(X,Y,Z,X1,Y1,'spline');
Z1((Z1<0))=0;
hFig = figure(figNum);
hSurf = surf(X1,Y1,Z1);
xlabel(xlab,'FontSize',fontSize);
ylabel(ylab,'FontSize',fontSize);
zlabel(zlab,'FontSize',fontSize);
set(hFig,'color','w');
set(findall(hFig,'-property','FontSize'),'FontSize',fontSize);
end

