function G = laplacian(X,Y)
sigma = 0.1;
G = exp(-abs(X-Y)/sigma);
end