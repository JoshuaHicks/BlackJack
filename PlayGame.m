% Author: Joshua Hicks - 3499453
%
% Date: 6 DEC 2016
%
% This function is used to play a standard game of Blackjack.

function PlayGame(deck, playerHand, dealerHand)
    %Printing players hand
    fprintf('Starting Hand: \n');
    PrintHand(playerHand);
    
    %Printing one of the dealer's card
    fprintf('\nOne of the dealer''s cards is the:\n');
    PrintCard(dealerHand(1));
    
    playerBust = false;
    
    %Implementing card splitting
    if (GetCardValue(playerHand(1)) == GetCardValue(playerHand(2)))
        prompt = '\nWhat would you like to do? 1)Hit 2)Stand 3)Split: ';
        choice = input(prompt);
        if (choice == 1)
            x = 1;
            while (x ~= 0)
                playerHandValue = GetHandValue(playerHand);
                playerHand(length(playerHand)+1) = deck(end);
                deck = deck(1:end-1);
                clc
                fprintf('--Your Hand-- \n');
                playerHandValue = GetHandValue(playerHand);
                PrintHand(playerHand);

                %Checking if player busted
                if (playerHandValue > 21)
                    playerBust = true;
                    break;
                end

                %Getting user input whether they would like another card
                prompt = '\n Would you like another card? 1)Yes 0)No: ';
                x = input(prompt);
            end
        elseif (choice == 2)
            playerHandValue = GetHandValue(playerHand);
            %Running the dealers turns
            dealerHandValue = GetHandValue(dealerHand);

            if (~playerBust)
                while (dealerHandValue < 17)
                    dealerHand(length(dealerHand)+1) = deck(end);
                    deck = deck(1:end-1);
                    dealerHandValue = GetHandValue(dealerHand);
                end
            end

            %Determining the winner
            winner = GetWinner(playerHand, dealerHand);
            clc
            PrintWinner(winner);

            %Printing the end Hands:
            fprintf('You had:\n');
            PrintHand(playerHand);
            fprintf('Player hand value: %i \n', playerHandValue);
            fprintf('\nThe dealer had:\n');
            PrintHand(dealerHand);
            fprintf('Dealer hand value: %i \n', dealerHandValue);
            fprintf('\n');
        elseif (choice == 3)
            SplitPlayGame(deck, playerHand, dealerHand);
        end
    else
        prompt = '\nWould you like to hit? 1)Yes 0)No: ';
        choice = input(prompt);

        playerHandValue = GetHandValue(playerHand);
        while (choice ~= 0)
            %Take a card
            playerHand(length(playerHand)+1) = deck(end);
            deck = deck(1:end-1);
            clc
            %Print updated hand
            fprintf('--Your Hand-- \n');
            playerHandValue = GetHandValue(playerHand);
            PrintHand(playerHand);

            %Checking if player busted
            if (playerHandValue > 21)
                playerBust = true;
                break;
            end

            %Getting user input to see if player would like another card
            prompt = '\n Would you like another card? 1)Yes 0)No: ';
            choice = input(prompt);
        end

        %Running the dealers turns
        dealerHandValue = GetHandValue(dealerHand);

        if (~playerBust) %No reason to play dealer hand if player busted
            while (dealerHandValue < 17)
                dealerHand(length(dealerHand)+1) = deck(end);
                deck = deck(1:end-1);
                dealerHandValue = GetHandValue(dealerHand);
            end
        end

        %Determining the winner
        winner = GetWinner(playerHand, dealerHand);
        clc
        PrintWinner(winner);

        %Printing the end Hands:
        fprintf('You had:\n');
        PrintHand(playerHand);
        fprintf('Player hand value: %i \n', playerHandValue);
        fprintf('\nThe dealer had:\n');
        PrintHand(dealerHand);
        fprintf('Dealer hand value: %i \n', dealerHandValue);
        fprintf('\n');
    end
    if (choice == 1)
        %Running the dealers turns
        dealerHandValue = GetHandValue(dealerHand);

        if (~playerBust) %No reason to play dealer hand if player busted
            while (dealerHandValue < 17)
                dealerHand(length(dealerHand)+1) = deck(end);
                deck = deck(1:end-1);
                dealerHandValue = GetHandValue(dealerHand);
            end
        end

        %Determining the winner
        winner = GetWinner(playerHand, dealerHand);
        clc
        PrintWinner(winner);

        %Printing the end Hands:
        fprintf('You had:\n');
        PrintHand(playerHand);
        fprintf('Player hand value: %i \n', playerHandValue);
        fprintf('\nThe dealer had:\n');
        PrintHand(dealerHand);
        fprintf('Dealer hand value: %i \n', dealerHandValue);
        fprintf('\n');
    end
end