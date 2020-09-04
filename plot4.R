library(tidyverse)
library(scales)

data <- read.table('household_power_consumption.txt',
           sep = ';',
           header = TRUE,
           colClass =  c('character',
                         'character',
                         'numeric',
                         'numeric',
                         'numeric',
                         'numeric',
                         'numeric',
                         'numeric',
                         'numeric'),
           na.strings = '?') %>%
    filter(Date %in% c('1/2/2007','2/2/2007')) %>%
    mutate(Date = as.POSIXct(paste(Date, Time), format = '%d/%m/%Y %H:%M:%OS')) %>%
    select(-Time) %>%
    tibble

p1 <- data %>%
    ggplot(aes(x = Date ,y = Global_active_power)) +
    geom_path() +
    theme_classic() +
    xlab('Date') +
    ylab('Global Active Power (kilowatts)')


p2 <- data %>%
    ggplot(aes(x = Date, y = Voltage)) +
    geom_path() +
    theme_classic() +
    xlab('Date') +
    ylab('Voltage')

p3 <- data %>%
    gather(Group, Sub_metering, -(1:5)) %>%
    ggplot(aes(x = Date, y = Sub_metering, colour = Group)) +
    geom_path() +
    theme_classic() +
    xlab('Date') +
    ylab('Energy sub metering')


p4 <- data %>%
    ggplot(aes(x = Date, y = Global_reactive_power)) +
    geom_path() +
    theme_classic() +
    xlab('Date') +
    ylab('Global reactive power')

grid.arrange(p1, p2, p3, p4,ncol=2)

png(filename = 'plot4.png')
grid.arrange(p1, p2, p3, p4,ncol=2)
dev.off()
