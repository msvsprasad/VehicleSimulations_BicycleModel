function fcn_VD_plotTimeLateralTireForce(time, lat_tire_force, varargin)
%% fcn_VD_plotTimeLateralTireForce
% Purpose:
%   To plot the slip angles against time
%
% Inputs:
%   time: A Nx1 vector of time [sec]
%   lat_tire_force: A Nx2 matrix of lateral tire force(s) [N]
%
% Returned Results:
%   A plot
%
% Author: Satya Prasad
% Created: 2021_07_26
% 

%% Check input arguments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   _____                   _       
%  |_   _|                 | |      
%    | |  _ __  _ __  _   _| |_ ___ 
%    | | | '_ \| '_ \| | | | __/ __|
%   _| |_| | | | |_) | |_| | |_\__ \
%  |_____|_| |_| .__/ \__,_|\__|___/
%              | |                  
%              |_| 
% See: http://patorjk.com/software/taag/#p=display&f=Big&t=Inputs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Are there the right number of inputs?
if 2>nargin || 3<nargin
    error('Incorrect number of input arguments')
end

%% Plots the inputs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   __  __       _       
%  |  \/  |     (_)      
%  | \  / | __ _ _ _ __  
%  | |\/| |/ _` | | '_ \ 
%  | |  | | (_| | | | | |
%  |_|  |_|\__,_|_|_| |_|
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if 3 == nargin
    fig_num = varargin{1};
else
    fig = figure;
    fig_num = fig.Number;
end
max_value = max(lat_tire_force, [], 'all');
min_value = min(lat_tire_force, [], 'all');
offset    = 0.1*(max_value-min_value);
if 0 == offset
    offset = 25;
end

h_fig = figure(fig_num);
set(h_fig, 'Name', 'fcn_VD_plotTimeLateralTireForce');
width = 600; height = 400; right = 100; bottom = 400;
set(gcf, 'position', [right, bottom, width, height])
clf

subplot(2,1,1)
plot(time, lat_tire_force(:,1), 'b', 'Linewidth', 1)
grid on
legend('front wheel', 'Location', 'best')
ylabel('Lateral Tire Force [N]')
ylim([min_value-offset max_value+offset])

subplot(2,1,2)
plot(time, lat_tire_force(:,2), 'b', 'Linewidth', 1)
grid on
legend('rear wheel', 'Location', 'best')
ylabel('Lateral Tire Force [N]')
xlabel('Time [s]')
ylim([min_value-offset max_value+offset])

sgtitle('Lateral Tire Force')
end