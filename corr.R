corr <- function(directory, threshold = 0) {
    
    ## Using complete.R to determine files above threshold
    freq <- complete(directory)
    ids_above_threshold <- freq[freq$nobs > threshold, ]$id
    
    ## Generate list of files
    datafiles <- list.files(directory, full.names = TRUE)[ids_above_threshold]
    
    ## Generate data frame from files
    pollutants <- read.csv(datafiles[1])
    for(i in datafiles[-1]) {
        df <- read.csv(i)
        pollutants <- rbind(pollutants, df)
    }
    pollutants <- pollutants[complete.cases(pollutants), ]
    
    ## Find correlation between nitrate (x) and sulfate (y)
    correlations <- aggregate.data.frame(
        pollutants, 
        by = list(station = pollutants$ID, correlation = c(pollutants$nitrate, pollutants$sulfate)),
        FUN = cor
    )
    correlations    
    
}