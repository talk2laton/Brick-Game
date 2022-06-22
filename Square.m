function V = Square(Point)
x = Point(1); y = Point(2);
V = [x - 0.5, y + 0.5;
     x + 0.5, y + 0.5;
     x + 0.5, y - 0.5;
     x - 0.5, y - 0.5];