I = 'dataset\roma\BDXD54\IMG00002.jpg'; % IMG00002 IMG00071

% function Filtered = vvDirectionFilter(I, method, preprocess, varargin)
% ��������
% method = 'steergauss'
% vvDirectionFilter('dataset\roma\BDXD54\IMG00030.jpg')
% Gabor�任���ڼӴ�����Ҷ�任��Gabor����������Ƶ��ͬ�߶ȡ���ͬ��������ȡ��ص�������Gabor �˲�����Ƶ�ʺͷ���������������Ӿ�ϵͳ�����Գ���������ʶ���ڿռ��򣬶�άGabor�˲�����һ����˹�˺���������ƽ�沨�ĳ˻�������ģ�
% ���ÿɵ��˲�������ȥ�ض�����
% ��sobel�������Ե�ݶȷ���ʱ����ģ��������õ�Gx,Gy,����ֵ�����Լ����ı�Ե�����atan(Gy/Gx)
% ɸѡ��Ե����

% if nargin > 2 
	% I = preprocess(I, varargin{:});
% end

if isstr(I)
	I = imread(I);
end

[lineL, lineR]= im2boundaryline(I);

% ע�ⲻ�Ǿ�ֵ
% �����Ȱ��վ�ֵ���
theta = 180 - (lineL.theta + lineR.theta)/2; % 90 - theta
% PointL = lineL.point2;
% PointR = lineR.point2;
% PointM = PointL/2.0 + PointR/2.0; %Left Middle Right
% PointO = lineL.point1;

% % ע�����theta��houghline��theta��ͬ
% thetaL = atan( (PointL(2) - PointO(2) )/(PointL(1) - PointO(1) ) )*360/pi;
% thetaR = atan( (PointR(2) - PointO(2) )/(PointR(1) - PointO(1) ) )*360/pi;
% theta = atan( (PointM(2) - PointO(2) )/(PointM(1) - PointO(1) ) )*360/pi;

thetaL = 180 - lineL.theta;
thetaR = 180 - lineR.theta;
Gray = rgb2gray(I);
[J,H] = steerGauss(Gray,theta,3,true);
figure;
implot(I, J, J>0.2d*max(J(:)));

% function J = steerGauss(I,Wsize,sigma,theta)
% % USAGE:
% % Wsize = 20;sigma = 1;%Wsize = 7;
% % steerGauss(Gray,Wsize,sigma,theta);

% % ����ο�http://blog.163.com/yuyang_tech/blog/static/216050083201302324443736/
% % ���Ƕ�ת����[0,pi]֮��
% theta = theta/180*pi;
% % �����ά��˹����x,y�����ƫ��gx,gy
% k = [-Wsize:Wsize];
% g = exp(-(k.^2)/(2*sigma^2));
% gp = -(k/sigma).*exp(-(k.^2)/(2*sigma^2));
% gx = g'*gp;
% gy = gp'*g;
% % ����ͼ�����x,y������˲����
% Ix = conv2(I,gx,'same');
% Iy = conv2(I,gy,'same');
% % ����ͼ�����theta������˲����
% J = cos(theta)*Ix+sin(theta)*Iy;

% % figure,imshow(J);
% figure,
% subplot(1,3,1),axis image; colormap(gray);imshow(I),title('ԭͼ��');
% subplot(1,3,2),axis image; colormap(gray);imshow(cos(theta)*gx+sin(theta)*gy),title('�˲�ģ��');
% subplot(1,3,3),axis image; colormap(gray);imshow(J),title('�˲����'); 