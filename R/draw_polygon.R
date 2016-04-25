library(RPostgreSQL)
db <- dbConnect(drv,dbname = "gis_tr",host = "127.0.0.1",port = 5432,user = "zhuoyikang")
q <- "SELECT id, ST_AsText(geom) FROM polygon_1"
data <- dbGetQuery(db, q)

polygon_vectorstr <- data$st_astext

## 初始化一个空的polygon列表，里面会有多个polygon.
polygon_vector <- c()
for(polygonstr in polygon_vectorstr) {
  line_data <- substr(s, 10, nchar(s)-2)
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
  data <- data.frame(seq(1,lineLength,1),cx,cy)
  polygon_vector <- c(polygon_vector,data)
}
