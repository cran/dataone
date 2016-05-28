## ---- eval=F-------------------------------------------------------------
#  libary(dataone)
#  am <- AuthenticationManager()
#  getTokenInfo(am)

## ---- eval=F-------------------------------------------------------------
#  Sys.setenv(LIB_DIR="/opt/local/lib")
#  Sys.setenv(INCLUDE_DIR="/opt/local/include")
#  install.packages("curl", type="source")
#  library(curl)
#  library(dataone)
#  
#  # Remove the environment variables as they are no longer needed.
#  Sys.setenv(LIB_DIR="")
#  Sys.setenv(INCLUDE_DIR="")

## ---- eval=F-------------------------------------------------------------
#  Sys.setenv(LIB_DIR="/usr/local/opt/curl/lib")
#  Sys.setenv(INCLUDE_DIR="/usr/local/opt/curl/include")
#  install.packages("curl", type="source")
#  library(curl)
#  library(dataone)
#  
#  # Remove the environment variables as they are no longer needed.
#  Sys.setenv(LIB_DIR="")
#  Sys.setenv(INCLUDE_DIR="")

## ---- eval=F-------------------------------------------------------------
#  cn <- CNode("PROD")
#  unlist(lapply(listNodes(cn), function(x) x@identifier))

## ----eval=F--------------------------------------------------------------
#  cn@endpoint

## ---- eval=F-------------------------------------------------------------
#  cn <- CNode("STAGING2")
#  unlist(lapply(listNodes(cn), function(x) x@identifier))

## ---- eval=F-------------------------------------------------------------
#  cn <- CNode("PROD")
#  mn <- getMNode(cn, "urn:node:KNB")
#  result <- query(mn, searchTerms=list(abstract="hydrocarbon", keywords="aquaculture"), as="data.frame")

