df1 <- data.frame(X= c("A, B", "A, B, C", "A", "A, C"))

library(tidyverse)

df2 <- df1 %>% 
  mutate(row_num = 1:n()) %>% 
  separate_rows(X) %>% 
  spread(X, 1) %>% 
  select(-row_num) %>% 
  mutate_all(~ifelse(!is.na(.), 'Yes', 'No'))

df1 %>%
  mutate(id = row_number()) %>% 
  separate_rows(X) %>% 
  group_by(id) %>% 
  mutate(Y = "Yes") %>% 
  spread(X, Y, fill = "No")

df1
        X
1    A, B
2 A, B, C
3       A
4    A, C

A    B    C
Yes  Yes  No
Yes  Yes  Yes
Yes  No   No
Yes  No   Yes