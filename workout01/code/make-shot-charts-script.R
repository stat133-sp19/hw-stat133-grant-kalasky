# Title: Shots Data Visualizations
# Description: 
#   
# Inputs: The following .csv files of game data from 5 GSW players
#   - ../data/andre-iguodala.csv
#   - ../data/draymond-green.csv
#   - ../data/kevin-durant.csv
#   - ../data/klay-thompson.csv
#   - ../data/stephen-curry.csv
# Ouputs: 
#   - firstname-lastname-shot-chart.pdf (5 pdf files of shot charts for each player)
#   
#   

# Load packages needed for visualizations
library(jpeg)
library(grid)
library(ggplot2)

# Load data to be used for visualizations
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)

# load court image
court_file <- "../images/nba-court.jpg"

# create raste object
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
)

# Creating shot charts
iguodala_shot_chart <- ggplot(data=iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Andre Iguodala (2016 Season)") +
  theme_minimal()

green_shot_chart <- ggplot(data=green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Draymond Green (2016 Season)") +
  theme_minimal()

durant_shot_chart <- ggplot(data=durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Kevin Durant (2016 Season)") +
  theme_minimal()

thompson_shot_chart <- ggplot(data=thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Klay Thompson (2016 Season)") +
  theme_minimal()

curry_shot_chart <- ggplot(data=curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Stephen Curry (2016 Season)") +
  theme_minimal()


# 4.1) Exporting charts to pdf files
pdf(file = "../images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
print(iguodala_shot_chart)
dev.off()

pdf(file = "../images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
print(green_shot_chart)
dev.off()

pdf(file = "../images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
print(durant_shot_chart)
dev.off()

pdf(file = "../images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
print(thompson_shot_chart)
dev.off()

pdf(file = "../images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
print(curry_shot_chart)
dev.off()



# 4.2 Create a faceted chart of all players' shot charts

# Load in shots-dataframe 
shots_data <- read.csv(file = '../data/shots-data.csv', stringsAsFactors = FALSE)

facetted_shot_chart <- ggplot(data=shots_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Charts: GSW (2016 Season)") +
  facet_wrap(~ name) +
  theme_minimal()
  
pdf(file = "../images/gsw-shots-charts.pdf", width = 8, height = 7)
print(facetted_shot_chart)
dev.off()

png(filename = "../images/gsw-shots-charts.png", width = 8, height = 7, units = "in", res=180)
print(facetted_shot_chart)
dev.off()
