corr <- function(directory, threshold = 0) {
    
    ## Using complete.R to determine files above threshold
    freq <- complete(directory)
    ids_above_threshold <- freq[freq$nobs > threshold, ]$id
    
    ## Generate list of files
    datafiles <- list.files(directory, full.names = TRUE)[ids_above_threshold]
    
    ## Create results numeric vector
    corrs <- numeric()
    
    ## Generate data frame from files
    for(i in datafiles) {
        df <- read.csv(i)
        correlation <- cor(df$nitrate, df$sulfate, use = "complete.obs")
        corrs <- c(corrs, correlation)
    }
    
    ## Return result vector
    corrs
    
}