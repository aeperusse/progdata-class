
install.packages("psychTools")
library(dplyr)
library(tidyverse)
library(ggplot2)
library(psychTools)

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
         (A1, "6" = 1, "5" = 2, "4" = 3, "3" = 4, "2" = 5, "1" = 6) |>
  select(A1, A1r)) |> 
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

#to apply the same function to multiple different rows.
dat_bfi |>
  mutate(across
         (all_of(reversed), 
           \(x) recode(x, "6" = 1, "5" = 2, "4" = 3, "3" = 4, "2" = 5, "1" = 6),
           .names = "{.col}r"
         )) |>
  head()

#rowwise- treat every row of data as its own separate group
dat_bfi |>
  rowwise() |> 
  mutate(
    .id = .id,
    A_total = mean(c_across(A1:A5), na.rm = TRUE),
    C_total = mean(c_across(C1:C5), na.rm = TRUE),
    E_total = mean(c_across(E1:E5), na.rm = TRUE),
    N_total = mean(c_across(N1:N5), na.rm = TRUE),
    O_total = mean(c_across(O1:O5), na.rm = TRUE),
    .before = everything()
  ) |>
  ungroup()|>
  head()
