## ---- eval=FALSE---------------------------------------------------------
#  library(dataone)
#  library(datapack)
#  library(uuid)
#  dp <- new("DataPackage")
#  sampleData <- system.file("extdata/sample.csv", package="dataone")
#  # Create a unique identifier string for the data object in a standard format.
#  dataId  <- paste("urn:uuid:", UUIDgenerate(), sep="")
#  dataObj <- new("DataObject", id=dataId, format="text/csv", file=sampleData)
#  dataObj <- setPublicAccess(dataObj)
#  sampleEML <- system.file("extdata/sample-eml.xml", package="dataone")
#  # Create a unique id string for the data object in a standard format
#  # Alternatively DOI string could used using "generateIdentifier(mn, scheme="DOI")"
#  metadataId <- paste("urn:uuid:", UUIDgenerate(), sep="")
#  metadataObj <- new("DataObject", id=metadataId, format="eml://ecoinformatics.org/eml-2.1.1", file=sampleEML)
#  metadataObj <- setPublicAccess(metadataObj)
#  dp <- addData(dp, dataObj, metadataObj)
#  d1c <- D1Client("STAGING", "urn:node:mnStageUCSB2")
#  packageId <- uploadDataPackage(d1c, dp, replicate=TRUE, public=TRUE, numberReplicas=2)

## ----eval=F--------------------------------------------------------------
#  library(dataone)
#  library(datapack)
#  library(uuid)
#  dp <- new("DataPackage")

## ----eval=F--------------------------------------------------------------
#  sampleData <- system.file("extdata/sample.csv", package="dataone")
#  dataId <- paste("urn:uuid:", UUIDgenerate(), sep="")
#  dataObj <- new("DataObject", id=dataId, format="text/csv", file=sampleData)

## ----eval=F--------------------------------------------------------------
#  dataObj <- setPublicAccess(dataObj)

## ----eval=F--------------------------------------------------------------
#  accessRules <- data.frame(subject="CN=Peter Smith A10499,O=Google,C=US,DC=cilogon,DC=org", permission="changePermission") dataObj <- addAccessRule(dataObj, accessRules)

## ----eval=F--------------------------------------------------------------
#  sampleEML <- system.file("extdata/sample-eml.xml", package="dataone")
#  metadataObj <- new("DataObject", format="eml://ecoinformatics.org/eml-2.1.1", file=sampleEML)

## ---- eval=FALSE---------------------------------------------------------
#  cn <- CNode("STAGING")
#  mn <- getMNode(cn, "urn:node:mnStageUCSB2")
#  doi <- generateIdentifier(mn, "DOI")
#  metadataObj <- new("DataObject", id=doi, format="eml://ecoinformatics.org/eml-2.1.1", file=sampleEML)

## ---- eval=F-------------------------------------------------------------
#  dp <- addData(dp, metadataObj)

## ---- eval=F-------------------------------------------------------------
#  dp <- addData(dp, do = dataObj, mo = metadataObj)

## ---- eval=FALSE---------------------------------------------------------
#  d1c <- D1Client("STAGING", "urn:node:mnStageUCSB2")
#  packageId <- uploadDataPackage(d1c, dp, replicate=TRUE, numberReplicas=2)
#  message(sprintf("Uploaded data package with identifier: %s", packageId))

## ----eval=F--------------------------------------------------------------
#  library(digest)
#  # Create a system metadata object for a data file.
#  # Just for demonstration purposes, create a temporary data file.
#  testdf <- data.frame(x=1:20,y=11:30)
#  csvfile <- paste(tempfile(), ".csv", sep="")
#  write.csv(testdf, csvfile, row.names=FALSE)
#  format <- "text/csv"
#  size <- file.info(csvfile)$size
#  sha1 <- digest(csvfile, algo="sha1", serialize=FALSE, file=TRUE)
#  # Generate a unique identifier for the dataset
#  pid <- sprintf("urn:uuid:%s", UUIDgenerate())
#  sysmeta <- new("SystemMetadata", identifier=pid, formatId=format, size=size, checksum=sha1)
#  sysmeta <- addAccessRule(sysmeta, "public", "read")

## ----eval=F--------------------------------------------------------------
#  # Create a system metadata object for a data file.
#  # Just for demonstration purposes, create a temporary data file.
#  testdf <- data.frame(x=1:20,y=11:30)
#  csvfile <- paste(tempfile(), ".csv", sep="")
#  write.csv(testdf, csvfile, row.names=FALSE)
#  format <- "text/csv"
#  size <- file.info(csvfile)$size
#  sha1 <- digest(csvfile, algo="sha1", serialize=FALSE, file=TRUE)
#  # Generate a unique identifier for the dataset
#  pid <- sprintf("urn:uuid:%s", UUIDgenerate())
#  # The seriesId can be any unique character string.
#  seriesId <- sprintf("urn:uuid:%s", UUIDgenerate())
#  sysmeta <- new("SystemMetadata", identifier=pid, formatId=format, size=size, checksum=sha1,  seriesId=seriesId)

## ----eval=F--------------------------------------------------------------
#  cn <- CNode("STAGING")
#  mn <- getMNode(cn, "urn:node:mnStageUCSB2")
#  response <- createObject(mn, pid, csvfile, sysmeta)

## ---- eval=F-------------------------------------------------------------
#  cn <- CNode("STAGING")
#  mn <- getMNode(cn, "urn:node:mnStageUCSB2")
#  sysmeta <- getSystemMetadata(mn, pid)
#  sysmeta <- addAccessRule(sysmeta, "public", "read")
#  status <- updateSystemMetadata(mn, pid, sysmeta)

## ---- eval=F-------------------------------------------------------------
#  # Update object from previous example with a new version
#  updateid <- sprintf("urn:uuid:%s", UUIDgenerate())
#  testdf <- data.frame(x=1:20,y=11:30)
#  csvfile <- paste(tempfile(), ".csv", sep="")
#  write.csv(testdf, csvfile, row.names=FALSE)
#  size <- file.info(csvfile)$size
#  sha1 <- digest(csvfile, algo="sha1", serialize=FALSE, file=TRUE)
#  # Start with the old object's sysmeta, then modify it to match
#  # the new object. We could have also created a sysmeta from scratch.
#  sysmeta <- getSystemMetadata(mn, pid)
#  sysmeta@identifier <- updateid
#  sysmeta@size <- size
#  sysmeta@checksum <- sha1
#  sysmeta@obsoletes <- pid
#  # Now update the object on the member node.
#  response <- updateObject(mn, pid, csvfile, updateid, sysmeta)
#  # Get the new, updated sysmeta and check it to ensure that the update
#  # worked, i.e. "obsoletes" is the old pid that was replaced by the update.
#  updsysmeta <- getSystemMetadata(mn, updateid)
#  updsysmeta@obsoletes

## ---- eval=FALSE---------------------------------------------------------
#  response <- archive(mn, updateid)

## ---- eval=FALSE---------------------------------------------------------
#  sysmeta <- getSystemMetadata(mn, updateid)
#  sysmeta@archived

