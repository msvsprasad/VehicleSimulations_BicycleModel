function fcn_VD_plotTimeFriction(time, friction_coefficient, varargin)
%% fcn_VD_plotTimeFriction
% Purpose:
%   To plot the friction coeeficient against time
%
% Inputs:
%   time: A Nx1 vector of time [sec]
%   friction_coefficient: A Nx2 matrix of friction_coefficient(s) [No units]
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

h_fig = figure(fig_num);
set(h_fig, 'Name', 'fcn_VD_plotTimeFriction');
width = 600; height = 400; right = 100; bottom = 400;
set(gcf, 'position', [right, bottom, width, height])
clf

subplot(2,1,1)
plot(time, friction_coefficient(:,1), 'b.')
grid on
legend('front wheel', 'Location', 'best')
ylabel('Friction Coefficient [No Units]')
ylim([-0.1 1.5])

subplot(2,1,2)
plot(time, friction_coefficient(:,2), 'b.')
grid on
legend('rear wheel', 'Location', 'best')
ylabel('Friction Coefficient [No Units]')
xlabel('Time [s]')
ylim([-0.1 1.5])

sgtitle('Friction Coefficient')
end