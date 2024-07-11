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
require(magrittr)
require(DiagrammeRsvg)
require(xml2)

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
                            samflow$Processing,
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


#Fig1----
##Import Data 
SurveyCollections <- read_csv(file.path(data_root,
                                        "GeneticSampleProcessingFig1.csv"))



#"\n" is added to the original data to create a line breaks for each node
SurveyCollections$pathString <- paste(
                            SurveyCollections$Delivery,
                            SurveyCollections$Processing,
                            SurveyCollections$Stage,
                            SurveyCollections$Preservation,
                            SurveyCollections$Laboratory,
                            SurveyCollections$Action,
                            SurveyCollections$Dissection,sep = "/")

SurveyCollections1 <- as.Node(SurveyCollections)
SetGraphStyle(SurveyCollections1, rankdir = "LR")
SetEdgeStyle(SurveyCollections1, arrowhead = "vee", color = "black", penwidth = 3, dir = "front")
#per default, Node style attributes will be inherited:
SetNodeStyle(SurveyCollections1, style = "filled,rounded", shape = "box",fontcolor = "Black", fillcolor = "white", 
             fontname = "helvetica", tooltip = GetDefaultTooltip)
#inheritance can be avoided:
plot(SurveyCollections1)
fig1<- plot(SurveyCollections1)

#write fig1
fig1 %>%
  export_svg() %>%
  charToRaw %>%
  rsvg_pdf(file.path(viz_output_root,"GenSampleSurveysFig1.pdf"))

#Fig2----
#Import Data 
broodstock <- read_csv(file.path(data_root,
                              "GeneticSampleProcessingFig2.csv"))



#broodstock <- read_csv("C:/Users/nbertrand/Desktop/Bertrand/DeltaSmelt/DSM_Supplementation/ERTT/Monitoring Subteam/MonitoringDiagramR/SampleProcessing.csv")
#View(broodstock)

#"\n" is added to the original data to create a line breaks for each node
broodstock$pathString <- paste(
                            broodstock$Delivery,
                            broodstock$Stage,
                            broodstock$Preservation, 
                            broodstock$Laboratory, 
                            broodstock$Action, 
                            broodstock$Dissection,sep = "/")

broodstock1 <- as.Node(broodstock)
SetGraphStyle(broodstock1, rankdir = "LR")
SetEdgeStyle(broodstock1, arrowhead = "vee", color = "black", penwidth = 3, dir = "front")
#per default, Node style attributes will be inherited:
SetNodeStyle(broodstock1, style = "filled,rounded", shape = "box",fontcolor = "Black", fillcolor = "white", 
             fontname = "helvetica", tooltip = GetDefaultTooltip)
#inheritance can be avoided:
plot(broodstock1)
fig2 <- plot(broodstock1)

fig2 %>%
  export_svg() %>%
  charToRaw %>%
  rsvg_pdf(file.path(viz_output_root,"GenSampleBroodstockFig2.pdf"))

#Fig3----
#Import Data 
FCCLTissue <- read_csv(file.path(data_root,"GeneticSampleProcessingFig3.csv"))



#FCCLTissue <- read_csv("C:/Users/nbertrand/Desktop/Bertrand/DeltaSmelt/DSM_Supplementation/ERTT/Monitoring Subteam/MonitoringDiagramR/SampleProcessing.csv")
#View(SampleProcessing)

#"\n" is added to the original data to create a line breaks for each node
FCCLTissue$pathString <- paste(FCCLTissue$`Delta Smelt`,
                            FCCLTissue$Delivery,
                            FCCLTissue$Processing,
                            FCCLTissue$Preservation, 
                            FCCLTissue$Laboratory, 
                            FCCLTissue$Action, sep = "/")

FCCLTissue1 <- as.Node(FCCLTissue)
SetGraphStyle(FCCLTissue1, rankdir = "LR")
SetEdgeStyle(FCCLTissue1, arrowhead = "vee", color = "black", penwidth = 3, dir = "front")
#per default, Node style attributes will be inherited:
SetNodeStyle(FCCLTissue1, style = "filled,rounded", shape = "box",fontcolor = "Black", fillcolor = "white", 
             fontname = "helvetica", tooltip = GetDefaultTooltip)
#inheritance can be avoided:

plot(FCCLTissue1)
fig3 <- plot(FCCLTissue1)

fig3 %>%
  export_svg() %>%
  charToRaw %>%
  rsvg_pdf(file.path(viz_output_root,"GenSampleFCCLTissuesFig3.pdf"))