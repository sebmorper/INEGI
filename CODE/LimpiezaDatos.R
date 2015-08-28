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

data$date <- seq(as.Date("2005/01/01"), as.Date("2015/06/01"), "months")

desocupada <- data


##