function Flipshape(Parts)
M = [-1,0
     0, 1];
V = sum(Parts{1}.Vertices(1:4,:));
for n = 2:numel(Parts)
    V = V + sum(Parts{n}.Vertices(1:4,:));
end
Centroid = floor(V/(4*n));
for n = 1:numel(Parts)
    Parts{n}.Vertices(:,1) = Parts{n}.Vertices(:,1) - Centroid(1);
    Parts{n}.Vertices(:,2) = Parts{n}.Vertices(:,2) - Centroid(2);
    Parts{n}.Vertices = Parts{n}.Vertices*M;
    Parts{n}.Vertices(:,1) = Parts{n}.Vertices(:,1) + Centroid(1);
    Parts{n}.Vertices(:,2) = Parts{n}.Vertices(:,2) + Centroid(2);
end