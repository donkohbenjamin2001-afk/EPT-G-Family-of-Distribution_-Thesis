# If using the quantile function for a Weibull distribution as an example
Q_weibull <- function(u, alpha, beta, lambda, k) {
  p <- 1 - u * (1 - exp(-alpha))
  
  lambda * (
    -log(
      1 - (
        (-1/alpha) * log(p)
      )^(1/beta)
    )
  )^(1/k)
}

q_values <- c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9)

table_data <- data.frame(
  "Q(u)" = paste0("Q(", q_values, ")"),
  "b" = sapply(q_values, function(u) Q_weibull(u, 0.5, 1, 1, 2)),
  "n" = sapply(q_values, function(u) Q_weibull(u, 1, 1, 1, 1)),
  "m" = sapply(q_values, function(u) Q_weibull(u, 2, 2, 1, 2))
)

print(table_data, row.names = FALSE)
#write.csv(table_data,"EPTW_quantile_table.csv", row.names = FALSE)