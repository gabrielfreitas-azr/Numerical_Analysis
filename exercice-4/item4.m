% Leitura da imagem 'lena.jpg' com o comando em OCTAVE

A = imread('lena.jpg');
A = double(A);

% Utiliza o decomposição SVD

[U, S, V] = svd(A);

% Usando os primeiros 20 valores singulares.

k = 20;
X = U(:, 1:k) * S(1:k, 1:k) * V(:, 1:k)';

imwrite(uint8(X), 'lena_20.jpg'); % "Salva" a imagem lena_20.jpg
colormap(gray(256));

% Agora, usando os primeiros 60 valores singulares para comparação.

k = 60;
X = U(:, 1:k) * S(1:k, 1:k) * V(:, 1:k)';

imwrite(uint8(X), 'lena_60.jpg'); % "Salva" a imagem lena_60.jpg
colormap(gray(256));