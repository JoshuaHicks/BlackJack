% Author: Joshua Hicks - 3499453
%
% Date: 6 DEC 2016
%
% This function is used to shuffle (randomize) a deck of cards.

function deck = Shuffle(deck)
    deck = deck(randperm(length(deck)));
end

