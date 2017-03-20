clear all
close all

filename = 'test.txt';
delimiterIn = ',';
headerlinesIn = 0;
X = importdata(filename,delimiterIn,headerlinesIn);

%Mdl1 = fitcsvm(X(:,1),X(:,7),'kernelFunction','laplacian','Standardize',true);

%for k = [1,2,3,4,5,6]
%    Mdl6 = fitcsvm(X(:,k),X(:,7),'kernelFunction','laplacian','Standardize',true);
%end

Ldata=[X(51:150,:);X(351:450,:)];
MLdata = movstd(Ldata(:,1:6),5,0,1);
MLdata = horzcat(MLdata(:,1:6),Ldata(:,7));
Tdata=[X(151:250,:);X(451:550,:)];
MTdata = movstd(Tdata(:,1:6),5,0,1);
MTdata = horzcat(MTdata(:,1:6),Tdata(:,7));

Mdl1 = fitcsvm(MLdata(:,1),MLdata(:,7),'kernelFunction','laplacian','Standardize',true);
Mdl2 = fitcsvm(MLdata(:,2),MLdata(:,7),'kernelFunction','laplacian','Standardize',true);
Mdl3 = fitcsvm(MLdata(:,3),MLdata(:,7),'kernelFunction','laplacian','Standardize',true);
Mdl4 = fitcsvm(MLdata(:,4),MLdata(:,7),'kernelFunction','laplacian','Standardize',true);
Mdl5 = fitcsvm(MLdata(:,5),MLdata(:,7),'kernelFunction','laplacian','Standardize',true);
Mdl6 = fitcsvm(MLdata(:,6),MLdata(:,7),'kernelFunction','laplacian','Standardize',true);

Mdl = fitcsvm(MLdata(:,1:6),MLdata(:,7),'kernelFunction','laplacian','Standardize',true);

%figure;
%gscatter(MLdata(:,2),MLdata(:,7));
%stem(Ldata(:,1),laplacian(MLdata(:,1),MLdata(:,7)));
%title('Scatter Diagram of Simulated Data')

preL1=predict(Mdl1,MLdata(:,1));
preL2=predict(Mdl2,MLdata(:,2));
preL3=predict(Mdl3,MLdata(:,3));
preL4=predict(Mdl4,MLdata(:,4));
preL5=predict(Mdl5,MLdata(:,5));
preL6=predict(Mdl6,MLdata(:,6));
PREDATAL=horzcat(preL1,preL2,preL3,preL4,preL5,preL6)
PRE=predict(Mdl,MLdata(:,1:6))

preT1=predict(Mdl1,MTdata(:,1));
preT2=predict(Mdl2,MTdata(:,2));
preT3=predict(Mdl3,MTdata(:,3));
preT4=predict(Mdl4,MTdata(:,4));
preT5=predict(Mdl5,MTdata(:,5));
preT6=predict(Mdl6,MTdata(:,6));
PREDATAT=horzcat(preT1,preT2,preT3,preT4,preT5,preT6)
PREDATAT4=horzcat(zeros(200,1),preT2,preT3,zeros(200,1),preT5,preT6)

MB1=mean(PREDATAL(1:100,1))
MB2=mean(PREDATAL(1:100,1))
MB3=mean(PREDATAL(1:100,1))
MB4=mean(PREDATAL(1:100,1))
MB5=mean(PREDATAL(1:100,1))
MB6=mean(PREDATAL(1:100,1))

MA1=mean(PREDATAL(101:200,1))
MA2=mean(PREDATAL(101:200,1))
MA3=mean(PREDATAL(101:200,1))
MA4=mean(PREDATAL(101:200,1))
MA5=mean(PREDATAL(101:200,1))
MA6=mean(PREDATAL(101:200,1))


figure;
gscatter(MLdata(:,2),PREDATAL2(:,7));
%stem(Ldata(:,1),laplacian(MLdata(:,1),MLdata(:,7)));
title('Scatter Diagram of Simulated Data')