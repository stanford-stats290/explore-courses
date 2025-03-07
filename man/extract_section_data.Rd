% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/process.R
\name{extract_section_data}
\alias{extract_section_data}
\title{Extract section and schedule data from a course XML node}
\usage{
extract_section_data(course, course_id)
}
\arguments{
\item{course}{An \code{xml2} node object representing a single course. Expected to
contain child \code{section} nodes, each potentially containing schedule
information.}

\item{course_id}{Character string. The course identifier used to link section
data back to the parent course.}
}
\value{
A \link[tibble:tibble-package]{tibble} containing section and schedule
information, or \code{NULL} if no sections are found. The tibble includes:

From section information:
\itemize{
\item \code{objectID}: Character. Course identifier (from \code{course_id})
\item \code{term}: Character. Academic term
\item \code{term_id}: Character. Term identifier
\item \code{section_number}: Character. Section number
\item \code{component}: Character. Section component (e.g., "LEC", "DIS")
\item \code{class_id}: Character. Unique class identifier
\item \code{current_class_size}: Numeric. Current enrollment
\item \code{max_class_size}: Numeric. Maximum enrollment
}

When schedule data exists, additional columns include:
\itemize{
\item Schedule timing information
\item Location data
\item Instructor information
}
}
\description{
Processes section-level information from a Stanford course XML node, including
both section details and associated schedule information. This function handles
the extraction and combination of section metadata with its corresponding
schedule data.
}
\details{
The function performs the following steps:
\enumerate{
\item Locates all section nodes within the course
\item For each section:
\itemize{
\item Extracts basic section information using \code{extract_section_info()}
\item Extracts schedule data using \code{extract_schedule_data()}
\item Joins section and schedule information if schedule data exists
}
\item Combines all section data into a single tibble
}

The function returns \code{NULL} if no sections are found, allowing for courses
that may not have active sections.
}
\section{Data Joining}{


Section and schedule data are joined using the class identifier, with
\code{class_id} from section data matching \code{section_id} from schedule data.
}

\section{Error Handling}{


If section data extraction fails, the function throws an error with details.
}

\examples{
\dontrun{
course_node <- xml2::xml_find_first(xml_doc, "//course")
course_id <- "222796"
section_data <- extract_section_data(course_node, course_id)
}
}
\seealso{
\itemize{
\item \code{\link[=extract_section_info]{extract_section_info()}} for section information extraction
\item \code{\link[=extract_schedule_data]{extract_schedule_data()}} for schedule data extraction
\item \code{\link[=process_courses_xml]{process_courses_xml()}} for the parent function using this extraction
}
}
\keyword{internal}
