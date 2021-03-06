## -----------------------------------------------------------------------------
library(datapack)
library(dataone)

## ---- eval=FALSE--------------------------------------------------------------
#  d1c <- D1Client("STAGING", "urn:node:mnStageUCSB2")
#  packageId <- "resource_map_urn:uuid:a9aeefcf-228c-4534-b4ad-b480a937be7d"

## ---- eval=FALSE--------------------------------------------------------------
#  pkg <- getDataPackage(d1c, identifier=packageId, lazyLoad=TRUE, quiet=FALSE)

## ---- eval=FALSE,message=FALSE------------------------------------------------
#  metadataId <- selectMember(pkg, name="sysmeta@formatId", value="eml://ecoinformatics.org/eml-2.1.1")
#  objId <- selectMember(pkg, name="sysmeta@fileName", value='Strix-occidentalis-obs.csv')
#  zipfile <- system.file("extdata/Strix-occidentalis-obs.csv.zip", package="dataone")
#  pkg <- replaceMember(pkg, objId, replacement=zipfile, formatId="application/octet-stream")
#  auxFile <- system.file("extdata/WeatherInf.txt", package="dataone")
#  auxObj <- new("DataObject", format="text/plain", filename=auxFile)
#  pkg <- addMember(pkg, auxObj, metadataId)
#  

## ----eval=FALSE---------------------------------------------------------------
#  newPackageId <- uploadDataPackage(d1c, pkg, public=TRUE, quiet=FALSE)

## ---- eval=FALSE--------------------------------------------------------------
#  d1c <- D1Client("STAGING", "urn:node:mnStageUCSB2")

## ---- eval=FALSE--------------------------------------------------------------
#  pkg <- getDataPackage(d1c, identifier=packageId, lazyLoad=TRUE, quiet=FALSE)

## ---- echo=FALSE----------------------------------------------------------------------------------
saveWidth <- getOption("width")
options(width=100)

## ---- eval=FALSE----------------------------------------------------------------------------------
#  pkg

## ---- echo=FALSE--------------------------------------------------------------
options(width=saveWidth)

## ---- eval=FALSE--------------------------------------------------------------
#  objId <- selectMember(pkg, name="sysmeta@fileName", value='Strix-occidentalis-obs.csv')

## ----eval=FALSE---------------------------------------------------------------
#  objId <- selectMember(pkg, name="sysmeta@fileName", value='Strix-occidentalis-obs.csv')
#  zipfile <- system.file("extdata/Strix-occidentalis-obs.csv.zip", package="dataone")
#  pkg <- replaceMember(pkg, objId, replacement=zipfile, formatId="application/octet-stream")

## ---- eval=FALSE--------------------------------------------------------------
#  metadataId <- selectMember(pkg, name="sysmeta@formatId", value="eml://ecoinformatics.org/eml-2.1.1")

## ----eval=FALSE---------------------------------------------------------------
#  getValue(pkg, name="sysmeta@formatId")

## ----eval=FALSE---------------------------------------------------------------
#  auxFile <- system.file("extdata/WeatherInf.txt", package="dataone")
#  auxObj <- new("DataObject", format="text/csv", filename=auxFile)
#  pkg <- addMember(pkg, auxObj, metadataId)

## ---- echo=FALSE----------------------------------------------------------------------------------
saveWidth <- getOption("width")
options(width=100)

## ---- echo=FALSE--------------------------------------------------------------
options(width=saveWidth)

## ---- eval=FALSE--------------------------------------------------------------
#  newPackageId <- uploadDataPackage(d1c, pkg, public=TRUE, quiet=FALSE)

## ---- eval=FALSE--------------------------------------------------------------
#  metadataId <- selectMember(pkg, name="sysmeta@formatId", value="eml://ecoinformatics.org/eml-2.1.1")
#  nameXpath <- '//dataTable/physical/objectName[text()="Strix-occidentalis-obs.csv"]'
#  newName <- basename(zipfile)
#  pkg <- updateMetadata(pkg, metadataId, xpath=nameXpath, replacement=newName)

## ---- eval=FALSE--------------------------------------------------------------
#  objId <- selectMember(pkg, name="sysmeta@fileName", value='Strix-occidentalis-obs.csv.zip')
#  newURL <- sprintf("%s/%s/resolve/%s", d1c@cn@baseURL, d1c@cn@APIversion, objId)
#  newURL

## ---- eval=FALSE--------------------------------------------------------------
#  metadataId <- selectMember(pkg, name="sysmeta@formatId", value="eml://ecoinformatics.org/eml-2.1.1")
#  xpathToURL <- "//dataTable/physical/distribution[../objectName/text()=\"OwlNightj.csv\"]/online/url"
#  pkg <- updateMetadata(pkg, do=metadataId, xpath=xpathToURL, replacement=newURL)

