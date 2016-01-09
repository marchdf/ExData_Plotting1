plot1 <- function() {

    ## Load the dataset using our custom load function
    df <- load_dataset()

    ## Make the plot
    png('plot1.png')
    hist(df$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
    dev.off()
}


