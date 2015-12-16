################# Read data ###########################
## xlsReadWrite包中的write.xls函数，可以保存为xls格式的
## library(XLConnect)
Sys.setenv(JAVA_HOME='C:\\Program Files (x86)\\Java\\jre1.8.0_45') # for 64-bit version
## Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_31') # for 64-bit version
## C:\Program Files\Java\jre1.8.0_31
library(rJava)
library(xlsx)
## library(xlsx) just try the following:
## Does it work? Done!!
## Be careful, check the file name every time when you want to use this procedure to mearge data sets.
## #######################################################
## file1 is the file that need to be merged. file2 is the whole dataset. mergeID is the merge ID.

MergerXLSX <- function(file1, file2, mergeID){
    data1 <- read.xlsx2(file1, 1)
    data2 <- read.xlsx2(file2, 1)
    sub.list <- split(file1, rownames(file1))

    consolida <- function(row){
        eachID <- row$mergeID
        pos <- match(as.character(eachID), data2$mergeID)
        ## matched <- demo[demo$Shoe_Tower_Session_UserID == as.character(sesoID),1:6]
        return(cbind(row,data2[pos,]))
    }

    results <- lapply(sub.list,consolida)
}
## Need to be test!!
## #######################################################

submitters <- read.xlsx2("Y:/PH.D/PSU/Part-time job/MOOC/Attempts/1278samples_Ques(test).xlsx", 1)
head(submitters)

Ques <- read.xlsx2("Y:/PH.D/PSU/Part-time job/MOOC/Attempts/Questions.xlsx", 1)
head(Ques)

sub.list <- split(submitters, rownames(submitters))
length(sub.list)
sub.list[1]

consolida <- function(row){
    sesoID <- row$Coursera_UserID
    pos <- match(as.character(sesoID), Ques$Coursera_UserID)
    ## matched <- demo[demo$Shoe_Tower_Session_UserID == as.character(sesoID),1:6]
    return(cbind(row,Ques[pos,]))
}

results <- lapply(sub.list,consolida)
length(results$'1')
length(results)
results$'2'

is.list(results)
combined <- do.call(rbind.data.frame, results)
combined[1:2,]
#######################################################
## save file ##
write.xlsx2(x = combined, file = "Y:/PH.D/PSU/Part-time job/MOOC/Attempts/ST437samples_Ques.xlsx",sheetName = "submitter", row.names = FALSE)

