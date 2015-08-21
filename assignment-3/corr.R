corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
###############################################
  
  ## pollutantmean <- function(directory, pollutant, id = 1:332) {
    nitrate <- "nitrate"
    sulfate <- "sulfate"
    
    files <- list.files(path=".\\specdata\\", pattern = ".csv") ## creates a vector with all file names in your folder
         
    
    R <- 0
    
    for(i in 1:length(files)){
      ##cat("in for i threshold", i, "/n")
      data <- read.csv(paste(".\\", directory, "\\", files[i], sep=""),header=T)
      nitrate_col <- data[nitrate]
      sulfate_col <- data[sulfate]
      
      nitrate_col <- nitrate_col[!is.na(nitrate_col)]
      sulfate_col <- sulfate_col[!is.na(sulfate_col)]
      
      v_nitrate_complete <- 0
      v_sulfate_complete <- 0
      CountComplete <- 0
      
      for(i_numrow in 1:nrow(data)){ ## assumming that data is NOT EMPTY!!
        
        if (!is.na(data[i_numrow,2]) & !is.na(data[i_numrow,3])){
            v_nitrate_complete <- append(v_nitrate_complete, data[i_numrow,2])
            v_sulfate_complete <- append(v_sulfate_complete, data[i_numrow,3])
            CountComplete <- CountComplete + 1
        }
    
      } ## for i_numrow
      if (CountComplete > threshold){
          ##cat ("\nResult=", "nobs=", CountComplete, cor(v_sulfate_complete, v_nitrate_complete), "\n")
          R  <- append(R,cor(v_sulfate_complete, v_nitrate_complete))
        
        } ## end CountComplete
    } ## end for i
    R <- R[-1] #removes the first element in the list    
    return(R) 
}## end function


R <- corr("specdata", 150)
head(R)
summary(R)

R <- corr("specdata", 400)
head(R)
summary(R)

R <- corr("specdata", 5000)
head(R)
summary(R)

R <- corr("specdata")
head(R)
summary(R)
