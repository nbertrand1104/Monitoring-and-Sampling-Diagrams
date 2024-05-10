#SampleFlowChart.R----

# Nick Bertrand
# Start Date: Fri Apr 12 15:01:58 2024

#About----
#Project:Delta Smelt Sample flow chart visualization 
#Purpose: Illustrate the collection of Detla Smelt samlples by the surveys

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
samflow <- read_csv(file.path(data_root,"Samples_no_larval.csv"))
#View(samflow)


#"\n" is added to the original data to create a line breaks for each node
samflow$pathString <- paste("Delta Smelt Monitoring",samflow$Collecting.Agency,samflow$Months, samflow$Survey.ID, 
                            samflow$Life.Stage, samflow$Field.Fixative,samflow$Recipient.COC, sep = "/")

samflow1 <- as.Node(samflow)
SetGraphStyle(samflow1, rankdir = "LR")
SetEdgeStyle(samflow1, arrowhead = "vee", color = "black", penwidth = 3, dir = "front")
#per default, Node style attributes will be inherited:
SetNodeStyle(samflow1, style = "filled,rounded", shape = "box",fontcolor = "black", fillcolor = "white", 
             fontname = "helvetica", tooltip = GetDefaultTooltip)
#inheritance can be avoided:

SetEdgeStyle(samflow$Recipient.COC, 
             color = "black", 
             penwidth = 3, 
             fontcolor = "Black", dir = "front", inherit = FALSE)
SetEdgeStyle(samflow1$USFWS, 
             color = "black", 
             penwidth = 3, 
             fontcolor = "Black", dir = "front", inherit = FALSE)
SetEdgeStyle(samflow1$CDFW, 
             color = "black", 
             penwidth = 3, 
             fontcolor = "Black", dir = "front", inherit = FALSE)
SetEdgeStyle(samflow$Recipient.COC, 
             color = "black", 
             penwidth = 3, 
             fontcolor = "Black", dir = "front", inherit = FALSE)




plot(samflow1)

