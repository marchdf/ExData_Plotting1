plot3 <- function() {

    ## Load the dataset using our custom load function
    df <- load_dataset()

    ## Name of the plot
    png('plot3.png')

    ## Make the line plot
    with(df, plot(DateTime,Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",col="black"))
    with(df, lines(DateTime,Sub_metering_2,col="red"))
    with(df, lines(DateTime,Sub_metering_3,col="blue"))
    legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

    ## Save the plot
    dev.off()
}
