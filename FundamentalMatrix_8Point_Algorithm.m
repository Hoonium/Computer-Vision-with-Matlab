
matchedPoints1 = matchedOriginal;
matchedPoints2 = matchedDistorted;


fRANSAC = estimateFundamentalMatrix(matchedPoints1,matchedPoints2,'Method','RANSAC','NumTrials',2000,'DistanceThreshold',1e-4)

[fLMedS, inliers] = estimateFundamentalMatrix(matchedPoints1,matchedPoints2,'NumTrials',2000)

inlierPts1 = matchedPoints1(inliers,:);
inlierPts2 = matchedPoints2(inliers,:);
fNorm8Point = estimateFundamentalMatrix(inlierPts1,inlierPts2,'Method','Norm8Point')