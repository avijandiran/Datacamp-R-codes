
library(gapminder)

library(dplyr)

gapminder

#################  Filter verb

gapminder %>%
  filter(year ==2007 )



gapminder %>%
  filter(country == "United States")


gapminder %>%
  filter(year ==2007,country == "United States")



###################### Arrange Verb

gapminder %>%
 arrange(gdpPercap)  

gapminder %>%
  arrange(desc(gdpPercap))


gapminder %>%
  filter(year ==2007 ) %>%
  arrange(desc(gdpPercap))


###################### mutate Verb



gapminder %>%
  mutate(pop = pop/100000)



gapminder %>%
  mutate(gdp = gdpPercap * pop)



gapminder %>% 
  mutate(gdp = gdpPercap * pop) %>% 
  filter(year ==2007 ) %>% 
  arrange(desc(gdpPercap))




#************** ggplot2 

library(ggplot2)


gapminder_2007 <- gapminder %>%
  filter(year ==2007 )

ggplot(gapminder_2007,aes(x=gdpPercap, y=lifeExp , color= continent , size=pop))+
  geom_point()+
  scale_x_log10()+
  scale_y_log10()+
  facet_wrap(~continent)


ggplot(gapminder_1952,aes(x=pop, y=lifeExp))+
  geom_point()+
  scale_x_log10()+
  facet_wrap(~continent)


ggplot(gapminder_1952,aes(x=pop, y=lifeExp, color = continent, size= pop))+
  geom_point()+
  scale_x_log10()+
  facet_wrap(~ year)



#********** summarize verb


gapminder %>%
  filter(year ==2007 ) %>%
  summarize(meanLifeExp = mean(lifeExp))




gapminder %>%
  filter(year ==2007 ) %>%
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(as.numeric(pop)))



gapminder %>%
  filter(year == 1957 ) %>%
  summarize(medianLifeExp = median(lifeExp))




gapminder %>%
  filter(year == 1957 ) %>%
  summarize(medianLifeExp = median(lifeExp),
            maxGdpPercap= max( gdpPercap))

#************group by


gapminder %>%
  group_by(year) %>%
  summarize(medianLifeExp = median(lifeExp),
            maxGdpPercap= max( gdpPercap))


gapminder %>%
  filter(year ==2007 ) %>%
  group_by( continent) %>%
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(as.numeric(pop)))

gapminder %>%
  group_by(continent, year) %>%
  summarize(medianLifeExp = median(lifeExp),
            maxGdpPercap= max( gdpPercap))






by_year <- gapminder %>%
  group_by(year) %>%
  summarize(medianLifeExp = median(lifeExp),
            maxGdpPercap= max( gdpPercap))

totalPop <- sum(gapminder$pop)


ggplot(by_year ,aes(x= year, y=totalPop, color= continent))+
  geom_point()+
    expand_limits(y=0)
 

ggplot(by_year ,aes(x= year, y=totalPop, color= continent))+
  geom_point()+
  expand_limits(y=0)

# Summarize medianGdpPercap within each continent within each year: by_year_continent

by_year_continent<- gapminder %>%
  group_by(continent,year) %>%
  summarize(medianGdpPercap =median(gdpPercap))

# Plot the change in medianGdpPercap in each continent over time
ggplot(by_year_continent, aes(x= year, y= medianGdpPercap, color= continent))+
  geom_point()+
  expand_limits(y=0)


# Summarize the median GDP and median life expectancy per continent in 2007
by_continent_2007 <- gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(medianGdpPercap = median(gdpPercap),
            medianLifeExp = median(lifeExp))

# Use a scatter plot to compare the median GDP and median life expectancy
ggplot(by_continent_2007, aes(x = medianGdpPercap, y = medianLifeExp, color = continent)) +
  geom_point()


# Summarize the median gdpPercap by year and continent in 1952
by_continent <- gapminder %>%
  filter(year == 1952) %>%
  group_by(continent) %>%
  summarize(medianGdpPercap = median(gdpPercap))

# Create a bar plot showing medianGdp by continent
ggplot(by_continent, aes(x = continent, y = medianGdpPercap)) +
  geom_col()

# Filter for observations in the Oceania continent in 1952

oceania_1952 <- gapminder %>%
  filter(continent == "Oceania",year== 1952) 


# Create a bar plot of gdpPercap by country

ggplot(oceania_1952, aes(x=country , y=gdpPercap))+
  geom_col()




gapminder_1952 <- gapminder %>%
  filter(year == 1952) %>%
  mutate(pop_by_mil = pop / 1000000)

# Create a histogram of population (pop_by_mil)

ggplot(gapminder_1952, aes(x=pop_by_mil))+
  geom_histogram(bins=50)




ggplot(gapminder_1952, aes(x=pop))+
  geom_histogram(bins=50)+
  scale_x_log10()


# Create a boxplot comparing gdpPercap among continents

ggplot(gapminder_1952, aes(x=continent , y=gdpPercap))+
  geom_boxplot()+
  scale_y_log10()


ggplot(gapminder_1952, aes(x = continent, y = gdpPercap)) +
  geom_boxplot() +
  scale_y_log10() +
  ggtitle("Comparing GDP per capita across continents")





