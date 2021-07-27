function fcn_VD_plotTimeAligningMoment(time, aligning_moment, varargin)
%% fcn_VD_plotTimeAligningMoment
% Purpose:
%   To plot the aligning_moment(s) against time
%
% Inputs:
%   time: A Nx1 vector of time [sec]
%   aligning_moment: A Nx4 matrix of aligning moment [Nm]
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
max_value = max(aligning_moment, [], 'all');
min_value = min(aligning_moment, [], 'all');
offset    = 0.1*(max_value-min_value);
if 0 == offset
    offset = 0.5;
end

h_fig = figure(fig_num);
set(h_fig, 'Name', 'fcn_VD_plotTimeAligningMoment');
width = 600; height = 400; right = 100; bottom = 400;
set(gcf, 'position', [right, bottom, width, height])
clf

subplot(2,2,1)
plot(time, aligning_moment(:,1), 'b', 'Linewidth', 1)
grid on
legend('front left wheel', 'Location', 'best')
ylabel('Aligning Moment [Nm]')
ylim([min_value-offset max_value+offset])

subplot(2,2,2)
plot(time, aligning_moment(:,2), 'b', 'Linewidth', 1)
grid on
legend('front right wheel', 'Location', 'best')
ylim([min_value-offset max_value+offset])

subplot(2,2,3)
plot(time, aligning_moment(:,3), 'b', 'Linewidth', 1)
grid on
legend('rear left wheel', 'Location', 'best')
ylabel('Aligning Moment [Nm]')
xlabel('Time [s]')
ylim([min_value-offset max_value+offset])

subplot(2,2,4)
plot(time, aligning_moment(:,4), 'b', 'Linewidth', 1)
legend('rear right wheel', 'Location', 'best')
grid on
xlabel('Time [s]')
ylim([min_value-offset max_value+offset])

sgtitle('Aligning Moment')
end