
install.packages("psychTools")
library(dplyr)
library(tidyverse)
library(ggplot2)

dat_bfi <- psychTools::bfi |>
  rownames_to_column(var = ".id")|>
  as_tibble()


dat_bfi |>
  mutate(gender = recode(gender, "1" = "man,", "2" = "woman")) |>
  
 dat_bfi |>
  mutate(education = recode(education, "1" = "HS", "2" = "HS", .default = "More than HS") |>
           select(.id, gender, education) |>
           head()
add1 <- function(x) x + 1

dat_bfi |>
  group_by(gender) |>
  summarize(
    across(
      A1:A5,
      list(
        mean = \(x) mean(x, na.rm = TRUE),
        sd = \(x) sd(x, na.rm = TRUE)
      )
    )
  )
dat_bfi |>
  mutate(A1r = recode
         ( A1, "6" = 1, "5" = 2, "4" = 3, "3" = 4, "2" = 5, "1" = 6) |>
  select(A1, A1r) |> 
  head()

#or

dat_bfi |>
  mutate(A1r = max(A1, na.rm = TRUE) - A1 + min(A1, na.rm = TRUE)) |>
  select(A1, A1r) |> 
  head()


reversed <- c("A1", "C4", "C5", "E1", "E2", "O2", "O5")

# or

dict <- psychTools::bfi.dictionary |>
  as_tibble(rownames = "item")

reversed <- dict |>
  filter(Keying == -1) |>
  pull(item)

dat_bfi |>
  mutate(across
         (all_of(reversed), 
           \(x) recode(x, "6" = 1, "5" = 2, "4" = 3, "3" = 4, "2" = 5, "1" = 6),
           .names = "{.col}r"
         )) |>
  head()


