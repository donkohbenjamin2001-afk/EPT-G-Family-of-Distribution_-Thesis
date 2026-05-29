####################################
#           Ploting the PDF        #
####################################
library(ggplot2)

# Function
ept_weibull_pdf <- function(x, alpha, beta, lambda, k) {
  rho <- 1 / lambda
  G <- 1 - exp(-(rho * x)^k)
  g <- k * rho * (rho * x)^(k - 1) * exp(-(rho * x)^k)
  (alpha * beta * g * (G)^(beta - 1) * exp(-alpha * (G)^beta)) / (1 - exp(-alpha))
}

# x range
x <- seq(0, 5, length.out = 20000)

# Dataset
df <- rbind(
  data.frame(x=x, y=ept_weibull_pdf(x,0.58,0.65,1.6,3), label="α=0.58, β=0.65, λ=1.6, k=3"),
  data.frame(x=x, y=ept_weibull_pdf(x,3,5,2,2), label="α=1.2, β=2.1, λ=2.05, k=3"),
  data.frame(x=x, y=ept_weibull_pdf(x,1.2,0.4,2,3.1), label="α=3, β=4, λ=1.95, k=3"),
  data.frame(x=x, y=ept_weibull_pdf(x,0.5,0.5,2,2), label="α=1.1, β=2.05, λ=2.02, k=5")
)

# Plot
ggplot(df, aes(x=x, y=y, color=label)) +
  geom_line(linewidth=0.8) +
  
  labs(title="EPT-Weibull PDF",
       x="x", y="f(x)", color=NULL) +
  
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
    legend.position = c(0.75, 0.75),
    legend.background = element_rect(fill = "white", color = "black"),
    legend.key = element_blank(),
    
    # Title styling
    plot.title = element_text(hjust = 0.5)
  )