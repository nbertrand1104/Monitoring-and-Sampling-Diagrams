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



setwd("C:/Users/nbertrand/Desktop/Bertrand/Rstuff/HouR/DOPContacts")
DOPorg <- read_csv("DOPorg.csv")
#View(DOPorg)

DOP <- DOPorg


collapsibleTree(DOP, c("Collecting.Agency", "Program", "Research.Topic","Contacts", "Email"), attribute = "Contract", linkLength = 100, width =  2500)
#########################

DOP$pathString <- paste("DOP\n Directed Out Flow Project", DOP$Collecting.Agency, DOP$Program,DOP$Research.Topic, sep = "/")

DOPt <- as.Node(DOP)
print(DOPt, "Collecting.Agency", "Program", limit = 20)

plot(DOPt)

SetGraphStyle(DOPt, rankdir = "LR")
SetNodeStyle(DOPt, style = "filled,rounded", shape = "box", fillcolor = "Blue", fontname = "helvetica")
SetNodeStyle(DOPt$USFWS, fillcolor = "Red", penwidth = "5px")
SetNodeStyle(DOPt$UCDavis, fillcolor = "Purple", penwidth = "5px")
SetNodeStyle(DOPt$DWR, fillcolor = "DarkGreen", penwidth = "5px")
SetNodeStyle(DOPt$CDFW, fillcolor = "Orange", penwidth = "5px")
SetEdgeStyle(DOPt$USFWS, inherit = FALSE, dir= "both")
SetEdgeStyle(DOPt$USFWS, inherit = FALSE)
plot(DOPt)


#"\n" is added to the original data to create a line breaks for each node
DOPt2 <- as.Node(DOP)
SetGraphStyle(DOPt2, rankdir = "LR")
SetEdgeStyle(DOPt2, arrowhead = "vee", color = "blue", penwidth = 2)
#per default, Node style attributes will be inherited:
SetNodeStyle(DOPt2, style = "filled,rounded", shape = "box", fillcolor = "GreenYellow", 
             fontname = "helvetica", tooltip = GetDefaultTooltip)
SetNodeStyle(DOPt2$USFWS, fillcolor = "LightBlue", penwidth = "5px")
#inheritance can be avoided:
SetNodeStyle(DOPt2$USFWS, inherit = FALSE, fillcolor = "Thistle", 
             fontcolor = "Firebrick", tooltip = "This is the accounting department")
SetEdgeStyle(DOPt2$ICF, 
             color = "red", 
             label = "Patnership", 
             penwidth = 3, 
             fontcolor = "red", dir = "both", inherit = FALSE)
plot(DOPt2)

DOPt2

#this is an alternative plot that consolidates the different research projects into single boxes
setwd("C:/Users/nbertrand/Desktop/Bertrand/Rstuff/HouR/DOPContacts")
AltDOPorg <- read_csv("AltDOPorg.csv")
#View(AltDOPorg)


#"\n" is added to the original data to create a line breaks for each node
AltDOPorg$pathString <- paste("DOP\n Directed Out Flow Project", AltDOPorg$Collecting.Agency, AltDOPorg$Program,AltDOPorg$Research.Topic, sep = "/")

DOPt3 <- as.Node(AltDOPorg)
SetGraphStyle(DOPt3, rankdir = "LR")
SetEdgeStyle(DOPt3, arrowhead = "vee", color = "black", penwidth = 2)
#per default, Node style attributes will be inherited:
SetNodeStyle(DOPt3, style = "filled,rounded", shape = "box", fillcolor = "GreenYellow", 
             fontname = "helvetica", tooltip = GetDefaultTooltip)
SetNodeStyle(DOPt3$USFWS, fillcolor = "LightBlue", penwidth = "5px")
#inheritance can be avoided:
SetNodeStyle(DOPt3$USFWS, inherit = FALSE, fillcolor = "Thistle", 
             fontcolor = "Firebrick", tooltip = "This is the accounting department")
SetEdgeStyle(DOPt3$ICF, 
             color = "red", 
             label = "Patnership", 
             penwidth = 3, 
             fontcolor = "red", dir = "both", inherit = FALSE)

plot(DOPt3)

export_graph(ToDiagrammeRGraph(DOPt3), "DOPtree.pdf")



setwd("C:/Users/nbertrand/Desktop/Bertrand/Rstuff/HouR/DOPContacts")
FDOPorg <- read_csv("AltDOPorg.csv")
#View(AltDOPorg)


#"\n" is added to the original data to create a line breaks for each node
FDOPorg$pathString <- paste("Directed Outflow Program\n (DOP)", FDOPorg$Collecting.Agency, FDOPorg$Program,FDOPorg$Research.Topic, sep = "/")

DOPt3 <- as.Node(FDOPorg)
SetGraphStyle(DOPt3, rankdir = "LR")
SetEdgeStyle(DOPt3, arrowhead = "vee", color = "black", penwidth = 3, dir = "back")
#per default, Node style attributes will be inherited:
SetNodeStyle(DOPt3, style = "filled,rounded", shape = "box",fontcolor = "white", fillcolor = "blue", 
             fontname = "helvetica", tooltip = GetDefaultTooltip)
#inheritance can be avoided:
SetEdgeStyle(DOPt3$USFWS, 
             color = "black", 
             penwidth = 3, 
             fontcolor = "Black", dir = "both", inherit = FALSE)
SetEdgeStyle(DOPt3$CDFW, 
             color = "black", 
             penwidth = 3, 
             fontcolor = "Black", dir = "both", inherit = FALSE)
SetEdgeStyle(DOPt3$DWR, 
             color = "black", 
             penwidth = 3, 
             fontcolor = "Black", dir = "both", inherit = FALSE)
SetEdgeStyle(DOPt3$MWD, 
             color = "black", 
             penwidth = 3, 
             fontcolor = "Black", dir = "both", inherit = FALSE)
SetEdgeStyle(DOPt3$SWC, 
             color = "black", 
             penwidth = 3, 
             fontcolor = "Black", dir = "both", inherit = FALSE)



plot(DOPt3)
