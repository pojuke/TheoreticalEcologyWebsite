library(tidyverse)
library(gganimate)

rs <- seq(1.8, 3.0, by = 0.01) %>% set_names()
K <- 500
time <- 300

pop_data <- map_dfr(rs, .id = "r", .f = function(x) {
  pop_size <- numeric(time)
  pop_size[1] <- 100
  log_fun <- function(r, N) {N + r*N*(1-N/K)}

  for (i in 2:time) {
    pop_size[i] <- log_fun(x, pop_size[i - 1])
  }
  
  pop_size <- as.data.frame(pop_size) %>%
    tail(250) %>%
    filter(pop_size > 0) %>%
    unique()
  
  return(pop_size)
})

p <- pop_data %>% 
  mutate(r = as.numeric(r)) %>%
  ggplot(aes(x = r, y = pop_size, color = as.factor(r))) + 
  geom_point(aes(group = seq_along(r)), show.legend = F) + 
  theme_void() + 
  scale_color_manual(values = rainbow(length(unique(pop_data$r)), 
                                      start = 0.95, 
                                      end = 0.94)) + 
  transition_reveal(r)

anim_save("bifurcation.gif", p, height = 5, width = 10, units = "in", res = 600, fps = 15)

