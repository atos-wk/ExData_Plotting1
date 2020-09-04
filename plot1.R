library(tidyverse)

plot1 <- read.table('household_power_consumption.txt',
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
    ggplot(aes(Global_active_power)) +
    geom_histogram(fill = 'red', color = 'white') +
    theme_classic() +
    ggtitle('Global Active Power') +
    xlab('Global Active Power (kilowatts)') +
    ylab('Frequency')

plot1

png(filename = 'plot1.png')
plot1
dev.off()
