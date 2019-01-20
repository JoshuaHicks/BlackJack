clc
clear

% Author: Joshua Hicks - 3499453
%
% Date: 6 DEC 2016
%
% This script is the main menu of a simulation for Blackjack. 
% Run this script to run the entire program.

%Main Menu
fprintf('************************ \n');
fprintf('* Welcome to BLACKJACK * \n');
fprintf('************************ \n\n');
fprintf('Please select a game mode: \n');
fprintf('  1) Standard Blackjack \n');
fprintf('  2) Statistics Mode \n');

%Getting user input
prompt = ('');
x = input(prompt);

%Running the proper gamemode
clc
if (x == 1)
    BlackJack();
elseif (x == 2)
    LoopBlackJack();
end