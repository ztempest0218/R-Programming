# 一回目の課題はすべてHW1.Rに書いてください。
# メモすした場合、#マークを入力すること
# ❌ これ全部削除
# setwd(...)
# source(...)

#作業前、メモリーを空にする
rm(list = ls())

# 1
X <- log(10)
print(X)

# 2
cio <- 888^35
print(cio)

# 3
x <- c(1, 2, 3, 4, 5)
str(x)

# 4
name <- c("A", "B", "C")
print(name)

# 5
d <- c(1, "A", TRUE)
str(d)

# 6 oオブジェクトに保存されなくても正解
o <- x[3]
print(o)

# 7
y <- x * 2

# 8
z <- x[x > 3]

# 9 xには要素が五つで、2行の行列にすることはできないが、Rに自動充填されている
A <- matrix(x, nrow = 2)
print(A)

# 10
f <- function(x) {
  x^2
}

f(5)
