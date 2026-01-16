StepSize = input("What would you like the Resolution of the graph to be?\n[0.001,0.02]\n") % inputs
iterM = input("How many iterations would you like to run?\n[10,1000]\n")
coordList = input("input bottom left and top right coordinates (default is (-2,-2),(2,2).\ninput as the form [x1,y1,x2,y2]\n")
if isempty(coordList)
    coordList = [-2, -2, 2, 2];
end
x1 = coordList(1);
y1 = coordList(2);
x2 = coordList(3);
y2 = coordList(4);
if x2-x1 < y2-y1
    stepSize = StepSize*(x2-x1)/4;
else
    stepSize = StepSize*(y2-y1)/4;
end

arraySizeX = floor((x2-x1)/stepSize) + 1; % initializations
arraySizeY = floor((y2-y1)/stepSize) + 1;
rgbArray = zeros(1,3);
Array = zeros(arraySizeX*arraySizeY,3, 'single');

function rgbVector = color(iter,maxx) % color function
    fifth = maxx/5;
    if (0 <= iter) && (iter <= fifth)
        r = iter/fifth;
        g = 0;
        b = 0;
    elseif (fifth < iter) && (iter <= 2*fifth)
        r = 2 - iter/fifth;
        g = iter/fifth - 1;
        b = 0;
    elseif (2*fifth < iter) && (iter <= 3*fifth)
        r = 0;
        g = 3 - iter/fifth;
        b = iter/fifth - 2;
    elseif (3*fifth < iter) && (iter <= 4*fifth)
        r = iter/fifth - 3;
        g = 0;
        b = 1;
    elseif (4*fifth < iter) && (iter <= maxx)
        r = 1;
        g = iter/fifth - 4;
        b = 1;
    else
        r = 1;
        g = 1;
        b = 1;
    end
    rgbVector = [r g b];
end

index = 1; % iteration values
for y_0 = y2:-stepSize:y1
    for x_0 = x1:stepSize:x2
        C = x_0 + y_0*1i;
        Z = C;
        iter = 0;
        bar = abs(C);
        while (bar <= 2) && (iter <= iterM)
            Z = Z^2 + C;
            bar = abs(Z);
            iter = iter + 1;
        end
        RGB = color(iter,iterM);
        Array(index,:) = RGB;
        index = index + 1;
        disp(C)
        disp(iter)
    end
end

xArray = zeros(1, arraySizeX * arraySizeY); % coords
yArray = zeros(1, arraySizeX * arraySizeY);
pointsX = x1:stepSize:x2;
pointsY = y2:-stepSize:y1;
[X, Y] = meshgrid(pointsY, pointsX);
xArray = reshape(Y, [], 1);   
yArray = reshape(X, [], 1);   

scatter(xArray,yArray,1,Array,"filled","square") % plot
bufX = (x2-x1)/40;
bufY = (y2-y1)/40;
xlim([x1-bufX,x2+bufX])
ylim([y1-bufY,y2+bufY])
axis equal
box off
grid off
set(gcf,'Position',[10,10,1100,1100])
[-0.66,-0.72,-0.42,-0.52]
disp(['Step Size: ', num2str(StepSize), ', Iterations: ', num2str(iterM), ', Coordinates: ', mat2str(coordList)])
