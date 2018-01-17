pollutantmean <- function(directory, pollutant, id = 1:332) {
  
    ## Generate list of files
    datafiles <- list.files(directory, full.names = TRUE)[id]
  
    ## Generate data frame from files
    pollutants <- read.csv(datafiles[1])
    for(i in datafiles[-1]) {
        df <- read.csv(i)
        pollutants <- rbind(pollutants, df)
    }

    ## Retrieve desired pollutant dataset, filtering out NAs
    pdata <- pollutants[[pollutant]]
    pdata <- pdata[!is.na(pdata)]
    
    ## Return mean of dataset
    mean(pdata)
  
}
