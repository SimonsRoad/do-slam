clear all
% close all
 
%% Trajectory Initialisation
% 1. Trajectory can be initialised from waypoints, full pose/position data, or
%    some model (see constructor in PoseTrajectory/PositionTrajectory)
% 2. 'model' construction method not yet implemented
% 3. SE3 or R3xSO3 currently supported for PoseTrajectory
% 4. R3 currently supported for PositionTrajectory

%% 1. Generate Trajectories
% waypoints (each column = [t,x,y,z]')
waypoints = [0.1 0.15 0.25 0.4;
             0 2 4 8;
             0 3 5 2;
             0 4 6 8];
         
% fitting
nPoses = 51;
t0 = 0;
t1 = 0.5;
fitType = 'smoothingspline';
tFit = linspace(t0,t1,nPoses);

% construct trajectories
poseTrajectory1 = PoseTrajectory('SE3','waypoints',waypoints,tFit,'poly1');
poseTrajectory2 = PoseTrajectory('SE3','waypoints',waypoints,tFit,'poly2');
poseTrajectory3 = PoseTrajectory('SE3','waypoints',waypoints,tFit,'linearinterp');
%Example - constructing from full pose data
poseTrajectoryTemp = PoseTrajectory('SE3','waypoints',waypoints,tFit,'cubicinterp');
poseTrajectory4 = PoseTrajectory('SE3','discrete',poseTrajectoryTemp.get('dataPoints'));
poseTrajectory5 = PoseTrajectory('SE3','waypoints',waypoints,tFit,'smoothingspline');
poseTrajectory6 = PoseTrajectory('R3xSO3','waypoints',waypoints,tFit,'smoothingspline');

positionTrajectory1 = PositionTrajectory('R3','waypoints',waypoints,tFit,'poly1');
positionTrajectory2 = PositionTrajectory('R3','waypoints',waypoints,tFit,'poly2');
positionTrajectory3 = PositionTrajectory('R3','waypoints',waypoints,tFit,'linearinterp');
positionTrajectory4 = PositionTrajectory('R3','waypoints',waypoints,tFit,'cubicinterp');
positionTrajectory5 = PositionTrajectory('R3','waypoints',waypoints,tFit,'smoothingspline');

%% 2. Plot
% pose trajectory
figure
viewPoint = [-30,60];
axisLimits = [-5,10,-5,8,-5,10];

subplot(2,3,1)
title('poly1')
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
view(viewPoint)
axis(axisLimits)
hold on
plot3(waypoints(2,:),waypoints(3,:),waypoints(4,:),'r*')
poseTrajectory1.plot()

subplot(2,3,2)
title('poly2')
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
view(viewPoint)
axis(axisLimits)
hold on
plot3(waypoints(2,:),waypoints(3,:),waypoints(4,:),'r*')
poseTrajectory2.plot()

subplot(2,3,3)
title('linearinterp')
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
view(viewPoint)
axis(axisLimits)
hold on
plot3(waypoints(2,:),waypoints(3,:),waypoints(4,:),'r*')
poseTrajectory3.plot()

subplot(2,3,4)
title('cubicinterp')
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
view(viewPoint)
axis(axisLimits)
hold on
plot3(waypoints(2,:),waypoints(3,:),waypoints(4,:),'r*')
poseTrajectory4.plot()

subplot(2,3,5)
title('smoothingspline (SE3)')
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
view(viewPoint)
axis(axisLimits)
hold on
plot3(waypoints(2,:),waypoints(3,:),waypoints(4,:),'r*')
poseTrajectory5.plot()

subplot(2,3,6)
title('smoothingspline (R3xSO3)')
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
view(viewPoint)
axis(axisLimits)
hold on
plot3(waypoints(2,:),waypoints(3,:),waypoints(4,:),'r*')
poseTrajectory6.plot()

suptitle('Comparison of pose trajectory fitting methods')

% position trajectory
figure
viewPoint = [-30,60];
axisLimits = [-5,10,-5,8,-5,10];

subplot(2,3,1)
title('poly1')
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
view(viewPoint)
axis(axisLimits)
hold on
plot3(waypoints(2,:),waypoints(3,:),waypoints(4,:),'r*')
positionTrajectory1.plot()

subplot(2,3,2)
title('poly2')
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
view(viewPoint)
axis(axisLimits)
hold on
plot3(waypoints(2,:),waypoints(3,:),waypoints(4,:),'r*')
positionTrajectory2.plot()

subplot(2,3,3)
title('linearinterp')
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
view(viewPoint)
axis(axisLimits)
hold on
plot3(waypoints(2,:),waypoints(3,:),waypoints(4,:),'r*')
positionTrajectory3.plot()

subplot(2,3,4)
title('cubicinterp')
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
view(viewPoint)
axis(axisLimits)
hold on
plot3(waypoints(2,:),waypoints(3,:),waypoints(4,:),'r*')
positionTrajectory4.plot()

subplot(2,3,5)
title('smoothingspline')
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
view(viewPoint)
axis(axisLimits)
hold on
plot3(waypoints(2,:),waypoints(3,:),waypoints(4,:),'r*')
positionTrajectory5.plot()

suptitle('Comparison of position trajectory fitting methods')