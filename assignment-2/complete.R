complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  CountComplete <- 0
  CountObs <- 0
  
  files <- list.files(path=".\\specdata\\", pattern = ".csv") ## creates a vector with all file names i
  ## before for(i_numfile in min(id):max(id)){
  result <- matrix(nrow=length(id), ncol=2)
  for(i_numfile in id){
    ##cat("id is", id, "\n")
    data <- read.csv(paste(".\\", directory, "\\", files[i_numfile], sep=""),header=T)
    CountObs = CountObs + 1
    for(i_numrow in 1:nrow(data)){ ## assumming that data is NOT EMPTY!!
      ## cat("in i_numrow for", i_numrow, "\n"comp)
      if (!is.na(data[i_numrow,2]) & !is.na(data[i_numrow,3]))
      {CountComplete <- CountComplete + 1}
    } ## for i_numrow
    
    ##cat ("\nResult=", CountObs, i_numfile, CountComplete, "\n")
    
    ## df_result <- data.frame(id=i_numfile, nobs=CountComplete)
    result[CountObs,1] <- i_numfile
    result[CountObs,2] <- CountComplete
    
    CountComplete <- 0
    
  } ## for i_numfile
  
  colnames(result) <- c("id","nobs")
  data.frame(result) 
  
} ## end function

complete("specdata",3:7)
