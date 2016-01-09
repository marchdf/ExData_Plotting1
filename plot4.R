plot4 <- function() {

    ## Load the dataset using our custom load function
    df <- load_dataset()

    ## Name of the plot
    png('plot4.png')

    ## Make the line plot
    par(mfrow = c(2, 2))
    with(df, {

        ## First plot
        plot(DateTime,Global_active_power,xlab="",ylab="Global Active Power",type="l")

        ## Second plot
        plot(DateTime,Voltage,type="l",xlab="datetime",ylab="Voltage")
        
        ## Third plot
        plot(DateTime,Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",col="black")
        lines(DateTime,Sub_metering_2,col="red")
        lines(DateTime,Sub_metering_3,col="blue")
        legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")

        ## Fourth plot
        plot(DateTime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
    })
    
    ## Save the plot
    dev.off()
}
