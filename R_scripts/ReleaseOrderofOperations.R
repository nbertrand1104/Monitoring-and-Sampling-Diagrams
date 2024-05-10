library(tidyverse)
library(dplyr)
library(treemap)
library(data.tree)
library(DiagrammeR)
library(igraph)
library(networkD3)
library(collapsibleTree)
library(readr)
library(DiagrammeRsvg)
library(rsvg)



library(readr)
samflow <- read_csv("C:/Users/nbertrand/Desktop/Bertrand/DeltaSmelt/DSM_Supplementation/ERTT/Monitoring Subteam/MonitoringDiagramR/ReleaseOrderofOperations.csv")


#"\n" is added to the original data to create a line breaks for each node
samflow$pathString <- paste( samflow$Preparation,samflow$Transport, samflow$ReleaseType, samflow$Carboy, samflow$Vehicle,
                            samflow$Drive, samflow$Boat, samflow$Launch,samflow$BoatDelivery, samflow$Deposition, samflow$Acclimation, samflow$Conclusion, sep = "/")

samflow1 <- as.Node(samflow)
#SetGraphStyle(samflow1, rankdir = "LR")
SetEdgeStyle(samflow1, arrowhead = "vee", color = "black", penwidth = 3, dir = "front")
#per default, Node style attributes will be inherited:
SetNodeStyle(samflow1, style = "filled,rounded", shape = "box",fontcolor = "Black", fillcolor = "white", 
             fontname = "helvetica", tooltip = GetDefaultTooltip)
#inheritance can be avoided:




plot(samflow1)

