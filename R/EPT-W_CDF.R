#########################################
#    Ploting the CDF of the EPT-W       #
#########################################
library(ggplot2)

# Function
ept_weibull_cdf <- function(x, alpha, beta, lambda, k) {
  rho <- 1 / lambda
  G <- 1 - exp(-(rho * x)^k)
  (1- exp(-alpha * (G)^beta)) / (1 - exp(-alpha))
}

# x range
x <- seq(0, 5, length.out = 20000)

# Build dataset
df <- rbind(
  # 1. Decreasing (k < 1)
  data.frame(x=x, y=ept_weibull_cdf(x,0.8,1.2,1.5,0.7),label="α=0.8, β=1.2, λ=1.5, k=0.7"),
  # 2. Right-skewed unimodal
  data.frame(x=x, y=ept_weibull_cdf(x,1.0,2.0,2.0,2.5),label="α=1.0, β=2.0, λ=2.0, k=2.5"),
  # 3. Moderate bell shape
  #data.frame(x=x, y=ept_weibull_cdf(x,1.5,2.5,2.0,3.5),label="α=1.5, β=2.5, λ=2.0, k=3.5"),
  # 4. Sharp peak (high concentration)
  #data.frame(x=x, y=ept_weibull_cdf(x,2.5,3.0,1.8,5),label="α=2.5, β=3.0, λ=1.8, k=5"),
  # 5. Heavy tail / flatter
  data.frame(x=x, y=ept_weibull_cdf(x,0.6,1.0,2.5,1.5), label="α=0.6, β=1.0, λ=2.5, k=1.5")
)
# Plot
ggplot(df, aes(x=x, y=y, color=label)) +
  geom_line(linewidth=0.8) +
  
  labs(title="",
       x="x", y="F(x)", color=NULL) +
  
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
    legend.position = c(0.75, 0.5),
    legend.background = element_rect(fill = "white", color = "black"),
    legend.key = element_blank(),
    
    # Title styling
    plot.title = element_text(hjust = 0.5)
  )
