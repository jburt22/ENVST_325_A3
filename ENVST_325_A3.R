install.packages("dplyr")
install.packages("lubridate")
library(ggplot2)
library(lubridate)
library(dplyr)

datCO2 <- read.csv("/cloud/project/activity03/annual-co-emissions-by-region.csv")
climate_data <- read.csv("/cloud/project/activity03/climate-change.csv")

colnames(datCO2)[4] <- "CO2"

climate_data$Date <- ymd(climate_data$Day)

#--Prompt 1--
North_Climate <- climate_data[climate_data$Entity == "Northern Hemisphere",]
South_Climate <- climate_data[climate_data$Entity == "Southern Hemisphere",]


plot(South_Climate$Date, climate_data$temperature_anomaly)
plot(North_Climate$Date, climate_data$temperature_anomaly)

#Together
ggplot(data = climate_data[climate_data$Entity != "World",],
       aes(x = Date, y = temperature_anomaly, color = Entity)) +
  geom_line()

#--Prompt 2--
USdat <- datCO2[datCO2$Entity =="United States",]
MEdat <- datCO2[datCO2$Entity == "Mexico",]
CANdat <- datCO2[datCO2$Entity == "Canada",]

ggplot(data = USdat, # data for plot
       aes(x = Year, y=CO2 ) )+ # aes, x and y
  geom_point()+ # make points at data point
  geom_line()+ # use lines to connect data points
  labs(x="Year", y=expression(paste("US fossil fuel emissions (tons CO"[2],")"))) # make axis labels

ggplot(data = MEdat, # data for plot
       aes(x = Year, y=CO2 ) )+ # aes, x and y
  geom_point()+ # make points at data point
  geom_line()+ # use lines to connect data points
  labs(x="Year", y="Mexico fossil fuel emissions (tons CO2)") # make axis labels

ggplot(data = CANdat, # data for plot
       aes(x = Year, y=CO2 ) )+ # aes, x and y
  geom_point()+ # make points at data point
  geom_line()+ # use lines to connect data points
  labs(x="Year", y="Canada fossil fuel emissions (tons CO2)") # make axis labels
