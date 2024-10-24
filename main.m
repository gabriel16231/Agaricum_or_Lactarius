close all
clc
%% Citirea si preprocesare datelor
dataFolder = 'train';
categories = {'Agaricus', 'Lactarius'};

imds=imageDatastore(fullfile(dataFolder, categories), 'LabelSource', 'foldernames', 'IncludeSubfolders', true);
dataFolder = 'test';
imds_t=imageDatastore(fullfile(dataFolder, categories), 'LabelSource', 'foldernames', 'IncludeSubfolders', true);

data=[];                            % date de antrenare
data_t =[];                         % date de test
while hasdata(imds) 
    img = read(imds) ;              % citeste o imagine din datastore
    img = imresize(img, [227 227]);
    % figure, imshow(img); % decomentati pentru a vizualiza pozele din
    %pause                        %baza de dat 
    img = double(rgb2gray(img));
    data =[data, reshape(img, [], 1)];

end
e = double(imds.Labels == 'Agaricus'); 
while hasdata(imds_t) 
    img = read(imds_t) ;              % citeste o imagine din datastore
    img = imresize(img, [227 227]); 
    %figure, imshow(img);    % decomentati pentru a vizualiza pozele din
    % pause                  %baza de date
    img = double(rgb2gray(img));
    data_t =[data_t, reshape(img, [], 1)];
    
end
e_t = double(imds_t.Labels == 'Agaricus'); 
%Reducerea dimensiuni
data_pca = pca(data, 'NumComponents', 45)';
data_pca_t = pca(data_t, 'NumComponents', 45);

clear categories imds imds_t img dataFolder 

[n, N] = size(data_pca);
%%

%%rezolvare
A=data_pca';
m=16;
A_1=[data_pca',ones(N,1)];
A_T=[data_pca_t,ones(80,1)];
x0=randn(m,1);
X0=randn(n+1,m);

[X,x]=MG(e,A_1,X0,x0);
 Err=testare(e_t,A_T,X,x);
%M. Gradient Stocastic
p=randperm(N);
A_s=A_1(perm,:);
e_sh=e(perm);
[Xs,xs]=MG(e_s,A_s,X0,x0);
matrice_confuzie(e_s,A_s,Xs,xs);




 

%%