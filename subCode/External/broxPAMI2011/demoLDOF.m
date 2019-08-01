im1 = double(imread('tennis492.ppm'));
im2 = double(imread('tennis493.ppm'));
flow = mex_LDOF(im1,im2);

flowmap = sqrt(flow(:,:,1).^2 + flow(:,:,2).^2);