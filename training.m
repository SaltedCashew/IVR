function test = training()
load trainingCard_Data.mat
r = randi([1 32],1,5);
disp(r)

opengl software; % problems with text upside down....
trainingCards = cellstr(trainingCards);

img1 = cardDriver(trainingCards{r(1)},0);
img2 = cardDriver(trainingCards{r(2)},0);
img3 = cardDriver(trainingCards{r(3)},0);
img4 = cardDriver(trainingCards{r(4)},0);
img5 = cardDriver(trainingCards{r(5)},0);
fontsize=12;

figure('name', 'Training Cards');

subplot(3, 3, 1); %creates a 2x2 grid, and this image is the 1st on that grid
imshow(img1);
title(trainingCards{r(1)}, 'Fontsize', fontsize);
set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.
[label num] = bwlabel(img1);
props = regionprops(label);
box = [props.BoundingBox];
box = reshape(box, [4 num]);
hold on;
for cnt = 1:num
    rectangle('position', box(:,cnt), 'edgecolor', 'g');
end
hold off;




subplot(3, 3, 2); %creates a 2x2 grid, and this image is the 1st on that grid
imshow(img2);
title(trainingCards{r(2)}, 'Fontsize', fontsize);
[label num] = bwlabel(img2);
props = regionprops(label);
box = [props.BoundingBox];
box = reshape(box, [4 num]);
hold on;
for cnt = 1:num
    rectangle('position', box(:,cnt), 'edgecolor', 'g');
end
hold off;

subplot(3, 3, 3); %creates a 2x2 grid, and this image is the 1st on that grid
imshow(img3);
title(trainingCards{r(3)}, 'Fontsize', fontsize);
[label num] = bwlabel(img3);
props = regionprops(label);
box = [props.BoundingBox];
box = reshape(box, [4 num]);
hold on;
for cnt = 1:num
    rectangle('position', box(:,cnt), 'edgecolor', 'g');
end
hold off;


subplot(3, 3, 4); %creates a 2x2 grid, and this image is the 1st on that grid
imshow(img4);
title(trainingCards{r(4)}, 'Fontsize', fontsize);
[label num] = bwlabel(img4);
props = regionprops(label);
box = [props.BoundingBox];
box = reshape(box, [4 num]);
hold on;
for cnt = 1:num
    rectangle('position', box(:,cnt), 'edgecolor', 'g');
end
hold off;


subplot(3, 3, 5); %creates a 2x2 grid, and this image is the 1st on that grid
imshow(img5);
title(trainingCards{r(5)}, 'Fontsize', fontsize);
[label num] = bwlabel(img5);
props = regionprops(label);
box = [props.BoundingBox];
box = reshape(box, [4 num]);
hold on;
for cnt = 1:num
    rectangle('position', box(:,cnt), 'edgecolor', 'g');
end
hold off;

end