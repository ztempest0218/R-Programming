# 3回目の課題はすべてHW3.Rに書いてください。
# 各自のパソコンでは setwd() の設定が必要になる場合があります。
# ただし、local環境と採点サーバーではパスが異なるため、
# setwd() を残したまま提出すると、採点時にエラーになって、0点になります。
#
# HW3のフォルダーを working directory に設定してください。
# 提出前には、必ず setwd() をコメントアウトするか削除してください。

# setwd(...)


# 作業前、メモリーを空にする
rm(list = ls())


# working directory 設定
#setwd(".../hw3-data-manipulation-modified-xxxxxx")

# environment 初期化
rm(list = ls())

# package 読み込み 
library(tidyverse)

# データ読み込み
# 相対パスを使ってください。絶対パスはサーバー上エラーがでます。
raw <- readRDS("./SSDSE.rds")


#1 
df1 <- raw %>%
  select(
    year       = SSDSE.B.2026,
    code       = Code,
    prefecture = Prefecture,
    pop        = A1101,
    university = E6102,
    highschool = E4101,
    juniorhigh = E3101,
    elementary = E2101
  )

#2 
df2 <- df1 %>%
  filter(year >= 2018)

#3 
tohoku <- c("R02000", "R03000", "R04000", "R05000", "R06000", "R07000")

df3 <- df2 %>%
  filter(code %in% tohoku)

#4
df4 <- df3 %>%
  mutate(
    elementary_rate = elementary / pop * 100000,
    juniorhigh_rate = juniorhigh / pop * 100000,
    highschool_rate = highschool / pop * 100000,
    university_rate = university / pop * 100000
  )

#5
df5 <- df4 %>%
  group_by(prefecture) %>%
  summarise(
    elementary_mean = mean(elementary_rate),
    juniorhigh_mean = mean(juniorhigh_rate),
    highschool_mean = mean(highschool_rate),
    university_mean = mean(university_rate),
  )

#6 
df6 <- df4 %>%
  group_by(prefecture) %>%
  summarise(
    elementary_total = sum(elementary),
    juniorhigh_total = sum(juniorhigh),
    highschool_total = sum(highschool),
    university_total = sum(university),
  )

#7 
rank_df <- df5 %>%
  arrange(desc(university_mean))






