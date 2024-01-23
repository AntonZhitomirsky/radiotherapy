# Example of main file:

```latex
\documentclass[11pt]{article}

% some definitions for the title page
\newcommand{\reporttitle}{example}
\newcommand{\reportdescription}{example description}

% load some definitions and default packages
\input{../../.latex-templates/includes}
\input{../../.latex-templates/notation}

\begin{document}

% Include the title page
\input{../../.latex-templates/titlepage}

\tableofcontents

\end{document}
```