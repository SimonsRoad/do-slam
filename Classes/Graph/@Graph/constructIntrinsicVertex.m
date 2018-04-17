function [obj] = constructIntrinsicVertex(obj,config,edgeRow)
%CONSTRUCTINTRINSICVERTEX constructs vertex representing camera intrinsics.

%% 1. load vars from edge row
edgeLabel = edgeRow{1};
edgeIndex = edgeRow{2};
posePointVertexes = edgeRow{3};
poseVertex = posePointVertexes(1);
pointVertex = posePointVertexes(2);
intrinsicVertex = edgeRow{4};
edgeValue = edgeRow{5};
edgeCovariance = edgeRow{6};

%% 2. intrinsics
% only a scalar representing focal length
intrinsics = 200;

%% 3. vertex properties
value = intrinsics;
covariance = []; %not using this property yet
type = 'intrinsics';
iEdges = [edgeIndex];
index = intrinsicVertex;  

%% 4. construct vertex
obj.vertices(index) = Vertex(value,covariance,type,iEdges,index);

end
