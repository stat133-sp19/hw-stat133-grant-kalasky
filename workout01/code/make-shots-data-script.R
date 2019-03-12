# Title: Shots Data Preparation
# Description: 
#   This script loads 5 different dataframes for each of the 5 GSW players. We then conduct some
#   data manipulation. We add 2 columns: name (name of the player) and minute
#   (minute of the game the player took a shot). We also modified the values of the shot_made_flag
#   column. 
#   We then ouput the summaries of each of the dataframes, combine the dataframes into a single
#   shots-data dataframe. 
# Inputs: The following .csv files of game data from 5 GSW players
#   - ../data/andre-iguodala.csv
#   - ../data/draymond-green.csv
#   - ../data/kevin-durant.csv
#   - ../data/klay-thompson.csv
#   - ../data/stephen-curry.csv
# Ouputs: 
#   - text-file summaries of the 5 players shot data in /output with format firstname-lastname-summary.txt 
#   - shots-data.csv, a .csv file containing shot data of all 5 GSW players
#   - summary of shots-data.csv in /output 


# Read in 5 datasets
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)

# Add column names of players to each dataset
iguodala$name = "Andre Iguodala"
green$name = "Draymond Green"
durant$name = "Kevin Durant"
thompson$name = "Klay Thompson"
curry$name = "Stephen Curry"

# Change values of shot_made_flag
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] <- "shot_yes"
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] <- "shot_no"

green$shot_made_flag[green$shot_made_flag == 'y'] <- "shot_yes"
green$shot_made_flag[green$shot_made_flag == 'n'] <- "shot_no"

durant$shot_made_flag[durant$shot_made_flag == 'y'] <- "shot_yes"
durant$shot_made_flag[durant$shot_made_flag == 'n'] <- "shot_no"

thompson$shot_made_flag[thompson$shot_made_flag == 'y'] <- "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] <- "shot_no"

curry$shot_made_flag[curry$shot_made_flag == 'y'] <- "shot_yes"
curry$shot_made_flag[curry$shot_made_flag == 'n'] <- "shot_no"

# Add column minute that contains minute number where shot occurred
iguodala$minute <- (iguodala$period * 12) - iguodala$minutes_remaining
green$minute <- (green$period * 12) - green$minutes_remaining
durant$minute <- (durant$period * 12) - durant$minutes_remaining
thompson$minute <- (thompson$period * 12) - thompson$minutes_remaining
curry$minute <- (curry$period * 12) - curry$minutes_remaining

# Send summary output of dataframes to text-files
sink(file = "../output/andre-iguodala-summary.txt")
print(summary(iguodala))
sink()

sink(file = "../output/draymond-green-summary.txt")
print(summary(green))
sink()

sink(file = "../output/kevin-durant-summary.txt")
print(summary(durant))
sink()

sink(file = "../output/klay-thompson-summary.txt")
print(summary(thompson))
sink()

sink(file = "../output/stephen-curry-summary.txt", type="output")
print(summary(curry))
sink()

# Stack all dataframes into a single table
shot_data <- rbind(iguodala, green, durant, thompson, curry)

# Write assembled table as a CSV file
write.csv(
  x = shot_data,
  file = "../data/shots-data.csv"
)

# Send summary of assembled table to text file
sink(file = "../output/shots-data-summary.txt")
print(summary(shot_data))
sink()
