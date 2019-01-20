% Author: Joshua Hicks - 3499453
%
% Date: 6 DEC 2016
%
% This function is used to print the value of a card.

function LoopPrintCard(card)
    %Getting the value of a card
    value = num2str(mod(card, 13));

    if (strcmp(value, '0'))
        value = 'King';
    elseif (strcmp(value, '11'))
        value = 'Jack';
    elseif (strcmp(value, '12'))
        value = 'Queen';
    elseif (strcmp(value, '1'))
        value = 'Ace';
    end
   
    %Printing
    fprintf('%s', value);  
end