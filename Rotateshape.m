function Rotateshape(Parts)
global PartStack
M    = [0,-1
        1, 0];
SumV = 0;
for n = 1:numel(Parts)
    V = Parts{n}.Vertices;
    SumV = SumV + sum(V);
end
Centroid = floor(SumV/(4*n));
Verts = [];
for n = 1:numel(Parts)
    V = (Parts{n}.Vertices - ones(4,1)*Centroid)*M + ones(4,1)*Centroid;
    Verts = [Verts,V];
    vmean    = ceil(mean(V));
    vmean(2) = min(25,vmean(2));
    if(vmean(1)>10 || vmean(1) < 1)
        return;
    end
    if(vmean(2) < 1)
        return;
    end
    if(~isempty(PartStack{vmean(2), vmean(1)}))
        return;
    end
end
for n = 1:numel(Parts)
    Parts{n}.Vertices = Verts(:,[2*n-1,2*n]);
end