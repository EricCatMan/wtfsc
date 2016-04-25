## 从Shp文件中绘制地图代码
##
library(maptools)
mydat = readShapePoly("../mat/china_map/bou2_4p.shp")
plot(mydat)

polygon(c(0.2,0.8,0.7,0.1),c(0.3,0.5,0.8,0.7));
