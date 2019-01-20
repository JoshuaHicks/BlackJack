% Author: Joshua Hicks - 3499453
%
% Date: 6 DEC 2016
%
% This function is used to determine the winner after both hands have been
% played.

function winner = GetWinner(playerHand, dealerHand)
    
    %setting parameters
    playerBust = false;
    dealerBust = false;
    
    %Getting the hand values
    playerHandValue = GetHandValue(playerHand);
    dealerHandValue = GetHandValue(dealerHand);
    
    %Determining whether anyone busted
    if (playerHandValue > 21)
        playerBust = true;
    elseif (dealerHandValue > 21)
        dealerBust = true;
    end
    
    %Checking to see who won
    if (playerBust ~= true && dealerBust == true)
        winner = 'Player';
    elseif (playerHandValue > dealerHandValue && playerBust ~= true)
        winner = 'Player';
    else
        winner = 'dealer';
    end
end

