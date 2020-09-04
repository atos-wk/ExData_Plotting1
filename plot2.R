library(tidyverse)
library(scales)

plot2 <- read.table('household_power_consumption.txt',
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
    tibble %>%
    ggplot(aes(x = Date, y = Global_active_power)) +
    geom_path() +
    theme_classic() +
    ggtitle('Global Active Power') +
    xlab('Date') +
    ylab('Global Active Power (kilowatts)')

plot2

png(filename = 'plot2.png')
plot2
dev.off()
