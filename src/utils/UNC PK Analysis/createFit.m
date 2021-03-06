function [fitresult, gof] = createFit(x, y)
%CREATEFIT1(X,Y)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x
%      Y Output: y
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 14-Aug-2015 16:33:11

%% trim the data for the fit

holder = max(y);

L = length(y);

for i = 1:L
    if y(i) == holder
        break
    end
end

clearvars holder;

holder(:,1) = x(i:end);
holder(:,2) = y(i:end);

clearvars x y;

x = holder(:,1);
y = holder(:,2);


%% Fit: 'createFit'.
[xData, yData] = prepareCurveData( x, y );

% Set up fittype and options.
ft = fittype( 'smoothingspline' );
opts = fitoptions( 'Method', 'SmoothingSpline' );
opts.SmoothingParam = 0.001;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'y vs. x', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel x
ylabel y
grid on


