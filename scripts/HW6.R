rm(list = ls())

# 1
squares <- numeric(10)

for (i in 1:10) {
  squares[i] <- i^2
}

# 2
money <- 100
goal  <- 180
year  <- 0

while (money <= goal) {
  money <- money * 1.04
  year  <- year + 1
}

# 3
cum   <- numeric(20)
total <- 0

for (i in 1:20) {
  total  <- total + i
  cum[i] <- total
}

# 4
sales <- c(120, 135, 128, 150, 163, 158, 171, 185, 190, 204)

growth    <- numeric(10)
growth[1] <- NA               # 初年度はlagとることができない

for (i in 2:10) {
  growth[i] <- (sales[i] - sales[i - 1]) / sales[i - 1] * 100
}

# 5
scores <- c(62, 71, NA, 55, 80, NA, 90, 45, NA, 58)

n_na   <- 0
n_over <- 0

for (i in 1:10) {
  if (is.na(scores[i])) {
    n_na <- n_na + 1
    next                      # NAならこの回は飛ばして次へ
  }
  if (scores[i] >= 60) {
    n_over <- n_over + 1
  }
}
