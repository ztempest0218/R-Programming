# HW5: UKgas の季節・トレンド分解（手作業）
# stl() / decompose() は使用しない
# wdは各自適宜設定を

# 作業前、メモリーを空にする
rm(list = ls())

library(tidyverse)
library(patchwork)

# 1. UKgas を data.frame に変換
gas <- data.frame(
  t = 1:length(UKgas),
  Y = as.numeric(UKgas)
)

# 2. 2次式のトレンド回帰
#    あらかじめ2乗の列 t2 を作っておき、それを式で使う
gas <- gas %>%
  mutate(t2 = t^2)

reg <- lm(Y ~ t + t2, data = gas)

# 3. トレンドの推定値を trend 列として追加
gas <- gas %>%
  mutate(trend = predict(reg))

# 4. 四半期を表す因子 quarter を追加
#    Q1〜Q4 を27回繰り返す（UKgas は1960〜1986年の27年分）
gas <- gas %>%
  mutate(
    quarter = rep(c("Q1", "Q2", "Q3", "Q4"), times = 27),
    quarter = factor(quarter, levels = c("Q1", "Q2", "Q3", "Q4"))
  )

# 5. 各四半期の Y - trend の平均（4行2列の表）
seasonal_effect <- gas %>%
  group_by(quarter) %>%
  summarise(seasonal = mean(Y - trend))

seasonal_effect

# 6. seasonal_effect を gas に結合して seasonal 列を追加
gas <- gas %>%
  left_join(seasonal_effect, by = "quarter")

# 7. 不規則変動 irregular = Y - trend - seasonal
gas <- gas %>%
  mutate(irregular = Y - trend - seasonal)

# 8. 4成分（元データ・トレンド・季節変動・不規則変動）をまとめてプロット
p1 <- ggplot(gas, aes(t, Y)) +
  geom_line() +
  labs(title = "元データ", y = "Y")

p2 <- ggplot(gas, aes(t, trend)) +
  geom_line(color = "red") +
  labs(title = "トレンド", y = "T")

p3 <- ggplot(gas, aes(t, seasonal)) +
  geom_line(color = "#1B9E77") +
  labs(title = "季節変動", y = "S")

p4 <- ggplot(gas, aes(t, irregular)) +
  geom_line(color = "#7570B3") +
  labs(title = "不規則変動", y = "E")

plot_decomp <- (p1 | p2) / (p3 | p4)

plot_decomp
