% load dataset

load iris.txt

X = iris(:,1:4)';

y = iris(:,5)';

[ M, N ] = size( X );


%  -------------- pca tranformation -----------------


% centralize

m = mean( X, 2 );

X = X - repmat( m, 1, N );

% calculate co-variance matrix

covariance =  ( X * transpose( X ) ) / ( N -  1 );

% find the eigenvalues and eigenvectors

[ PC, E ] = eig( covariance );

V = diag( E );

% select the principal components

[ junk, rindices ] = sort( -1 * V );

V = V( rindices );

PC = PC( : , rindices );

% project the original dataset

signals = PC' * X;

% display( signals );

figure(2);

scatter( signals( 1,: ), signals( 2,: ), 17, y,'filled' );

xlabel('PC1'); ylabel('PC2')


