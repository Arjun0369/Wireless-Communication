%  Institute: Indian Institute of Information Technology Nagpur
%  Laboratory: Wireless Communication
%  Engineer: Arjun Ram 
%  Create Date: 21.02.2024 18:28:17
%  Project Name: 2-Ray Model
%  Tool: Matlab
%  Description:

clc
clear all
close all

% Define the field size
field_size = [100 100];

% Define the base station location
base_station = [50 50];

%Define all Parameter
f = 900*(10^6);
fraunhoferDistance = 10;
c = 3*(10^8);
wavelength = c/f;
transmitt_power=10;
gt = 1;
gr = 1;


%Take inut from user
n = input("Enter no of nodes: ");



% Generate random points
nodex = randi([1, field_size(1)], 1, n);
nodey = randi([1, field_size(2)], 1, n);

% Store the points in an array
node = [nodex; nodey];


% Create a matrix to store the locations of the base station and nodes
 locations = [base_station; node.'];

% Initialize a matrix to store the distances
distances = zeros(n+1,n+1);
% 
% Calculate the distances
for i = 1:n+1
    for j = 1:n+1
        distances(i,j) = sqrt((locations(i,1) - locations(j,1))^2 + (locations(i,2) - locations(j,2))^2);
    end
end

% Display the distances
disp(distances);
distance = distances(1,:);

nearFieldCondition = distance < 40 & distance > 10;
farFieldCondition = distance > 40;
fraunhoferFieldCondition = distance < 10;

disp('Points in  LOS:');
disp(find(nearFieldCondition));

disp('Points in  Non Los:');
disp(find(farFieldCondition));

disp('Points at Fraunhofer Distance:');
disp(find(fraunhoferFieldCondition));


node_colors = cell(1, n+1);
node_colors{1} = 'ro'; % Base station is always red
for i = 2:n+1
    if distances(1,i) <= fraunhoferDistance
        % Fraunhofer Device
        node_colors{i} = 'k*'; % Black color for Fraunhofer  field devices
        received_powers(i) = 0; % Power is 0 for Fraunhofer  field devices
    elseif distances(1,i) <= 40
        % near field device (LOS)
        node_colors{i} = 'g*'; % Green color for far field devices
        % Calculate power using Friis equation considering reflections
        received_powers(i) = (1000 * transmitt_power * gt * gr * (wavelength^2)) / ((4 * pi * distances(1,i))^2);
    else
        % Far field device (Non LOS)
        node_colors{i} = 'b*'; % blue color for far field devices
        % Calculate power using Friis equation considering reflections
        received_powers(i) = (1000 * transmitt_power * gt * gr * (wavelength^2)) / ((4 * pi)^2 * distances(1,i))^4;
    end
end

% Create a figure
figure;

% Plot the field
plot([0, field_size(1), field_size(1), 0, 0], [0, 0, field_size(2), field_size(2), 0], 'k-');
hold on;

% Plot the base station

scatter(base_station(1), base_station(2), 'ro', 'filled');

% Plot the nodes
for i = 2:n+1
    scatter(node(1,i-1), node(2,i-1), node_colors{i});
end

%plot circle for different region
viscircles([base_station(1), base_station(2)],10, 'Color','r', 'Linewidth', 0.5)
viscircles([base_station(1), base_station(2)],40,'Color','b', 'Linewidth', 0.5)


% Set the axis limits
axis([0 field_size(1) 0 field_size(2)]);

% Add labels
xlabel('X');
ylabel('Y');
title('Square Field with Base Station and Nodes');

% Dummy plots for legend
h(1) = plot(NaN,NaN,'-r', 'MarkerFaceColor', 'r');
hold on;
h(2) = plot(NaN,NaN,'-g', 'MarkerFaceColor', 'b');

% Create legend
legend(h, 'Fraunhofer Area', 'Near Field or Los');

% Show the grid
grid on;



