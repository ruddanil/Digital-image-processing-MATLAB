% Малые ромбы заменить на круги удвоенного диаметра
IMG = imread('IMG\rombs.jpg'); 
%figure, imshow(IMG);

SE1 = strel('diamond', 17); % Создание структурного элемента в виде ромба

% Применение эрозии - из объекта удаляются точки, лежащие на его границе
% таким образом мы удалим с изображения ромбы, размер которых меньше SE1
ER = imerode(IMG, SE1); 
%figure, imshow(ER);

% Применение дилатации - добавляем к оставшимся после эрозии ромбам 
% дополнительные точки, чтобы увеличить их размер
DI = imdilate(ER, strel('diamond', 50)); 
%figure, imshow(DI);

% Удаляем из исходного изображения полученные дилатацией ромбы
% в результате на изображении остаются только наименьшие ромбы
NEWIMG = IMG-DI;
%figure, imshow(NEWIMG);

% Добавляем к оставшимся ромбам дополнительные точки до формы круга
DINEW = imdilate(NEWIMG, strel('disk', 34, 6));
figure, imshow(DINEW);