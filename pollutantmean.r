## Assignment 1
## R Programming course
## author Jorge Lopez
## PART 1/3

pollutantmean <- function(directory, pollutant, id = 1:332) {
files <- list.files(path=".\\specdata\\", pattern = ".csv") ## creates a vector with all file names in your folder
polmean <- rep(0,length(files))
## cat("min id=", min(id), "max id=", max(id), "\n")
polcolall <- 0
for(i in min(id):max(id)){
   data <- read.csv(paste(".\\", directory, "\\", files[i], sep=""),header=T)
   polcol <- data[pollutant]
   polcol <- polcol[!is.na(polcol)]
   ## cat("id=", i, "\n")
   ## polmean[i] <- mean(polcol)
   ## cat("\nI will append i=", i, "\n")
   polcolall <- append(polcolall, polcol)
   ## cat(polcolall)
   ## cat("\n========================================\n")
    }
## result <- cbind(files,polmean)
cat ("\nResult=", mean(polcolall), "\n")
## write.csv(result,"result_polmeans.csv")
}

pollutantmean("specdata", "sulfate", 1:10)

pollutantmean("specdata", "nitrate", 70:72)

pollutantmean("specdata", "nitrate", 23) 
