%  Institute: Indian Institute of Information Technology Nagpur
%  Laboratory: Wireless Communication
%  Engineer: Arjun Ram 
%  Create Date: 14.02.2024 18:28:17
%  Project Name: Analysis of PDF and CDF of Gaussian Function
%  Tool: Matlab
%  Description:
clc
clear all;
close all;

%Define value of sigma
sig = [1/sqrt(8) 1/2 1/sqrt(2) 1 sqrt(2) 2 4 6 8 9 10];
% Define the range of x values
x = -10:0.01:10;
%Plot PDF of Gaussian
figure;
hold on
title('Probability Density Function');
xlabel('x');
ylabel('PDF');
%Plot CDF of Gaussian
figure;
hold on
title('Cumulative Distribution Function');
xlabel('x');
ylabel('CDF');

for ii=1:1:11
    sigma = sig(ii);
    %Calculate PDF
    pdf = (1/(sigma*sqrt(2*pi))) * exp(-(x.^2)/(2*sigma^2));
    %Calculate CDF
    cdf = cumsum(pdf) / sum(pdf);
    
    % Add the PDF plot with a legend entry
    figure(1);
    legend_entry_pdf = sprintf('\\sigma = %.2f', sigma);
    plot(x, pdf,'LineWidth',2, 'DisplayName', legend_entry_pdf);

    % Add the CDF plot with a legend entry
    figure(2);
    legend_entry_cdf = sprintf('\\sigma = %.2f', sigma);
    plot(x, cdf,'LineWidth',2, 'DisplayName', legend_entry_cdf);
end

hold off

% Add legends after all plots are done
figure(1);
legend('show');
legend('Location', 'northeast');

figure(2);
legend('-DynamicLegend');
legend('Location', 'southeast');


