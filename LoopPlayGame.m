% Author: Joshua Hicks - 3499453
%
% Date: 6 DEC 2016
%
% This function is used to simulate a game of Blackjack with two computers
% playing against each other (one representing the player).

function winner = LoopPlayGame(deck, playerHand, dealerHand, stopValue)
    %Setting parameters
    playerBust = false;

    %Running the player's turn
    playerHandValue = GetHandValue(playerHand);
    while (playerHandValue < stopValue)
        playerHand(length(playerHand)+1) = deck(end);
        deck = deck(1:end-1);
        playerHandValue = GetHandValue(playerHand);

        if (playerHandValue > 21)
            playerBust = true;
            break;
        end
    end
    
    %Running the dealers turns
    dealerHandValue = GetHandValue(dealerHand);
    
    if (~playerBust) %No need to run dealer's turn if player busted
        while (dealerHandValue < 17)
            dealerHand(length(dealerHand)+1) = deck(end);
            deck = deck(1:end-1);
            dealerHandValue = GetHandValue(dealerHand);
        end
    end
    
    %Determining the winner
    winner = GetWinner(playerHand, dealerHand);
end

