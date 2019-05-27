
%% Needleman-Wunsch Algorithm
% To implement the Needleman-Wunsch algorithm in Matlab
% for Global Sequence Alignment
% Reference: Needleman, S. B., & Wunsch, C. D. (1970). A general method
% applicable to the search for similarities in the amino acid sequence of
% two proteins. Journal of molecular biology, 48(3), 443-453.
% Programmer: Ganesh

clear all;
clc;

%% Scoring Structure:
% match: 1 point
% mismatch: 0 point
% gap: 0 point

% pMatch = input('Enter points for a match       : ');
% pMismatch = input('Enter penalty for a mismatch: ');
% pGap = input('Enter penalty for a gap          : ');

pMatch = 3;
pMismatch = -1;
pGap = -2;


%% Sequence Details

% Enter two sequences

seq1 = input('Enter first  sequence: ', 's');
seq2 = input('Enter second sequence: ', 's');
%seq1 = 'ATTAC';
%seq2 = 'APTGCT';
% Answer = 3

% Find the length for each sequence
len1 = length(seq1);
len2 = length(seq2);

%% Similarity Matrix

% Create matrix of size len1*len2, Enter 0 at all locations.
% Match: 1's where characters are identical
% Mismatch: leave as 0

mrows = len1 + 1;
mcolumns = len2 + 1;

% matZero
matZero = zeros(mrows, mcolumns);
%matZero

% Make 0/1 similarity matrix
% Enter 1 if there is match, 0 for mismatch
matSim = matZero;

for i = 2 : mrows
    for j = 2 : mcolumns
        if seq1(i-1) == seq2(j-1)
            matSim(i,j) = pMatch;
        else
            matSim(i,j) = pMismatch;
        end
    end
end

matSim