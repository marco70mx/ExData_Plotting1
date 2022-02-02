#plot1.R
## Carga de la tabla en (hpower)
hpower <-  read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Dar formato a la fecha somo se solicita

hpower$Date <- as.Date(t$Date, "%d/%m/%Y")

## Filtrar datos a la fecha de busqueda
hpower <- subset(hpower,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Quitar datos incompletos
hpower <- hpower[complete.cases(hpower),]

## Establecer la fecha y el vector
dateTime <- paste(hpower$Date, hpower$Time)
dateTime <- setNames(dateTime, "DateTime")

## Formatear las fechas
hpower <- hpower[ ,!(names(hpower) %in% c("Date","Time"))]
hpower <- cbind(dateTime, hpower)
hpower$dateTime <- as.POSIXct(dateTime)


# Crear la grafica
hist(hpower$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

##Crear el archivo png
#dev.copy(png,"plot1.png", width=480, height=480)
#dev.off()

