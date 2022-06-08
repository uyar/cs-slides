# Computer Science Slides

These are the course slides used in some courses
at the Istanbul Technical University, Computer Engineering Department.

The slides are prepared using LaTeX Beamer.
The drawings are in SVG format and they have been prepared using Inkscape.

## How to build

A Makefile has been supplied in order to build the PDF presentations
and printable files.
Use that Makefile with the following targets
to get outputs in various formats:

`make`: Creates the presentation file using the chosen theme and
transition effects.
This output is not suitable for printing.

`make handout`: Creates a handout version using the default theme
and without transition effects.
This output is meant for printing,
but you might choose the next option to save paper.

`make print`: Creates a 6-slides-per-sheet version of the handout file.

`make zip`: Creates a zip archive from the sources and the outputs,
without the intermediary files.

`make clean`: Deletes all intermediary files and outputs.

Beside LaTeX Beamer, the following applications and utilities are needed
to build the PDF files:

- inkscape
- sed, grep (for handouts)
- pdfjam (for printouts)
- zip

## Courses

At the moment, the slides for the following courses are in the repository:

- Database Systems
- Veri Tabanı Sistemleri (Database Systems - in Turkish)
- Discrete Mathematics
- Ayrık Matematik (Discrete Mathematics - in Turkish)
- Bilişim Etiği (IT Ethics - in Turkish)
- Functional Programming
