% Author: Joshua Hicks - 3499453
%
% Date: 6 DEC 2016
%
% This function is used to play a standard game of Blackjack with a 
% split hand for the player.

function SplitPlayGame(deck, playerHand, dealerHand)
    clc
    
    %Setting parameters
    player1Bust = false;
    player2Bust = false;
    
    %Initializing two player hands
    playerHand1(1) = playerHand(1);
    playerHand2(1) = playerHand(2);
    
    %Second value for each player hand
    playerHand1(2) = deck(end);
    deck = deck(1:end-1);
    
    playerHand2(2) = deck(end);
    deck = deck(1:end-1);
    
    %Printing the hands
    fprintf('--Hand One-- \n');
    PrintHand(playerHand1);
    fprintf('--Hand Two-- \n');
    PrintHand(playerHand2);
    
    %Getting user input
    prompt = '\nWould you like to hit for Hand 1? 1)Yes 0)No: ';
    x = input(prompt);
    
    %Playing the first hand
    playerHand1Value = GetHandValue(playerHand1);
    while (x ~= 0)
        playerHand1(length(playerHand1)+1) = deck(end);
        deck = deck(1:end-1);
        clc
        fprintf('--Hand One-- \n');
        playerHand1Value = GetHandValue(playerHand1);
        PrintHand(playerHand1);

        if (playerHand1Value > 21)
            player1Bust = true;
            fprintf('Hand 1 BUST\n');
            fprintf('\n --Hand Two-- \n');
            PrintHand(playerHand2);
            break;
        end
        prompt = '\n Would you like another card for Hand One? 1)Yes 0)No: ';
        x = input(prompt);
    end
    
    %Checking if player 1 hand busted
    if (~player1Bust)
        clc
        fprintf('--Hand Two-- \n');
        PrintHand(playerHand2);
    end
    
    %Getting user input for whether they would like another card or not
    prompt = '\nWould you like to hit for Hand 2? 1)Yes 0)No: ';
    x = input(prompt);
    
    %Playing the second hand
    playerHand2Value = GetHandValue(playerHand2);
    while (x ~= 0)
        playerHand2(length(playerHand2)+1) = deck(end);
        deck = deck(1:end-1);
        clc
        fprintf('--Hand Two-- \n');
        playerHand2Value = GetHandValue(playerHand2);
        PrintHand(playerHand2);

        if (playerHand2Value > 21)
            player2Bust = true;
            break;
        end

        prompt = '\n Would you like another card for Hand Two? 1)Yes 0)No: ';
        x = input(prompt);
    end
    
    %Running the dealers turns
    dealerHandValue = GetHandValue(dealerHand);
    
    %If both hands busted, no need to run dealer hand
    if (~player1Bust || ~player2Bust)
        while (dealerHandValue < 17)
            dealerHand(length(dealerHand)+1) = deck(end);
            deck = deck(1:end-1);
            dealerHandValue = GetHandValue(dealerHand);
        end
    end
    
    %Determining the winner
    winner1 = GetWinner(playerHand1, dealerHand);
    winner2 = GetWinner(playerHand2, dealerHand);
    clc
    fprintf('Hand 1: ');
    PrintWinner(winner1);
    fprintf('Hand 2: ');
    PrintWinner(winner2);
    
    %Printing the end Hands:
    fprintf('You had:\n');
    fprintf('Hand 1: \n');
    PrintHand(playerHand1);
    fprintf('Player hand 1 value: %i \n', playerHand1Value);
    fprintf('\nHand 2: \n');
    PrintHand(playerHand2);
    fprintf('Player hand 2 value: %i \n', playerHand2Value);
    fprintf('\nThe dealer had:\n');
    PrintHand(dealerHand);
    fprintf('Dealer hand value: %i \n', dealerHandValue);
    fprintf('\n');
end