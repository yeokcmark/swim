pacman::p_load(tidyverse, lubridate, SwimmeR)

df <-read_results("SNAG2024 seniors.pdf")
data <- swim_parse(df, splits = T, split_length = 50)
events <-unique(data$Event) %>% as_tibble()

data %>% # map function returns list. map_dbl returns double
  map_dbl(., # take everything from above
          function(x)
          {sum(is.na(x = x) # is.na() t == 1, F ==0
          ) # x is like an arbitary name, a placeholder.. you can put anything there
          }
  )
br_200_1314 <-
  data %>% 
  filter(Event == "Boys 13-14 200 LC Meter Breaststroke")

br_200_1314$Event %>% 
  unique() %>% 
  str_split_i(., " ", 3) 

data_nosplit <- 
  swim_parse(df)

data_nosplit %>% 
  group_by(Event) %>% 
  slice_min(n=3, order_by = Place) %>% 
  DT::datatable()
