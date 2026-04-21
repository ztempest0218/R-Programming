df <- data.frame(
  gender = factor(c("Male", "Female", "Female", "Male")),   # 名義尺度
  satisfaction = factor(c("Low", "Medium", "High", "Medium"), 
                        ordered = TRUE, 
                        levels = c("Low", "Medium", "High")), # 順序尺度
  workers = c(10, 15, 8, 20),   # 離散変数
  height = c(170.5, 160.2, 158.3, 180.1) # 連続変数
)

str(df)

df2 <- data.frame(
  logical_var = c(TRUE, FALSE, TRUE, FALSE),  # Logical
  
  integer_var = c(1L, 2L, 3L, 4L),            # Integer
  
  double_var = c(1.5, 2.3, 3.7, 4.1),         # Double
  
  complex_var = c(1+2i, 2+3i, 3+4i, 4+5i),    # Complex
  
  character_var = c("A", "B", "C", "D"),      # Character
  
  factor_nominal = factor(c("Male", "Female", "Female", "Male")), # 順序なし
  
  factor_ordinal = factor(
    c("Low", "Medium", "High", "Medium"),
    levels = c("Low", "Medium", "High"),
    ordered = TRUE
  ),                                          # 順序あり
  
  date_var = as.Date(c("2024-01-01", "2024-01-02", 
                       "2024-01-03", "2024-01-04")) # Date
)

str(df2)

x1 <- c(1L,2L,3L)
str(x1)

x2 <- c(1,2,3)
str(x2)


height_group <- factor(c("低", "中", "高"), 
                       ordered = TRUE,
                       levels = c("低", "中", "高"))
str(height_group)

factor_nominal <- factor(c("Male", "Female", "Female", "Male"))
logical_var <- factor_nominal == "Male"
str(logical_var)

data(mtcars)
head(mtcars)
model <- lm(mpg ~ wt, data = mtcars)

summary(model)
predict(model)
plot(model)
