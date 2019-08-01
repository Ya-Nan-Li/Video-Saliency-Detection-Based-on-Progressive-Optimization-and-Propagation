clc
clear
addpath( genpath( '.' ) );
foldername = fileparts( mfilename( 'fullpath' ) );
videoFiles = dir(fullfile(foldername, 'Data', 'Dataset'));
videoNUM = length(videoFiles)-2;
fprintf('%i',videoNUM);
tic;
    POP_main(foldername,videoNUM,videoFiles);
timeTaken = toc;
fprintf( 'time taken: %.2f seconds\n', timeTaken );
