library(tidyverse)
library(scales)

plot3 <- read.table('household_power_consumption.txt',
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
    gather(Group, Sub_metering, -(1:5)) %>%
    tibble %>%
    ggplot(aes(x = Date, y = Sub_metering, colour = Group)) +
    geom_path() +
    theme_classic() +
    xlab('Date') +
    ylab('Energy sub metering')

plot3

png(filename = 'plot3.png')
plot3
dev.off()
