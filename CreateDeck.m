% Author: Joshua Hicks - 3499453
%
% Date: 6 DEC 2016
%
% This function is used to create a deck of playing cards.

function deck = CreateDeck(size)
    %Making a deck of cards
    deck = zeros(1, size);

    %Filling in the deck with the cards
    for i=1:size
        deck(i) = i;
    end
end