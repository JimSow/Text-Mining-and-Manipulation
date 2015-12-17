source(file = MergerXLSX.R, local = T)

outfile <- MergerXLSX(original_file = "submitter.xlsx", addin_file = "Demo.xlsx", mergeID = "Coursera_UserID")

length(outfile[,1])
head(outfile)
write.xlsx2(x = outfile, file = "MergerTest.xlsx", sheetName = "submitter", row.names = FALSE)


library(utils)

l = c("MergerXLSX", "HtmltoXLSX", "VariableExtract")

package.skeleton(name = "DataClean", l, environment = .GlobalEnv, path = "Y:\\PH.D\\Fields\\R_packages\\DataClean\\")

