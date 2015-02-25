function run = testall() %does what it says. tests all 64 cards and prints results

    disp('Testing the Training Set');
    trainingset = ['2 of spade  ';'2 of heart  ';'2 of club   ';'2 of diamond';...
        '3 of spade  ';'3 of heart  ';'3 of club   ';'3 of diamond';...
        '4 of spade  ';'4 of heart  ';'4 of club   ';'4 of diamond';...
        '5 of spade  ';'5 of heart  ';'5 of club   ';'5 of diamond';...
        '6 of spade  ';'6 of heart  ';'6 of club   ';'6 of diamond';...
        '7 of spade  ';'7 of heart  ';'7 of club   ';'7 of diamond';...
        '8 of spade  ';'8 of heart  ';'8 of club   ';'8 of diamond';...
        '9 of spade  ';'9 of heart  ';'9 of club   ';'9 of diamond'];
   
    trainingset = cellstr(trainingset);

    testset = ['9 of spade  ';'9 of heart  ';'9 of club   ';'9 of diamond';...
        '8 of spade  ';'8 of heart  ';'8 of club   ';'8 of diamond';...
        '7 of spade  ';'7 of heart  ';'7 of club   ';'7 of diamond';...
        '6 of spade  ';'6 of heart  ';'6 of club   ';'6 of diamond';...
        '5 of spade  ';'5 of heart  ';'5 of club   ';'5 of diamond';...
        '4 of spade  ';'4 of heart  ';'4 of club   ';'4 of diamond';...
        '3 of spade  ';'3 of heart  ';'3 of club   ';'3 of diamond';...
        '2 of spade  ';'2 of heart  ';'2 of club   ';'2 of diamond'];
    
    testset = cellstr(testset);
    
    trainingcount = 0;
    testCount = 0;
    for i=1:32
        img = strcat('images/train',num2str(i),'.jpg');
        
        result = cardDriver(img, 0);
        if(strcmp(result, trainingset(i)))
            disp('CORRECT!');
        else
            disp(strcat('WRONG!', {' '},'Should be:',{' '}, trainingset(i)));
            trainingcount = trainingcount + 1;
        end
        close all; % Close all figures (except those of imtool.)
        imtool close all; % Close all imtool figures.

    end
    disp('Now Testing the Test Set');
    for k=1:32
        img = strcat('images/test',num2str(k),'.jpg');
        %disp(strcat(img,' :',{' '}));
        result = cardDriver(img, 0);
         if(strcmp(result, testset(k)))
            disp('CORRECT!');
        else
            disp(strcat('WRONG!', {' '},'Should be:',{' '}, testset(k)));
            testCount = testCount + 1;
        end
        close all; % Close all figures (except those of imtool.)
        imtool close all; % Close all imtool figures.
    end
disp(strcat('Number of training cards incorrect:',{' '}, num2str(trainingcount)));
disp(strcat('Number of test cards incorrect:',{' '}, num2str(testCount)));
end
