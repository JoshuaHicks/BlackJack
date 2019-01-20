% Author: Joshua Hicks - 3499453
%
% Date: 6 DEC 2016
%
% This function is used to determine the value of a card.

function value = GetCardValue(card)

    %Calculating the value using mod 13
    value = mod(card, 13);

    %Making sure all face values equal 10
    if (value == 0 || value == 11 || value == 12)
        value = 10;
    end

end

