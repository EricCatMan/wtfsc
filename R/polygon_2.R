n <- 100
xx <- c(0:n, n:0)
yy <- c(c(0,cumsum(stats::rnorm(n))), rev(c(0,cumsum(stats::rnorm(n)))))

##plot   (xx, yy, type="n", xlab="Time", ylab="Distance")
polygon(xx, yy, col="gray", border = "red")
title("Distance Between Brownian Motions")

## 画多边形
xx1 <- c(0,0,2,2)
yy1 <- c(0,2,2,0)
plot(2, 2, type="n", xlab="Time", ylab="Distance")
polygon(xx1, yy1, col="gray", border = "red")
title("Distance Between Brownian Motions")


########################################
## 成功绘制出多边形

xx1 <- c(0,0,2,2)
yy1 <- c(0,2,2,0)
xx2 <- c(3.5,3.5,4.5,4.5)
yy2 <- c(3.5,4.5,4.5,3.5)

## x,y表示正方形区域的半径.
plot(3, 3, type="n", xlab="Time", ylab="Distance")

polygon(xx1, yy1,  border = "red")
polygon(xx2, yy2,  border = "red")
title("Distance Between Brownian Motions")


