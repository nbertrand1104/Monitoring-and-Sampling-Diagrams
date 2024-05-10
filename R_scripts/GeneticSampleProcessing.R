#GeneticSampleProcessing.R----

# Nick Bertrand
# Start Date: Apr 29 2024

#About----
#Project:Delta Smelt genetic Sample Processing  flow chart visualization 
#Purpose: Illustrate the processing of Delta Smelt samples by various genetics labs

#Libraries ----
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

# Set working directory ----
#set to location of root object to highest tier directory
getwd()
root <- "C:/Users/nbertrand/OneDrive - DOI/Desktop/Bertrand/GitHub/MonitoringDiagramR"
setwd(root)
getwd()

#these root object use directories 
data_root<-file.path(root,"Data")
code_root <- file.path(root,"R_scripts")
table_output_root <- file.path(root,"Table_Output")
viz_output_root <- file.path(root,"Viz_Output")


#Import Data ----
samflow <- read_csv(file.path(data_root,"GeneticSampleProcessing.csv"))



#samflow <- read_csv("C:/Users/nbertrand/Desktop/Bertrand/DeltaSmelt/DSM_Supplementation/ERTT/Monitoring Subteam/MonitoringDiagramR/SampleProcessing.csv")
#View(SampleProcessing)

#"\n" is added to the original data to create a line breaks for each node
samflow$pathString <- paste(samflow$`Delta Smelt`,
                            samflow$Delivery,
                            samflow$Stage,
                            samflow$Preservation, 
                            samflow$Laboratory, 
                            samflow$Action, 
                            samflow$Dissection,
                            samflow$Collection, 
                            samflow$Transfer,
                            samflow$Evaluate, sep = "/")

samflow1 <- as.Node(samflow)
SetGraphStyle(samflow1, rankdir = "LR")
SetEdgeStyle(samflow1, arrowhead = "vee", color = "black", penwidth = 3, dir = "front")
#per default, Node style attributes will be inherited:
SetNodeStyle(samflow1, style = "filled,rounded", shape = "box",fontcolor = "Black", fillcolor = "white", 
             fontname = "helvetica", tooltip = GetDefaultTooltip)
#inheritance can be avoided:

plot(samflow1)
