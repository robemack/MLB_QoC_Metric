# This is a simple script used for proof of concept of calculation.
# For applied use, this script would be turned into a function.

# Loads data frame with Batter vs. Pitcher (change for specific user)
load("/Users/robertmackowiak/Desktop/BattingData.Rdata")

#Indicate which player you are interested in, change for different results
#Players used in example data = 'Jose Altuve'/'Aaron Judge'
player <- c('Jose Altuve')

#Identify league average ERA
leagueAverageERA <- 4.05
 
#Finds player info within data frame "data"
batter_index <- which(data == player, arr.ind = TRUE)
batter_index <- batter_index[,1]

#Creates placeholder QoC variable
QoC_raw <- data.frame(0)

#Finds weighted ERAs
for (i in 1:length(batter_index)){
  QoC_raw[i] <- data[batter_index[i],2]/sum(data[batter_index,2])*data[batter_index[i],4]
}

# Calculates QoC relative to league average, to be used for further analysis
QoC <- leagueAverageERA/sum(QoC_raw)

print(QoC)