library(RPostgreSQL)
drv <- dbDriver("PostgreSQL")
db <- dbConnect(drv,dbname = "gis_tr",host = "127.0.0.1",port = 5432,user = "zhuoyikang")
q <- "SELECT id, ST_AsText(geom) FROM polygon_2"
datastr <- dbGetQuery(db, q)

polygon_vectorstr <- datastr$st_astext

## 初始化一个空的polygon列表，里面会有多个polygon.
polygon_vector <- c()
finalx <- c()
finaly <- c()
i <- 1
for(polygonstr in polygon_vectorstr) {
  line_data <- substr(polygonstr, 10, nchar(polygonstr)-2)
  line_array <- strsplit(line_data, ",")
  ## 转变为向量.
  line_array <- unlist(line_array)
  cx <- c()
  cy <- c()
  lineLength = length(line_array)
  for(pointstr in line_array) {
    pointstrarray = strsplit(pointstr, " ")
    pointstrarray <- unlist(pointstrarray)
    cx <- c(cx, as.numeric(pointstrarray[1]))
    cy <- c(cy, as.numeric(pointstrarray[2]))

    finalx <- c(finalx, as.numeric(pointstrarray[1]))
    finaly <- c(finaly, as.numeric(pointstrarray[2]))
  }
  data <- data.frame(seq(1,lineLength,1),cx,cy)
  polygon_vector <- c(polygon_vector,cx,cy)
}
plot(finalx,finaly)

##########################################

polygon_vectorstr <- datastr$st_astext

## 初始化一个空的polygon列表，里面会有多个polygon.

i <- 1
for(polygonstr in polygon_vectorstr) {
  line_data <- substr(polygonstr, 10, nchar(polygonstr)-2)
  line_array <- strsplit(line_data, ",")
  ## 转变为向量.
  line_array <- unlist(line_array)
  cx <- c()
  cy <- c()
  lineLength = length(line_array)
  for(pointstr in line_array) {
    pointstrarray = strsplit(pointstr, " ")
    pointstrarray <- unlist(pointstrarray)
    cx <- c(cx, as.numeric(pointstrarray[1]))
    cy <- c(cy, as.numeric(pointstrarray[2]))
  }
  polygon(cx, cy,  border = "red")
}


viewX <-c(1.5, 1.5, 2.5, 2.5, 1.5)
viewY <-c(2.5, 3.5, 3.5, 2.5, 2.5)
polygon(viewX, viewY,  border = "green")
