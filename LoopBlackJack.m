% Author: Joshua Hicks - 3499453
%
% Date: 6 DEC 2016
%
% This function is used to set up multiple games of blackjack with every
% single combination of starting cards.

function LoopBlackJack()
    clc
    
    %Getting user input
    prompt = ('How many games would you like to simulate with each starting hand? \n');
    numOfGames = input(prompt);
    prompt = ('What value would you like to stop at? \n');
    stopValue = input(prompt);
    
    clc
    
    %Printing info for clarification
    fprintf('Number of games per hand: %i\n', numOfGames);
    fprintf('Player stopped at: %i\n\n', stopValue);
    fprintf('Data Obtained: \n');
    
    % i goes from 1 to 10
    % j goes from 14 to 23
    for i = 1:10
        for j = 14:23
            wins = 0;
            for k = 1:numOfGames
                %Creating the deck
                deck = CreateDeck(52);
                if (j-13 >= i)
                    %Getting the player hand
                    playerHand(1) = deck(i); %player first card
                    deck(i) = deck(end); %swap with last card in deck
                    deck = deck(1:end-1); %shrink deck by 1
                    playerHand(2) = deck(j); %player second card
                    deck(j) = deck(end);
                    deck = deck(1:end-1);

                    deck = Shuffle(deck); %%Shuffle before dealing dealer cards

                    %dealer cards
                    dealerHand(1) = deck(end);
                    deck = deck(1:end-1);
                    dealerHand(2) = deck(end);
                    deck = deck(1:end-1);
                    
                    %Playing the games
                    winner = LoopPlayGame(deck, playerHand, dealerHand, stopValue);

                    if (strcmp(winner, 'Player'))
                       wins = wins + 1; 
                    end %end if
                end %end if
                
            end %end for k
            if (j-13 >= i)
                probOfWinning = 100*(wins/numOfGames); %Determining the prob of winning

                %Printing the results
                fprintf('  ');
                LoopPrintCard(playerHand(1) );
                fprintf(' and ');
                LoopPrintCard(playerHand(2 ));
                fprintf(':\t%.2f%% \n', probOfWinning);
            end
        end %end for j
    end %end for i
    
    %GEtting user input for what to do next
    prompt = '\n What would you like to do? 1)Run Again 2)Main Menu 3) Quit: ';
    choice = input(prompt);
    
    %Running the proper choice
    if (choice == 1)
        LoopBlackJack();
    elseif (choice == 2)
        MainMenu();
    elseif (choice == 3)
        clc
        fprintf('Have a great day! \n');
    end
end %end function

