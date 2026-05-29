library(ggplot2)

# Function
ept_weibull_hf <- function(x, alpha, beta, lambda, k) {
  rho <- 1 / lambda
  G <- 1 - exp(-(rho * x)^k)
  g <- k * rho * (rho * x)^(k - 1) * exp(-(rho * x)^k)
  f <- (alpha * beta * g * (G)^(beta - 1) * exp(-alpha * (G)^beta)) 
  S <- (exp(-alpha*(G)^beta) - exp(-alpha)) 
  (f / S)
}

# x range
x <- seq(0, 5, length.out = 200000)

# Dataset
df <- rbind(
  data.frame(x=x, y=ept_weibull_hf(x,4,3,3,2), label="α=4, β=3, λ=3, k=2"),
  data.frame(x=x, y=ept_weibull_hf(x,2,2,2,0.95), label="α=2, β=2, λ=2, k=0.95"),
  data.frame(x=x, y=ept_weibull_hf(x,3,2,1,1), label="α=3, β=2, λ=1, k=1"),
  data.frame(x=x, y=ept_weibull_hf(x,1.5,2.6,1,1), label="α=1.5, β=2.6, λ=1, k=1")
  #data.frame(x=x, y=ept_weibull_hf(x,1,1,2,1), label="α=1, β=1, λ=2, k=1")
)

# Plot
ggplot(df, aes(x=x, y=y, color=label)) +
  geom_line(linewidth=0.8) +
  
  labs(title="",
       x="x", y="h(x)", color=NULL) +
  
  # Use a softer color palette similar to base R
  scale_color_manual(values = c("black", "red", "blue", "orange", "green")) +
  
  theme(
    # Light grey background like your image
    panel.background = element_rect(fill = "#ffffff", color = "black"),
    plot.background  = element_rect(fill = "#ffffff", color = NA),
    
    # Remove grid
    panel.grid = element_blank(),
    
    # Axis styling
    axis.line = element_line(color = "black"),
    axis.ticks = element_line(color = "black"),
    
    # Legend inside with box
    legend.position = c(0.75, 0.42),
    legend.background = element_rect(fill = "white", color = "black"),
    legend.key = element_blank(),
    
    # Title styling
    plot.title = element_text(hjust = 0.5)
  )