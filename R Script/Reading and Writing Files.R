
tx_dat <- read.table("C:/R_class/Data/data1.txt",header= TRUE, sep = "-")
tx_dat

tx_dat1 <-read.table("C:/R_class/Data/data2.txt",header =TRUE, sep = ":")
tx_dat1


tx_dat2 <-read.table("C:/R_class/Data/data3.txt",header =TRUE, sep = "/")
tx_dat2

tx_dat3 <-read.table("C:/R_class/Data/tips_text.txt",header =TRUE, sep = "\t")
tx_dat3



#Read csv file

dat <- read.csv("C:/R_class/Data/data4.csv", header = TRUE)

dat1 <- read.csv("C:/R_class/Data/data5.csv", header = FALSE)

dat1 <- read.csv("C:/R_class/Data/data5.csv", header = FALSE,col.names = c("s.n","Name","Age","Adress"))
# or
colnames(dat1) <- colnames(dat)

# Reading excel file

# we need package to read excle file
# readxl,readxlsx, read_excle
## install.packages("readxl")
library(readxl)

sample_date <- read_excel("C:/R_class/Data/sampleData1.xlsx",sheet = 2,col_names = TRUE)
View(sample_date)

sample_date <- read_excel("C:/R_class/Data/sampleData1.xlsx",
                          sheet = 2, 
                          range = "A1:G44",
                          col_names = TRUE)
View(sample_date)

sample_date1 <- read_excel("C:/R_class/Data/sampleData1.xlsx",
                           sheet = 3, 
                           range = "A1:G44",
                           col_names = FALSE)
colnames(sample_date1) <- colnames(sample_date)
View(sample_date)


## Now writing files in different way

write.table(df2,"C:/R_class/Data/written_text.txt",sep = "\t" )

write.table(df2,"c:/R_class/Data/written_csv.csv",row.names = FALSE)

## install.packages("openxlsx")

library(openxlsx)

# Create a workbook

wb <- createWorkbook()

# add sheets

addWorksheet(wb,"data1")
writeData(wb,"data1",df)

addWorksheet(wb,"data2")
writeData(wb,"data2",df1)

addWorksheet(wb, "sample_date")
writeData(wb,"sample_date",sample_date)

saveWorkbook(wb = wb, "C:/R_class/Data/wb.xlsx", overwrite = TRUE)


