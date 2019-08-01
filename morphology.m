function G1=morphology(magnitude)
B=[0 1 0
   1 1 1
   0 1 0];
 mag = imdilate(magnitude,B);
 se1 = strel('disk',10);
 closeBW = imclose(mag,se1);
 se2=strel('square',2);
 c=imopen(closeBW,se2);
%  se3 = strel('ball',5,5);
%  erodedI = imerode(c,se3);
 se4 = strel('disk',10);
 G1 = imclose(c,se4);
end