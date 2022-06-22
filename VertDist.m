function maxY = VertDist
global PartStack Parts
maxY = 25;
for n = 1:numel(Parts)
    V = Parts{n}.Vertices;
    vmean    = ceil(mean(V));
    vmean(2) = min(25,vmean(2));
    if(vmean(2)) == 1
        maxY = 0;
        break;
    end
    maxY = min(maxY, YDiff(PartStack, vmean(2), vmean(1)));
end
    