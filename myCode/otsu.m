function segbdimg = otsu(img)
[m,n]=size(img);
N=m*n;
L=10;
img=reshape(img,N,1);
[count center]=hist(img,L);%ֱ��ͼ
count=count/N;

for i=1:L%������ѭ���ǽ���ͷ�����ڵĻҶ�ֵȥ������������ٶ�
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
f=count(st+1:nd+1);  %f��ÿ���Ҷȳ��ֵĸ���
p=st;   q=nd-st;
u=0;
for i=1:q
    u=u+f(i)*(p+i-1);  %u�����ص�ƽ��ֵ 
    ua(i)=u;           %ua��i����ǰi�����ص�ƽ���Ҷ�ֵ
end;

for i=1:q
    w(i)=sum(f(1:i));  %w��i����ǰi�����ص��ۼӸ��ʣ���
end;

d=(u*w-ua).^2./(w.*(1-w));
[y,tp]=max(d);  %����ȡ����������ֵ��ȡ���ֵ�ĵ�
th=tp+p;%��һ�����Ҫ
img(img>th)=0
% for i=1:m%��ֵ��
%     for j=1:n
%         if img(i,j)>th
%             img(i,j)=0;
%         end
%     end
% end  
segbdimg=reshape(img,m,n);
end