
#----------------------------------------
# Lab 10a
# Visualisation of Matrix Transformations
#----------------------------------------

# Idea: We use a matrix to represent a transformation
#       (see lectures from Week 10)

# Recall: cbind is bind into columns
#         rbind is bind into rows

a = cbind(c(1,0))
b = cbind(c(0,1))

flag = rbind(c(0, 0, 1, 1, 0),
             c(0, 2, 2, 1, 1))
# This flag is just 5 points:
#   (0,0), (0,2), (1,2), (1,1), (0,1)
# that will be plotted with line segments
# joining consecutive points.

# Setup square plotting region (old-school R)
# and set the axis limits
par(pty="s")
plot(0,0,xlim=c(-2,2),ylim=c(-2,2))
grid()

# Draw red/green vectors and blue flag
#arrows(0,0,a[1],a[2],col='red',lwd=7)
#arrows(0,0,b[1],b[2],col='green',lwd=7)
lines(flag[1,],flag[2,],col='blue')


#####
# Select which example matrix to use
example = 3

if (example==1) {
  # Example 1.  Rotate 90 degrees anticlockwise
  M = cbind(c(1,0),c(-1,0))
} else if (example==2) {
  # Example 2.  Reflection in y-axis
  M = cbind(c(-1,0),c(0,1))
} else if (example==3) {
  # Example 3.  Rotation 180 degrees
  M = cbind(c(-1,0),c(0,-1))
} else if (example==4) {
  # Example 4.  Reflection in x-axis
  M = cbind(c(1,0),c(0,-1))
} else if (example==5) {
  # Example 5.  Rotation 270 degrees anticlockwise
  M = cbind(c(0,-1),c(1,0))
} else if (example==6) {
  # Example 6.  Reflection in mirror line y=x
  M = cbind(c(0,1),c(1,0))
} else if (example==7) {
  # Example 7.  Rotate anticlockwise by degrees
  #
  # -- try some different angles (in degrees)
  #
  degrees = 135
  theta = (degrees/360)*(2*pi)
  M = cbind(c( cos(theta), sin(theta)),
            c(-sin(theta), cos(theta)))
} else if (example==8) {
  # Example 8.  Reflect in mirror line
  #
  # -- try some different angles (in degrees)
  #
  degrees = 135  # angle of mirror line
  theta = 2*(degrees/360)*(2*pi)
  M = cbind(c( cos(theta), sin(theta)),
            c( sin(theta),-cos(theta)))
} else if (example==9) {
  # Exercise
  # Scaling matrix (diagonal matrix)
  #
  # ... put your code here ...
  #
  M = cbind(c(1,0),c(0,1))
  
} else if (example==10) {
  # Exercise
  # Shear matrix (upper or lower triangular matrix)
  #
  # ... put your code here ...
  #
  magic = -0.5
  M = cbind(c(1,0),c(magic,1))
  
}

# Display the matrix chosen
M

# Transform the vectors and flag
newa = M %*% a
newb = M %*% b
newflag = M %*% flag

# Draw red/green transformed vectors and transformed blue flag
# as dashed (linetype: lty=2) arrows/lines
# [http://www.sthda.com/english/wiki/line-types-in-r-lty]

lines(newflag[1,],newflag[2,],col='blue',lty=2)

#arrows(0,0,newa[1],newa[2],col='red',lwd=3,lty=2)
#arrows(0,0,newb[1],newb[2],col='green',lwd=3,lty=2)

# -- the end --
