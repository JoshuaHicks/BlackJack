% Author: Joshua Hicks - 3499453
%
% Date: 6 DEC 2016
%
% This function is used to print the winner of a game of Blackjack.

function PrintWinner(winner)
    %Determining the winner
    if (strcmp(winner, 'Player'))
        fprintf('Player Wins!\n\n');
    else
        fprintf('Dealer Wins!\n\n');
    end
end

