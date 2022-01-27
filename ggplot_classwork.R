library(tidyverse)

(mauna <- tsibble::as_tsibble(co2) |> 
  rename(month = index, conc = value))

ggplot(mauna) + 
  aes(x = month, y = conc ) +
  geom_line()+
  tsibble::scale_x_yearmonth()


ggplot(palmerpenguins::penguins) +
  aes(x = body_mass_g, y = bill_depth_mm) + 
  geom_point(aes(color = species)) + 
  geom_smooth(method = "lm")


ggplot(palmerpenguins::penguins) +
  aes(x = body_mass_g, y = bill_depth_mm, color = species) + 
  geom_point() + 
  geom_smooth(method = "lm")
p<- mauna 

p <- ggplot(mauna) + 
  aes(x = month, y = conc ) +
  geom_line()+
  tsibble::scale_x_yearmonth()
p + 
  geom_smooth(color = "darkgreen")

ggplot(gapminder) +
  aes(x = gdpPercap, y = lifeExp) +
  geom_point(alpha = 0.1)

ggplot(cars) +
  aes(x = speed, y = dist) + 
  geom_point(color = "blue")



