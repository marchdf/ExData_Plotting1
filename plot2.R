plot2 <- function() {

    ## Load the dataset using our custom load function
    df <- load_dataset()

    ## Name of the plot
    png('plot2.png')

    ## Make the line plot
    with(df, plot(DateTime,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l"))

    ## Save the plot
    dev.off()
}
