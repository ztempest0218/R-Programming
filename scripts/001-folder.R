# 作業ディレクトリを設定（適宜変更）
setwd("~/Desktop") #Mac
# setwd("C:/Users/ユーザー名/Desktop") #Windows

library(fs)

dir.create("./project3/data/raw", recursive = TRUE)
dir.create("./project3/data/clean", recursive = TRUE)
dir.create("./project3/script", recursive = TRUE)
dir.create("./project3/output/tables", recursive = TRUE)
dir.create("./project3/output/figures", recursive = TRUE)

setwd("~/Desktop/project2") #Mac
#setwd("C:/Users/ユーザー名/Desktop/project2") #Windows


dir_tree()