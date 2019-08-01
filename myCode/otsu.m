function segbdimg = otsu(img)
[m,n]=size(img);
N=m*n;
L=10;
img=reshape(img,N,1);
[count center]=hist(img,L);%直方图
count=count/N;

for i=1:L%这两个循环是将两头不存在的灰度值去掉，提高运行速度
    if count(i)~=0
        st=i-1;
        break;
    end
end
for i=L:-1:1
    if count(i)~=0
        nd=i-1;
        break;
    end
end
f=count(st+1:nd+1);  %f是每个灰度出现的概率
p=st;   q=nd-st;
u=0;
for i=1:q
    u=u+f(i)*(p+i-1);  %u是像素的平均值 
    ua(i)=u;           %ua（i）是前i个像素的平均灰度值
end;

for i=1:q
    w(i)=sum(f(1:i));  %w（i）是前i个像素的累加概率？？
end;

d=(u*w-ua).^2./(w.*(1-w));
[y,tp]=max(d);  %可以取出数组的最大值及取最大值的点
th=tp+p;%这一句很重要
img(img>th)=0
% for i=1:m%二值化
%     for j=1:n
%         if img(i,j)>th
%             img(i,j)=0;
%         end
%     end
% end  
segbdimg=reshape(img,m,n);
end