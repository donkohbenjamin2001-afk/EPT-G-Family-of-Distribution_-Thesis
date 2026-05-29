library(ggplot2)

# Function
ept_weibull_SF <- function(x, alpha, beta, lambda, k) {
  rho <- 1 / lambda
  G <- 1 - exp(-(rho * x)^k)
  g <- k * rho * (rho * x)^(k - 1) * exp(-(rho * x)^k)
  (exp(-alpha*(G)^beta) - exp(-alpha)) / (1 - exp(-alpha))
}

# x range
x <- seq(0, 5, length.out = 20000)

# Build dataset
df <- rbind(
  data.frame(x=x, y=ept_weibull_SF(x,1,2,0.9,1.5), label="α=1, β=2, λ=0.9, k=1.5"),
  data.frame(x=x, y=ept_weibull_SF(x,3,2,1,3.2),   label="α=3, β=2, λ=1, k=3.2"),
  data.frame(x=x, y=ept_weibull_SF(x,0.7,0.2,0.7,0.5), label="α=0.7, β=0.2, λ=0.7, k=0.5"),
  data.frame(x=x, y=ept_weibull_SF(x,0.7,1,0.7,0.8), label="α=0.7, β=1, λ=0.7, k=0.8")
)

# Plot
ggplot(df, aes(x=x, y=y, color=label)) +
  geom_line(linewidth=0.8) +
  
  labs(title="",
       x="x", y="S(x)", color=NULL) +
  
  # Use a softer color palette similar to base R
  scale_color_manual(values = c("black", "red", "blue", "orange")) +
  
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
    legend.position = c(0.75, 0.75),
    legend.background = element_rect(fill = "white", color = "black"),
    legend.key = element_blank(),
    
    # Title styling
    plot.title = element_text(hjust = 0.5)
  )