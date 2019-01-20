% Author: Joshua Hicks - 3499453
%
% Date: 6 DEC 2016
%
% This function is used to print a hand.

function PrintHand(hand)
    %Looping through each card and printing them separately. 
    for i=1:length(hand)
        PrintCard(hand(i));
    end
end

