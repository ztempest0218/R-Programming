# 2回目の課題はすべてHW2.Rに書いてください。
# メモすした場合、#マークを入力すること
# ❌ これ全部削除
# setwd(...)
# source(...)


# 作業前、メモリーを空にする
rm(list = ls())

# 1
df3 <- data.frame(
  id = c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L),
  
  name = c("田中", "佐藤", "鈴木", "高橋", "伊藤", "山本", "中村", "小林", "加藤", "吉田"),
  
  gender = c("男", "女", "男", "女", "男", "女", "男", "女", "男", "女"),
  
  age = c(20, 21, 19, 22, 20, 21, 23, 20, 22, 21),
  
  score = c(85, 72, 90, 65, 78, 88, 92, 70, 60, 95),
  
  department = c("営業", "人事", "開発", "営業", "開発", "人事", "開発", "営業", "人事", "開発"),
  
  salary = c(3000000, 2800000, 4000000, 2500000, 3500000, 3200000, 4500000, 2700000, 2400000, 5000000)
)

str(df3) #データ型をチェック

# 2
df3$salary_new <- df3$salary * 1.10

print(df3)

# 3 複雑な関数を使わない方法、ほかifelseなどいろいろ作成方法がある
df3$high_score <- 0

df3$high_score[df3$score >= 80] <- 1

print(df3)

# 4 
df_high <- df3[df3$score >= 80, ]

print(df_high)

# 5
df_dev <- df3[df3$department == "開発", ]

print(df_dev)

#6
mean_score <- mean(df3$score)

print(mean_score)

#7 複雑な関数を使わない方法、ほかifelseなどいろいろ作成方法がある
df3$salary_final <- df3$salary_new # 80未満はそのまま

df3$salary_final[df3$high_score == 1] <- df3$salary_new[df3$high_score == 1] * 1.05 # 80以上は昇給

print(df3)