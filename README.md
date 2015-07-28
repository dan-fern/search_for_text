# search_for_text
MATLAB script to read in a file, search for a desired string, and read that or other data from that point. uses the locations of the desired string as indices to navigate the raw text.

# search_for_text.m
Daniel Fernández
July 2015
This script was designed to deal with MATLAB's poor text handling capabilities. It is pretty clunky, but works reasonably fast. Essentially, it takes all line breaks in the data, stores them in a cell array by row, called allText, then searches the array for the desired text, in this case the string "ADDED MASS". The matrix ind returns each row location where the string is detected. Then data is extracted using the cell2mat() and textscan() functions. In this example, I wanted to skip 5 lines from the 2nd instance of "ADDED MASS" and take in the 3rd and 5th pieces of data on that line. I have provided an input file as well as an input argument, modify them at your leisure. 
