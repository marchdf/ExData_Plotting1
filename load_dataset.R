load_dataset <- function() {

    ## Load libraries
    library(tidyr)
    library(dplyr)    
    
    ##================================================================================
    ##
    ## Load the dataset (only take the two days that we are interested
    ## in 2007-02-01 and 2007-02-02)
    ##
    ##================================================================================
    fname <- "household_power_consumption.txt"
    date_format <- '%d/%m/%Y'

    ## These are the dates of interest
    interest <- c("1/2/2007","2/2/2007")
    
    ## open a connection, use cut for first field and use sep=;
    con <- pipe(paste("cut -f1 -d';' ",fname))
    
    ## Scan the connection and save the first column
    dates <- scan(con,skip=1,what=vector('character'))
    
    ## Get index matching the date of interests
    idx <- which(dates %in% interest)

    ## determine the number of lines to skip and the number of rows to
    ## read
    num_skip <- min(idx) 
    num_rows <- max(idx) - min(idx)

    ## Read the data
    df <- read.table(fname,skip=num_skip,nrows=num_rows,sep=";")
    header <- read.table(fname, nrows = 1, sep =';', stringsAsFactors = FALSE)
    colnames(df) <- unlist(header)    

    ## Combine the date and time columns and transform to date-time format
    df <- df %>% unite(DateTime,Date,Time,sep=" ")
    df$DateTime <- strptime(df$DateTime , "%d/%m/%Y %H:%M:%S")

    ## close the connection
    close(con)

    return(df)
}


