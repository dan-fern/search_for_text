%%% search_for_text.m
%%% Daniel Fernández
%%% July 2015
%%% This script was designed to deal with MATLAB's poor text handling
%%% capabilities. It is pretty clunky, but works reasonably fast.
%%% Essentially, it takes all line breaks in the data, stores them in a 
%%% cell array by row, called allText, then searches the array for the 
%%% desired text, in this case the string "ADDED MASS". The matrix ind
%%% returns each row location where the string is detected. Then data is
%%% extracted using the cell2mat() and textscan() functions. In this
%%% example, I wanted to skip 5 lines from the 2nd instance of "ADDED MASS"
%%% and take in the 3rd and 5th pieces of data on that line. I have
%%% provided an input file as well as an input argument, modify them at
%%% your leisure. 

function [ Mx, Mz ] = search_for_text( )

% create fileName string and read file
fileName = '20z.lis'; 
fid = fopen(fileName,'r');

% create cell array with all text separated by row 
allText = textscan(fid, '%s','Delimiter',''); 
fclose(fid);
allText = allText{:};

% create logical array where 1's identify row locations of desired string
strID = ~cellfun( @isempty, strfind(allText,'ADDED MASS') );

% find indices of logical array
ind = find(strID==1);

% pass indices into allText to get text at that location. In this example,
% I wanted to start at the 2nd instance of "ADDED MASS" and move 5 rows 
% down from there. the relevant data for the example are the 3rd and 5th 
% values on the 5th row down. this line does all of that.
[ data ] = cell2mat( textscan(allText{ind(2)+5}, '%*f %*f %f %*f %f', 1) );

% parse out relevant data.
Mx = data(1) / 1;
Mz = data(2) / 2;

clear allText

return

end