% Author: Joshua Hicks - 3499453
%
% Date: 6 DEC 2016
%
% This function is used to determine the value of a hand of cards.

function value = GetHandValue(hand)
    %Setting parameters
    value = 0;
    numOfAces = 0;
    
    %Looping through entire hand
    for i=1:length(hand)
        cardValue = GetCardValue(hand(i));
        if (cardValue == 1)
            numOfAces = numOfAces + 1;
        else
            value = value + cardValue;
        end
    end
    
    %Looping through aces to see if they should be 1 or 11
    for j=1:numOfAces
        if (value + 11 <= (21-(numOfAces-j)))
            value = value + 11;
        else
            value = value + 1;
        end
    end
end

