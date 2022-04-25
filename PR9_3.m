IMG = imread('IMG\fig1.jpg'); 
figure, imshow(IMG);

% Применение эрозии - из объекта удаляются точки, лежащие на его границе
% таким образом мы удалим с изображения все фигуры, размер которых меньше 
% структурного элемента strel
ER = imerode(IMG, strel('disk', 60, 0)); 
%figure, imshow(ER);

% Применение дилатации - добавляем к оставшемуся после эрозии кругу
% дополнительные точки, чтобы увеличить его размер до исходного
DI = imdilate(ER, strel('disk', 65, 0)); 
%figure, imshow(DI);

% Удаляем из исходного изображения полученный дилатацией круг
% в результате на изображении остаются только остальные фигуры
CIRCLE = IMG-DI;
%figure, imshow(NEWIMG);

% Находим разницу между исходным и полученным изображениями
RESULT = imabsdiff(IMG,CIRCLE);
figure, imshow(RESULT);
