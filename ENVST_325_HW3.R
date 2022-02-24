library(ggplot2)
library(lubridate)
library(dplyr)
library(patchwork)

datCO2 <- read.csv("/cloud/project/activity03/annual-co-emissions-by-region.csv")
climate_data <- read.csv("/cloud/project/activity03/climate-change.csv")
colnames(datCO2)[4] <- "CO2"

climate_data$Date <- ymd(climate_data$Day)

#--Q1--
table(datCO2$Entity)
NA_data <- datCO2[datCO2$Entity == "United States" |
                    datCO2$Entity == "Mexico" |
                    datCO2$Entity == "Canada", ]

ggplot(data = NA_data, aes(x= Year, y = CO2, color = Entity)) +
  geom_line() + 
  labs(x = "Year", y="Annual emissions (tons CO2)", 
       title = "Annual Emissions across North America")

#--Q2--
CO2_plot <-ggplot(data = datCO2[datCO2$Entity == "World",],
       aes(x= Year, y = CO2)) +
  geom_line() + 
  labs(x = "Year", y="Annual emissions (tons CO2)",
       title = "World CO2 Emissions")

climate_plot <-ggplot(data = climate_data, aes(x= Date, y = temperature_anomaly)) +
  geom_line() + 
  labs(x = "Year", y="Temperature Anomalies", 
       title = "Temperature Anomalies across the World")
       
CO2_plot + climate_plot

#--Q3--
green_gas <- read.csv("/cloud/project/greenhouse_gas_data.csv")

methane <- green_gas[green_gas$POL == "CH4" &
                       green_gas$Variable == "Total  emissions excluding LULUCF" &
                       (green_gas$Country == "United States" |
                       green_gas$Country == "Mexico" |
                       green_gas$Country == "Canada"), ]


ggplot(data = methane, aes(x = Year, y = Value, color = Country)) +
  geom_line() + 
  labs(x = "Year", y = "Tonnes of CO2 equivalent",
       title = "North American Methane Emissions by Country")
