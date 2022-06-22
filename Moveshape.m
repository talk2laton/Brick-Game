function moved = Moveshape(Parts, del)
global PartStack
moved = 0;
Verts = [];
for n = 1:numel(Parts)
    V = Parts{n}.Vertices + ones(4,1)*del;
    Verts    = [Verts,V];
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
moved = 1;