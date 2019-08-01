function fEnergy=adafusion(img,Energy)    
        img=double(img);
        [m,n]=size(img);
        t=sum(img(:))/(m*n);
        tr=max(Energy(:))-t;
        fEnergy= 0.7*((1-tr)*img + tr*Energy)/10 + 0.3*(10*img.*Energy);
end