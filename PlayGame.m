function PlayGame(speed)
close all; 
global Parts PartStack hstack 
if (nargin == 0)
    speed = 1; 
end
clearedlinestotal = 0;
score = 0;
figure('Position',[3243 42 597 954], 'keypressfcn',@fh_kpfcn);% [920 42 446 642]
ax1 = axes('Position',[0.80,0.05,0.15,0.90]);
axis([0,6,0,25]); daspect([1,1,1]); hold on;
ax2 = axes('Position',[0.02,0.05,0.80,0.90]);
axis([0,10,0,25]); daspect([1,1,1]); 
set(ax2,'XTickLabel',[]); set(ax2,'YTickLabel',[]);
types = 'ZLITS';
hstack = zeros(1,10); 
m = randi(5); c = rand(1,3); flp = randi(10);
axes(ax1); Parts1 = []; txt1 = []; txt2 = []; PartStack = cell(25,10);
[Parts1, txt1, txt2] = UpdatesideInfo(Parts1, txt1, txt2, types(m), c, speed, mod(flp,2), score); 
while(max(hstack) < 25)
    m1 = m; c1 = c; flp1 = flp; 
    m = randi(5); c = rand(1,3); flp = randi(10); axes(ax1); 
    [Parts1, txt1, txt2] = UpdatesideInfo(Parts1, txt1, txt2, types(m), c, speed, mod(flp,2), score); 
    axes(ax2); Parts = Shape([3.5,24.5],types(m1),c1, mod(flp1,2)); 
    speed = floor(clearedlinestotal/20) + 1;
    maxY = 1;
    while(maxY)
        Moveshape(Parts,[0,-1]);
        drawnow;
        pause(1/speed);
        maxY = VertDist;
    end
    clearedlines = StackParts(Parts);
    clearedlinestotal = clearedlinestotal + clearedlines;
    score = score + speed*clearedlines*10;
end
text(5, 17, 'Game','VerticalAlignment','middle','Color','w',...
         'HorizontalAlignment','Center','FontSize',70, 'FontWeight','bold','interpreter', 'latex');
text(5, 17, 'Game','VerticalAlignment','middle',...
         'HorizontalAlignment','Center','FontSize',65, 'FontWeight','bold','interpreter', 'latex');
text(5, 14, 'Over','VerticalAlignment','middle','Color','w',...
         'HorizontalAlignment','Center','FontSize',70, 'FontWeight','bold','interpreter', 'latex');
text(5, 14, 'Over',...
         'HorizontalAlignment','Center','FontSize',65, 'FontWeight','bold','interpreter', 'latex');
if exist('HighestScore.mat', 'file')
    load('HighestScore.mat')
else
    HighestScore = 0;
end
text(5, 11, num2str(score),'VerticalAlignment','middle','Color','w',...
         'HorizontalAlignment','Center','FontSize',70, 'FontWeight','bold','interpreter', 'latex');
text(5, 11, num2str(score),'VerticalAlignment','middle',...
         'HorizontalAlignment','Center','FontSize',65, 'FontWeight','bold','interpreter', 'latex');
if(score > HighestScore)
    text(5, 8, 'Highest','VerticalAlignment','middle','Color','w',...
         'HorizontalAlignment','Center','FontSize',40, 'FontWeight','bold','interpreter', 'latex');
    text(5, 8, 'Highest','VerticalAlignment','middle',...
         'HorizontalAlignment','Center','FontSize',37, 'FontWeight','bold','interpreter', 'latex');
     HighestScore = score; 
end
save HighestScore HighestScore
