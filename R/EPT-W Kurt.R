# ==========================================
# 3D Kurtosis Surface for EPT-Weibull
# Thesis Style using persp()
# ==========================================
#library(plotly)
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
# Bowley Kurtosis Function
# ------------------------------------------

bowley_kurtosis <- function(alpha, beta, lambda, k){
  
  Q1 <- Q_EPTW(1/8, alpha, beta, lambda, k)
  Q2 <- Q_EPTW(2/8, alpha, beta, lambda, k)
  Q3 <- Q_EPTW(3/8, alpha, beta, lambda, k)
  Q5 <- Q_EPTW(5/8, alpha, beta, lambda, k)
  Q6 <- Q_EPTW(6/8, alpha, beta, lambda, k)
  Q7 <- Q_EPTW(7/8, alpha, beta, lambda, k)
  
  kurt <- (Q7 - Q5 + Q3 - Q1) /
    (Q6 - Q2)
  
  return(kurt)
}


# ------------------------------------------
# Fixed Parameters
# ------------------------------------------

alpha  <- 1
lambda <- 2

# ------------------------------------------
# Grid Values
# ------------------------------------------

beta_vals <- seq(1, 5, length = 25)
k_vals    <- seq(1, 5, length = 25)

# ------------------------------------------
# Compute Surface Matrix
# ------------------------------------------

z_matrix <- outer(beta_vals,
                  k_vals,
                  Vectorize(function(beta, k)
                    bowley_kurtosis (alpha,
                                    beta,
                                    lambda,
                                    k)))

# ------------------------------------------
# 3D Perspective Plot
# ------------------------------------------
par(mar = c(1,1,1,1))
persp(
  x = beta_vals,
  y = k_vals,
  z = z_matrix,
  
  theta = 40,
  phi = 25,
  expand = 0.7,
  cex.lab = 0.9,
  cex.axis = 0.7,
  
  
  col = "lightgreen",
  
  shade = 0.005,
  
  ticktype = "detailed",
  
  xlab = "\u03B2",
  ylab = "k",
  zlab = "\u03BA(u)",
  
  main = "",
  
  border = "black"
)
