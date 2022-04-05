library(gapminder)
library(tidyverse)


(gap_asia_2007 <- gapminder |> filter(year == 2007, continent == "Asia"))

write_csv(gap_asia_2007, "exported_file.csv")

write_csv(gap_asia_2007, 
          here::here("participation", "data", "gap_asia_2007.csv")
)

dat <- read_csv(here::here("dat", "gap_asia_2007.csv"))
