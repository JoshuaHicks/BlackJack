% Author: Joshua Hicks - 3499453
%
% Date: 6 DEC 2016
%
% This function is used to set up a standard game of Blackjack.

function BlackJack()
    %Main script to run the game of blackjack
    clc
    clear

    %Creating the deck
    deck = CreateDeck(52);
    deck = Shuffle(deck);

    %Setting up the game
    for i=1:4
        if (i<3)
           playerHand(i) = deck(end);
           deck = deck(1:end-1);
        else
           dealerHand(i-2) = deck(end);
           deck = deck(1:end-1);
        end
    end
    %Play the game
    PlayGame(deck, playerHand, dealerHand);
        
    %Getting user input to see what they want to do next
    prompt = ('What would you like to do? 1)Play Again 2)Main Menu 3)Quit: ');
    choice = input(prompt);
    clc
    
    %Running the proper choice
    if (choice == 1)
        BlackJack();
    elseif (choice == 2)
       MainMenu(); 
    elseif (choice == 3)
        clc
        fprintf('Have a great day! \n');
    end
end