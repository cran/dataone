## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(cache=TRUE)

## ----warning=FALSE,autodep=T,message=FALSE-------------------------------
library(dataone)
cn <- CNode("PROD")
# Ask for the id, title and abstract
queryParams <- list(q="abstract:kelp", fq="attribute:biomass", fq="id:doi*", 
                    fq="formatType:METADATA", fl="id,title,abstract") 
result <- query(cn, solrQuery=queryParams, as="data.frame", parse=FALSE)
result[1,c("id", "title")]

## ------------------------------------------------------------------------
 pid <- result[1,'id']

## ---- warning=FALSE, eval=FALSE------------------------------------------
#  locations <- resolve(cn, pid)
#  mnId <- locations$data[2, "nodeIdentifier"]
#  mn <- getMNode(cn, mnId)

## ---- warning=FALSE,eval=FALSE-------------------------------------------
#  obj <- getObject(mn, pid)

## ---- warning=FALSE, eval=FALSE, message=FALSE---------------------------
#  # Query the data holdings on a member node
#  cn <- CNode("PROD")
#  mn <- getMNode(cn, "urn:node:KNB")
#  queryParams <- list(q="abstract:habitat", fl="id,title,abstract")
#  result <- query(mn, queryParams, as="data.frame", parse=FALSE)
#  # Choose the first matchin PID
#  pid <- result[1,'id']
#  obj <- getObject(mn, pid)

## ---- warning=FALSE, eval=FALSE, message=FALSE---------------------------
#  d1c <- D1Client("PROD", "urn:node:KNB")
#  # Ask for the id, title and abstract
#  queryParams <- list(q="abstract:\"biogenic hydrocarbon\"", fq="id:doi*",
#                      fq="formatType:METADATA", fl="id,title")
#  result <- query(d1c@mn, solrQuery=queryParams, as="data.frame", parse=FALSE)
#  pid <- result[1,'id']
#  dataObj <- getDataObject(d1c, pid)
#  bytes <- getData(dataObj)
#  metadataXML <- rawToChar(bytes)

## ---- eval=FALSE---------------------------------------------------------
#  dataBytes <- getData(dataObj)

## ---- eval=FALSE---------------------------------------------------------
#  str(dataObj@sysmeta)

## ---- eval=FALSE---------------------------------------------------------
#  cn <- CNode()
#  mn <- getMNode(cn, "urn:node:KNB")
#  queryParamList <- list(q="id:Blandy.77.1", fl="resourceMap")
#  result <- query(cn, solrQuery=queryParamList, as="data.frame")
#  packagePid <- result[1,1]

## ---- eval=FALSE---------------------------------------------------------
#  cn <- CNode()
#  mn <- getMNode(cn, "urn:node:KNB")
#  bagitFileName <- getPackage(mn, id=packagePid)

