complete <- function(directory, id = 1:332) {

    ## Generate list of files
    datafiles <- list.files(directory, full.names = TRUE)[id]
  
    ## Generate data frame from files
    obs <- read.csv(datafiles[1])
    for(i in datafiles[-1]) {
        df <- read.csv(i)
        obs <- rbind(obs, df)
    }
    
    ## Filter by complete cases, then convert to a factor
    ccs <- complete.cases(obs)
    obs <- obs[ccs, ]
    id_factor <- factor(obs$ID, levels = as.character(id))
    freq_table <- table(id_factor)

    ## Convert frequency table to a data frame
    frequency <- as.data.frame(freq_table)
    colnames(frequency) <- c("id", "nobs")
    
    ## Return frequency table
    frequency
}