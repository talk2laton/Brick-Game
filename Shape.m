function Parts = Shape(point, type, c, flp)
Shift  = [1, 0, 1, 0, 1, 0, 1, 0, 1, 0
          2, 0, 2, 0, 2, 0, 2, 0, 2, 0
          2,-1, 3, 0, 3, 0, 2,-1, 1,-1
          3,-1, 3,-1, 4, 0, 3, 0, 2,-1];
index = [9, 10];
switch type
   case 'Z'
       index = [1,2];
   case 'L'
       index = [3,4];
   case 'I'
       index = [5,6];
   case 'T'
       index = [7,8]; 
end
if(flp)
    M = [-1,0
         0, 1];
    Points = ones(4,1)*(point + [4, -2]);
    Points = Points - Shift(:,index)*M;
else
    Points = ones(4,1)*point;
    Points = Points + Shift(:,index);
end
p   = floor(sum(Points)/4);
del = p - [5,25];
Points = Points - ones(4,1)*del;
Parts = {};
for n = 1:size(Points,1)
    V     = Square(Points(n,:));
    Parts = [Parts, {patch(V(:,1),V(:,2),c)}];
    drawnow;
end