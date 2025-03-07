% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cache.R
\name{cache_exists}
\alias{cache_exists}
\title{Check if cache exists for specific data}
\usage{
cache_exists(name = NULL, year = NULL, cache_dir = NULL)
}
\arguments{
\item{name}{Character string. Optional department code (e.g., \code{"CS"}) to check for
specific department cache files.}

\item{year}{Character string. Optional academic year in \code{YYYYYYYY} format (e.g.,
\code{"20232024"}) to check for cache files from a specific year.}

\item{cache_dir}{Character string. Optional path to the cache directory. If
\code{NULL}, uses the default cache location.}
}
\value{
A logical value:
\itemize{
\item \code{TRUE} if matching cache files exist
\item \code{FALSE} if no matching files found or if check fails
}
}
\description{
Checks for the existence of cached XML files in the cache directory. Can check
for files for a specific department, academic year, or combination of both. If
no filters are specified, checks if any cache files exist.
}
\details{
The function supports three checking modes based on parameter combinations:
\enumerate{
\item Department-specific: When \code{name} is provided
\itemize{
\item Checks for: \code{"{name}.xml"} or \code{"{name}_{year}.xml"} if year provided
}
\item Year-specific: When only \code{year} is provided
\itemize{
\item Checks for: Any files matching \code{"*_{year}.xml"}
}
\item General check: When neither \code{name} nor \code{year} provided
\itemize{
\item Checks for: Any \code{"*.xml"} files in cache directory
}
}

On error (e.g., permission issues), the function:
\itemize{
\item Issues a warning with error details
\item Returns \code{FALSE} to allow graceful error handling
}
}
\examples{
\dontrun{
# Check if any cache exists
if (cache_exists()) {
  # Process cached data
}

# Check specific department cache
if (cache_exists(name = "CS")) {
  cached_data <- read_xml_cache("CS")
}

# Check specific year
if (cache_exists(year = "20232024")) {
  # Process cached data for year
}

# Check specific department and year
if (cache_exists(name = "CS", year = "20232024")) {
  cached_data <- read_xml_cache("CS", "20232024")
}
}

}
\seealso{
\itemize{
\item \code{\link[=read_xml_cache]{read_xml_cache()}} for reading cached data
\item \code{\link[=write_xml_cache]{write_xml_cache()}} for writing data to cache
\item \code{\link[=clear_cache]{clear_cache()}} for removing cached files
}
}
