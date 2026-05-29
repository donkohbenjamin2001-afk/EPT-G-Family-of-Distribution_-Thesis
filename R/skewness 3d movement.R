# ==========================================
# 3D Plot of Skewness and Kurtosis
# for the EPT-Weibull Distribution
# Varying beta and k
# ==========================================

# Install packages if necessary
#install.packages("plotly")

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
# Galton Skewness Function
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
lambda <- 1

# ------------------------------------------
# Vary beta and k
# ------------------------------------------

beta_vals <- seq(0.5, 5, length.out = 50)
k_vals    <- seq(0.5, 5, length.out = 50)

# Create matrices
skew_matrix <- matrix(0,
                      nrow = length(beta_vals),
                      ncol = length(k_vals))

kurt_matrix <- matrix(0,
                      nrow = length(beta_vals),
                      ncol = length(k_vals))

# ------------------------------------------
# Compute Values
# ------------------------------------------

for(i in 1:length(beta_vals)){
  
  for(j in 1:length(k_vals)){
    
    skew_matrix[i,j] <-
      galton_skewness(alpha,
                      beta_vals[i],
                      lambda,
                      k_vals[j])
    
    kurt_matrix[i,j] <-
      bowley_kurtosis(alpha,
                      beta_vals[i],
                      lambda,
                      k_vals[j])
  }
}

# ==========================================
# 3D SKEWNESS SURFACE
# ==========================================

plot_ly(
  x = beta_vals,
  y = k_vals,
  z = skew_matrix
) %>%
  
  add_surface() %>%
  
  layout(
    title = "3D Surface Plot of Galton Skewness",
    scene = list(
      xaxis = list(title = "beta"),
      yaxis = list(title = "k"),
      zaxis = list(title = "Skewness")
    )
  )

# ==========================================
# 3D KURTOSIS SURFACE
# ==========================================

plot_ly(
  x = beta_vals,
  y = k_vals,
  z = kurt_matrix
) %>%
  
  add_surface() %>%
  
  layout(
    title = "3D Surface Plot of Bowley Kurtosis",
    scene = list(
      xaxis = list(title = "beta"),
      yaxis = list(title = "k"),
      zaxis = list(title = "Kurtosis")
    )
  )