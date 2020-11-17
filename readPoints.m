function pts = readPoints(image, n)
if nargin < 2
    n = Inf;
    pts = zeros(2, 0);
else
    pts = zeros(2, n);
end
imshow(image);     % display image
xold = 0;
yold = 0;
k = 0;
hold on;           % and keep it there while we plot

while true
    [xi, yi, but] = ginput(1);      % get a point
    if ~isequal(but, 1)             % stop if not button 1
        break
    end
    k = k + 1;
    pts(1,k) = xi;
    pts(2,k) = yi;
    
      if xold
          plot([xold xi], [yold yi], 'go');  % draw as we go
      else
          plot(xi, yi, 'go');         % first point on its own
      end
      if isequal(k, n)
          break
      end
      xold = xi;
      yold = yi;

end
hold off;
if k < size(pts,2)
    pts = pts(:, 1:k);
end
pre = 'X&Y_';
names = {};
for k = 1:n
    names = [names,strcat([pre,num2str(k,'%02d')])];
    xlswrite('myfile.csv',names, 'Sheet 1', 'A1')
end
xlswrite('myfile.csv',pts, 'Sheet 1', 'A2')
end

