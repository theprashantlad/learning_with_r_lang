rm(list=ls())
library(dplyr)
library(hflights)

## Manipulate variables

# 2.

hflights <- tbl_df(hflights)
hflights

head(hflights)
g <- select(hflights, ActualElapsedTime, AirTime, ArrDelay, DepDelay)

g[1,]

# 3.

select(hflights, Origin:Cancelled)

# 4.

a <- colnames(hflights)
a

select(hflights, Year:DayOfWeek, ArrDelay:Diverted)
select(hflights, c(Year:DayOfWeek, ArrDelay:Diverted))
select(hflights, c(1:4, 12:21))
select(hflights, -c(5:11))

# 6.

select(hflights, UniqueCarrier, 
       ends_with("Num"),
       starts_with("Cancel"))

# 7.

f <- mutate(hflights, GroundTimes = TaxiIn + TaxiOut)

# 8

"a" %in% c("b", "a", "c")

f1 <- filter(hflights, Distance > 3000)

# 9.

filter(hflights, TaxiIn + TaxiOut > AirTime)

## OR

filter(f, GroundTimes > AirTime)

# 10.

filter(hflights, DayOfWeek > 5 & Cancelled == 1)

filter(hflights, DayOfWeek %in% c(6,7), Cancelled == 1)

# 11.

arrange(hflights, desc(UniqueCarrier), desc(DepDelay))

# 12.

arrange(hflights, DepDelay + ArrDelay)

# 13.
colnames(hflights)
g <- filter(hflights, Dest == "DFW", DepTime < 800)
arrange(g, desc(AirTime))

## OR

arrange(filter(hflights, Dest == "DFW", DepTime < 800), desc(AirTime))

## OR

hflights %>%
  filter(Dest == "DFW", DepTime < 800) %>%
  arrange(desc(AirTime))

# 14.

summarise(hflights, min_dist = min(Distance), max_dist = max(Distance))

## OR

hflights %>%
  summarize(min_dist = min(Distance), max_dist = max(Distance))

#15.

summarize(filter(hflights, Diverted == "1"), max_dist = max(Distance))

## OR

hflights %>%
  filter(Diverted == "1") %>%
  summarize(max_dist = max(Distance))

# 16.

hflights %>%
  summarise(n_obs = n(),
            n_carriers = n_distinct(UniqueCarrier),
            n_dest = n_distinct(Dest),
            dest100 = nth(Dest,100))

#17.

p <- hflights %>%
  mutate(diff = TaxiOut - TaxiIn) %>%
  filter(diff != "NA") %>%
  summarise(avg = mean(diff))

#18.

hflights %>%
  select(Dest, UniqueCarrier, Distance, ActualElapsedTime) %>%
  mutate(RealTime = ActualElapsedTime + 100)

# 19.

hflights %>%
  group_by(UniqueCarrier) %>%
  summarize(n_flights = n(),
            n_canc = sum(Cancelled == 1),
            avg_delay = mean(ArrDelay, na.rm =T)) %>%
  arrange(avg_delay, n_canc)
