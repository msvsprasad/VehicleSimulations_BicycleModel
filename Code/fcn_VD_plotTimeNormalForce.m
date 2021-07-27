function fcn_VD_plotTimeNormalForce(time, normal_force, varargin)
%% fcn_VD_plotTimeNormalForce
% Purpose:
%   To plot normal force(s) against time
%
% Inputs:
%   time: A Nx1 vector of time [sec]
%   normal_force: A Nx4 matrix of normal force(s) [N]
%
% Returned Results:
%   A plot
%
% Author: Satya Prasad
% Created: 2021_07_03
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
max_value = max(normal_force, [], 'all');
min_value = min(normal_force, [], 'all');
offset    = 0.1*(max_value-min_value);
if 0 == offset
    offset = 25;
end

h_fig = figure(fig_num);
set(h_fig, 'Name', 'fcn_VD_plotTimeNormalForce');
width = 600; height = 400; right = 100; bottom = 400;
set(gcf, 'position', [right, bottom, width, height])
clf

subplot(2,2,1)
plot(time, normal_force(:,1), 'b', 'Linewidth', 1)
grid on
legend('front left wheel', 'Location', 'best')
ylabel('Normal Force [N]')
ylim([min_value-offset max_value+offset])

subplot(2,2,2)
plot(time, normal_force(:,2), 'b', 'Linewidth', 1)
grid on
legend('front right wheel', 'Location', 'best')
ylim([min_value-offset max_value+offset])

subplot(2,2,3)
plot(time, normal_force(:,3), 'b', 'Linewidth', 1)
grid on
legend('rear left wheel', 'Location', 'best')
ylabel('Normal Force [N]')
xlabel('Time [s]')
ylim([min_value-offset max_value+offset])

subplot(2,2,4)
plot(time, normal_force(:,4), 'b', 'Linewidth', 1)
legend('rear right wheel', 'Location', 'best')
grid on
xlabel('Time [s]')
ylim([min_value-offset max_value+offset])

sgtitle('Normal Force')
end