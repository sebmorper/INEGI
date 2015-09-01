##--------------------------Limpieza de Datos-----------------------------

#read files

## ./RAW/Poblacion
path <- "./RAW/Poblacion"
temp <- paste(path,list.files(path, pattern = ".csv"), sep = "/")
myfiles <- sapply(temp, read.csv)
data <- data.frame(matrix(unlist(myfiles), nrow = 136))[11:136,]
cols <- seq(from = 2, to = length(data), by = 2)
data <- data[,cols]

names <- gsub(path, "", temp)
names <- gsub("/", "", names)
names <- gsub(".csv", "", names)
names(data) <- tolower(names)

data <- data.frame(sapply(data, function(x){x <- as.numeric(paste(x))}))

data$date <- seq(as.Date("2005/01/01"), as.Date("2015/06/01"), "months")

poblacion <- data


## ./RAW/Poblacion/PoblacionOcupada
path <- "./RAW/Poblacion/PoblacionOcupada"
temp <- paste(path,list.files(path, pattern = ".csv"), sep = "/")
myfiles <- sapply(temp, read.csv)
data <- data.frame(matrix(unlist(myfiles), nrow = 136))[11:136,]
cols <- seq(from = 2, to = length(data), by = 2)
data <- data[,cols]

names <- gsub(path, "", temp)
names <- gsub("/", "", names)
names <- gsub(".csv", "", names)
names(data) <- tolower(names)

data <- data.frame(sapply(data, function(x){x <- as.numeric(paste(x))}))

data$date <- seq(as.Date("2005/01/01"), as.Date("2015/06/01"), "months")

ocupada <- data


## ./RAW/Poblacion/PoblacionDesocupada
path <- "./RAW/Poblacion/PoblacionDesocupada"
temp <- paste(path,list.files(path, pattern = ".csv"), sep = "/")
myfiles <- sapply(temp, read.csv)
data <- data.frame(matrix(unlist(myfiles), nrow = 136))[11:136,]
cols <- seq(from = 2, to = length(data), by = 2)
data <- data[,cols]

names <- gsub(path, "", temp)
names <- gsub("/", "", names)
names <- gsub(".csv", "", names)
names(data) <- tolower(names)

data <- data.frame(sapply(data, function(x){x <- as.numeric(paste(x))}))

data$date <- seq(as.Date("2005/01/01"), as.Date("2015/07/01"), "months")

desocupada <- data


## ./RAW/BalanzaComercial
path <- "./RAW/BalanzaComercial"
temp <- paste(path,list.files(path, pattern = ".csv"), sep = "/")
myfiles <- sapply(temp, read.csv)
data <- data.frame(matrix(unlist(myfiles), nrow = 305))[11:305,]
cols <- seq(from = 2, to = length(data), by = 2)
data <- data[,cols]

names <- gsub(path, "", temp)
names <- gsub("/", "", names)
names <- gsub(".csv", "", names)
names(data) <- tolower(names)

data <- data.frame(sapply(data, function(x){x <- as.numeric(paste(x))}))

data$date <- seq(as.Date("1991/01/01"), as.Date("2015/07/01"), "months")

balanzaComercial <- data


## ./RAW/FinancieroBursatil
path <- "./RAW/FinancieroBursatil"

dolarcomprabancaria <- read.csv(paste(path, "DolarCompraBancaria.csv", sep = "/"), sep = ",")[17:370,]
dolarcomprainterbancaria <- read.csv(paste(path, "DolarCompraInterbancaria.csv", sep = "/"), sep = ",")[10:363,]
dolarventabancaria <- read.csv(paste(path, "DolarVentaBancaria.csv", sep = "/"), sep = ",")[17:370,]
dolarventainterbancaria <- read.csv(paste(path, "DolarVentaInterbancaria.csv", sep = "/"), sep = ",")[10:363,]
dolarData <- data.frame(dolarcomprabancaria, dolarcomprainterbancaria,
                        dolarventabancaria, dolarventainterbancaria)
dolarData <- dolarData[,c(2,4,6,8)]
names(dolarData) <- c("comprabancaria", "comprainterbancaria",
                      "ventabancaria", "ventainterbancaria")
rm(dolarcomprabancaria, dolarcomprainterbancaria, dolarventabancaria, dolarventainterbancaria)
dolarData$date <- seq(as.Date("1986/02/01"), as.Date("2015/07/01"), "months")


interesdepositoahorro <- read.csv(paste(path, "InteresDepositoAhorro.csv", sep = "/"), sep = ",")[34:303,]
interesnominalcanada <- read.csv(paste(path, "InteresNominalCanada.csv", sep = "/"), sep = ",")[10:279,]
interesnominalcorea <- read.csv(paste(path, "InteresNominalCorea.csv", sep = "/"), sep = ",")[10:279,]
interesnominalmexico <- read.csv(paste(path, "InteresNominalMexico.csv", sep = "/"), sep = ",")[10:279,]
interesnominalusa <- read.csv(paste(path, "InteresNominalUSA.csv", sep = "/"), sep = ",")[10:279,]
interesData <- data.frame(interesdepositoahorro, interesnominalcanada,
                          interesnominalcorea, interesnominalmexico,
                          interesnominalusa)
interesData <- interesData[,c(2,4,6,8,10)]
names(interesData) <- c("deposito", "canada", "corea", "mexico", "usa")
rm(interesdepositoahorro, interesnominalcanada, interesnominalcorea, interesnominalmexico, interesnominalusa)
interesData$date <- seq(as.Date("1993/01/01"), as.Date("2015/06/01"), "months")


ipcmaximo <- read.csv(paste(path, "IPCMaximo.csv", sep = "/"), sep = ",")[9:312,]
ipcminimo <- read.csv(paste(path, "IPCMaximo.csv", sep = "/"), sep = ",")[9:312,]
ipcData <- data.frame(ipcmaximo, ipcminimo)
ipcData <- ipcData[,c(2,4)]
names(ipcData) <- c("maximo", "minimo")
rm(ipcmaximo, ipcminimo)
ipcData$date <- seq(as.Date("1990/04/01"), as.Date("2015/07/01"), "months")


## ./RAW/FinanzasPublicas
path <- "./RAW/FinanzasPublicas"
gastos <- read.csv(paste(path, "Gastos.csv", sep = "/"), sep = ",")[59:409,]
ingresos <- read.csv(paste(path, "Ingresos.csv", sep = "/"), sep = ",")[11:361,]
finanzaspublicas <- data.frame(gastos, ingresos)
finanzaspublicas <- finanzaspublicas[,c(2,4)]
names(finanzaspublicas) <- c("gastos","ingresos")
finanzaspublicas$date <- seq(as.Date("1986/01/01"), as.Date("2015/03/01"), "months")
rm(gastos, ingresos)


## ./RAW/IndicadoresInternacionales
path <- "./RAW/IndicadoresInternacionales"
petroleo <- read.csv(paste(path, "PetroleoMexico.csv", sep = "/"))[129:398,]
produccionindustrial <- read.csv(paste(path, "IndiceProduccionIndustrialMexico.csv", sep = "/"))[10:279,]
indicadoresInternacionales <- data.frame(petroleo, produccionindustrial)
indicadoresInternacionales <- indicadoresInternacionales[,c(2,4)]
names(indicadoresInternacionales) <- c("petroleo", "produccionindustrial")
indicadoresInternacionales$date <- seq(as.Date("1993/01/01"), as.Date("2015/06/01"), "month")
rm(petroleo, produccionindustrial)
