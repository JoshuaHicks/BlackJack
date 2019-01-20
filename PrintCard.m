% Author: Joshua Hicks - 3499453
%
% Date: 6 DEC 2016
%
% This function is used to print a card.

function PrintCard(card)
    
    %Getting suit
    if (card <= 13)
        suit = 'Spades';
    elseif (card <= 26)
        suit = 'Hearts';
    elseif (card <= 39)
        suit = 'Clubs';
    else
        suit = 'Diamonds';
    end

    %Getting value
    value = num2str(mod(card, 13));

    %Getting face value
    if (strcmp(value, '0'))
        value = 'King';
    elseif (strcmp(value, '11'))
        value = 'Jack';
    elseif (strcmp(value, '12'))
        value = 'Queen';
    elseif (strcmp(value, '1'))
        value = 'Ace';
    end
   
    %printing
    fprintf('\t%s of %s\n', value, suit);
    
end