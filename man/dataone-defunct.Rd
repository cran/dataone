% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataone-defunct.R
\name{dataone-defunct}
\alias{dataone-defunct}
\title{Defunct}
\description{
The following items are defunct in this release of dataone and are
no longer supported.
}
\section{These S4 methods are defunct}{

\itemize{
 \item{\code{\link{D1Object}}}{: A representation of a DataObject}
 \itemize{
   \item{\code{\link{D1Object-initialize}}}{: Initialize a D1Object}
   \item{\code{\link{getData}}}{: Get the data content of a specified D1Object.}
   \item{\code{\link{getIdentifier}}}{: Get the identifier of the D1Object.}
   \item{\code{\link{getFormatId}}}{: Get the formatId of the D1Object}
   \item{\code{\link{setPublicAccess}}}{: Add a Rule to the AccessPolicy to make the object publicly readable.}
   \item{\code{\link{canRead}}}{: Test whether the provided subject can read an object.}
   \item{\code{\link{asDataFrame}}}{: Return the D1Object as a data.frame.}
   \item{\code{\link{setObsoletedBy}}}{: Set a pid as being obsoleted by another pid.}
 } 
\item{\code{\link{D1Client}}}{: The DataONE client class used to download, update and search for data in the DataONE network}
 \itemize{
   \item{\code{\link{d1SolrQuery}}}{: A method to query the DataONE solr endpoint of the Coordinating Node.}
   \item{\code{\link{d1IdentifierSearch}}}{: Query the DataONE Solr endpoint of the Coordinating Node.}
   \item{\code{\link{createDataPackage}}}{: Create a DataPackage on a DataONE Member Node}
   \item{\code{\link{getMN}}}{: Get a member node client based on its node identifier.}
   \item{\code{\link{convert.csv}}}{: Convert a DataFrame to Standard CSV.}
   \item{\code{\link{addData}}}{: Add a D1Object containing a data object to a DataPackage}
   \item{\code{\link{createD1Object}}}{: Create the Object in the DataONE System}
   \item{\code{\link{getD1Object}}}{: Download a data object from the DataONE Federation.}
 }
\item{\code{EMLParser}}{: A representation of a DataObject}
 \itemize{
   \item{\code{\link{documented.entityNames}}}{: The entity names associated with each table are returned.}
   \item{\code{\link{documented.d1Identifiers}}}{: Get the DataONE identifier associated with each table.}
   \item{\code{\link{documented.sizes}}}{: Get the table size.}
 }
\item{\code{AbstractTableDescriber}}{: Base Class for Specific Metadata Parsers}
 \itemize{
   \item{\code{\link{data.formatFamily}}}{: Get the table format family.}
   \item{\code{\link{data.tableFieldDelimiter}}}{: Get the table field delimiter.}
   \item{\code{\link{data.tableQuoteCharacter}}}{: Get the table quote character.}
   \item{\code{\link{data.characterEncoding}}}{: The character encoding used, for example "UTF-8"}
   \item{\code{\link{data.tableAttributeOrientation}}}{: Which way to the attribute headers run?  Most data has a header row}
   \item{\code{\link{data.tableSkipLinesHeader}}}{: The specified number of lines are skipped.}
   \item{\code{\link{data.tableMissingValueCodes}}}{: the missing value codes are defined in the metadata document for}
   \item{\code{\link{data.tableAttributeNames}}}{: The attribute names are defined in the metadata document for}
   \item{\code{\link{data.tableAttributeTypes}}}{: The attributes' data types are defined in the metadata document for}
   \item{\code{\link{data.tableAttributeStorageTypes}}}{: The attributes' data storage types are defined in the metadata document for}
 }
}
}

\keyword{internal}
