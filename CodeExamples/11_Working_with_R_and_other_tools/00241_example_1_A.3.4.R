# example:1_A.3.4 
# example:1 : Working with R and other tools : Using databases with R : An example SQL data transformation task 
# Title: 
                                        Loading an Excel spreadsheet 


                                        Loading an Excel spreadsheet
                                        library(gdata)
bookings <- read.xls('Workbook1.xlsx',sheet=1,pattern='date',
   stringsAsFactors=F,as.is=T)
prices <- read.xls('Workbook1.xlsx',sheet=2,pattern='date',
   stringsAsFactors=F,as.is=T)

