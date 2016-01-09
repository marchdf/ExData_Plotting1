plot1 <- function() {

    ## Load the dataset using our custom load function
    df <- load_dataset()

    ## Name of the plot
    png('plot1.png')

    ## Make the histogram
    hist(df$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

    ## Save the plot
    dev.off()
}
