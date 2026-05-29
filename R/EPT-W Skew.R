# ==========================================
# 3D Skewness Surface for EPT-Weibull
# Thesis Style using persp()
# ==========================================
library(plotly)
# ------------------------------------------
# EPT-Weibull Quantile Function
# ------------------------------------------

Q_EPTW <- function(u, alpha, beta, lambda, k){
  
  rho <- 1/lambda
  
  term <- (-1/alpha) *
    log(1 - u*(1 - exp(-alpha)))
  
  q <- (1/rho) *
    (-log(1 - (term)^(1/beta)))^(1/k)
  
  return(q)
}

# ------------------------------------------
# Galton Skewness
# ------------------------------------------

galton_skewness <- function(alpha, beta, lambda, k){
  
  Q1 <- Q_EPTW(0.25, alpha, beta, lambda, k)
  Q2 <- Q_EPTW(0.50, alpha, beta, lambda, k)
  Q3 <- Q_EPTW(0.75, alpha, beta, lambda, k)
  
  skew <- (Q3 + Q1 - 2*Q2) /
    (Q3 - Q1)
  
  return(skew)
}

# ------------------------------------------
# Fixed Parameters
# ------------------------------------------

alpha  <- 1
lambda <- 2

# ------------------------------------------
# Grid Values
# ------------------------------------------

beta_vals <- seq(1, 5, length = 80)
k_vals    <- seq(1, 5, length = 80)

# ------------------------------------------
# Compute Surface Matrix
# ------------------------------------------

z_matrix <- outer(beta_vals,
                  k_vals,
                  Vectorize(function(beta, k)
                    galton_skewness(alpha,
                                    beta,
                                    lambda,
                                    k)))

# ------------------------------------------
# 3D Perspective Plot
# ------------------------------------------
par(pty = "s")
par(mar = c(1,1,1,1))
persp(
  x = beta_vals,
  y = k_vals,
  z = z_matrix,
  
  theta = 135,
  phi = 13,
  expand = 0.7,
  cex.lab = 0.9,
  cex.axis = 0.7,
 
  
  col = "lightblue",
  
  shade = 0.005,
  
  ticktype = "detailed",
  
  xlab = "\u03B2",
  ylab = "k",
  zlab = "\u03B3(u)",
  
  main = "",
  
  border = "black"
)
