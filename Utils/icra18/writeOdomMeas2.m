function writeOdomMeas2()

%odometry Meas Noise
odomMu = [0,0,0,0,0,0]';
odomSigma = [0.4,0.4,0.4,pi/30,pi/30,pi/30]'; %1 cm, pi/60rad or 3deg std
odomCov = [0.16,0.0,0.0,0.0,0.0,0.0,0.16,0.0,0.0,0.0,0.0,0.16,0.0,...
    0.0,0.0,pi^2/900,0.0,0.0,pi^2/900,0.0,pi^2/900];

filePath = '/home/mina/workspace/src/Git/do-slam/Utils/icra18/cameraGroundtruth.txt';
fid = fopen(filePath);
format = '%s %d %f %f %f %f %f %f';
g = textscan(fid,format,'delimiter',' ');
poses = cell2mat(g(3:end));

for i=2:size(poses,1) 
   pose1ID = i-1;
   pose2ID = i;
   odomMeas = AbsoluteToRelativePoseR3xso3(poses(i-1,:)',poses(i,:)');
   odometryMeasNoise = normrnd(odomMu,odomSigma,size(odomMeas));
   odomMeasNoisy = RelativeToAbsolutePoseR3xso3(odomMeas,odometryMeasNoise);
   filePath = '/home/mina/workspace/src/Git/do-slam/Utils/icra18/';
   fID = fopen(strcat(filePath,'odometryMeasGraphFile.txt'),'a');
   format = strcat('%s %d %d ',repmat(' %6f',1,27));
   fprintf(fID,format,'EDGE_R3_SO3',pose1ID,pose2ID,odomMeasNoisy,odomCov);
   fprintf(fID,'\n');
   fclose(fID);
end
end
