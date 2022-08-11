
#--------------------------
# minilab 9a
# Matrices and Vectors in R
#--------------------------

#---
# Part 1. Matrices in R

# Enter a matrix (three methods)
A = matrix(c(2,3,5,7), nrow=2, ncol=2)
A
B = rbind(c(1,2),c(8,9))  # bind as rows
B
C = cbind(c(1,2),c(8,9))  # bind as columns
C

# Matrix multiplication (two kinds, be careful!)
# A*B is element-by-element multiplication
A * B
# A%*%B is matrix multiplication
A %*% B

# Diagonal matrices (numbers only on the main diagonal
# from top-left to bottom-right, everything else zero)
diag(c(3,7))

# Identity matrix (ones on main diagonal, else zero)
I = diag(c(1,1))
I

# Matrix transpose
# rows become columns (and columns become rows)
t(A)

# Symmetric matrix
# if t(A) is the same as A

# Matrix inverse (what to multiply by to get identity)
Ainv = solve(A)
Ainv %*% A
A %*% Ainv

# Sums (overall, by-rows, by-columns)
A
sum(A)
rowSums(A)
colSums(A)

# Means (overall, by-rows, by-columns)
A
mean(A)
rowMeans(A)
colMeans(A)


#---
# Part 2. Vectors in R

# Note: We previously studied "vectors" in minilab 1c
data = c(4,2,8,5,1)
# Here we look at MATHEMATICAL vectors
# i.e., matrices with only one columm


# Vectors (matrix with one column)
a = cbind(c(4,2))
a
b = cbind(c(-1,5))
b
c = a+b
c

# Visualise parallelogram law of vector addition
par(pty="s")    # square plotting region
plot(0,0,xlim=c(-5,10),ylim=c(-5,10))
grid()
arrows(0,0,a[1],a[2],col='red')
arrows(0,0,b[1],b[2],col='green')

arrows(0,0,c[1],c[2],col='blue')

arrows(a[1],a[2],a[1]+b[1],a[2]+b[2],col="magenta")
arrows(b[1],b[2],b[1]+a[1],b[2]+a[2],col="cyan")

# Visualise scalar multiplication
a = rbind(c(4,2))
a
par(pty="s")    # square plotting region
plot(0,0,xlim=c(-10,10),ylim=c(-10,10))
grid()
arrows(0,0,a[1],a[2],col='red',lwd=4)

k = 0.5
b = k*a
arrows(0,0,b[1],b[2],col='green')
k = 2.0
b = k*a
arrows(0,0,b[1],b[2],col='blue')
k = -0.5
b = k*a
arrows(0,0,b[1],b[2],col='cyan')
k = -2.0
b = k*a
arrows(0,0,b[1],b[2],col='magenta')


# -- the end --
