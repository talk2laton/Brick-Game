function [Parts, txt1, txt2] = UpdatesideInfo(Parts, txt1, txt2, type, c, speed, flp, score)

point = [0.5,4];
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
del = p - [3,4];
Points = Points - ones(4,1)*del;

if(ishandle(txt1))
     txt1.String = num2str(speed);
     txt2.String = num2str(score);
     for n = 1:size(Points,1)
        V     = Square(Points(n,:));
        Parts{n}.Vertices = V;
        Parts{n}.FaceColor = c;
     end
else
    text(2.5, 23, 'Speed',...
         'HorizontalAlignment','Center','FontSize',12, 'FontWeight','bold','interpreter', 'latex');
    txt1 = text(2.5, 21, num2str(speed),...
         'HorizontalAlignment','Center','FontSize',12, 'FontWeight','bold','interpreter', 'latex');
    text(2.5, 16, 'Score',...
             'HorizontalAlignment','Center','FontSize',12, 'FontWeight','bold','interpreter', 'latex');
    txt2 = text(2.5, 14, num2str(score),...
             'HorizontalAlignment','Center','FontSize',12, 'FontWeight','bold','interpreter', 'latex');
    text(2.5, 9, 'Next',...
             'HorizontalAlignment','Center','FontSize',12, 'FontWeight','bold','interpreter', 'latex');
    Parts = {};
    for n = 1:size(Points,1)
        V     = Square(Points(n,:));
        Parts = [Parts, {patch(V(:,1),V(:,2),c)}];
        
    end
end
drawnow;
    