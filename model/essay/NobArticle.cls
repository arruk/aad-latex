% Classe simples para um essay academico.
% Mantem o nome NobArticle.cls para compatibilidade com o projeto existente.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NobArticle}[2026/04/30 Simple academic essay class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[12pt,a4paper]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[brazil]{babel}
\RequirePackage{lmodern}
\RequirePackage{microtype}
\RequirePackage{amssymb}
\RequirePackage{csquotes}
\RequirePackage{xcolor}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{indentfirst}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage[ruled,vlined,linesnumbered]{algorithm2e}
\RequirePackage{hyperref}

\geometry{
  top=2.5cm,
  bottom=2.5cm,
  left=3cm,
  right=2.5cm
}

\onehalfspacing
\setlength{\parindent}{1.25cm}
\setlength{\parskip}{0pt}
\setlist{noitemsep,topsep=0.4\baselineskip}

\SetAlgorithmName{Algoritmo}{Algoritmo}{Lista de Algoritmos}
\SetKwInput{Entrada}{Entrada}
\SetKwInput{Saida}{Saida}
\SetKw{KwAte}{ate}
\SetKw{Retorne}{retorne}

\hypersetup{
  colorlinks=true,
  linkcolor=black,
  citecolor=black,
  urlcolor=blue!45!black,
  pdfborder={0 0 0}
}

\titleformat{\section}
  {\normalfont\large\bfseries}
  {\thesection}
  {0.75em}
  {}

\titleformat{\subsection}
  {\normalfont\normalsize\bfseries}
  {\thesubsection}
  {0.75em}
  {}

\titlespacing*{\section}{0pt}{1.5\baselineskip}{0.6\baselineskip}
\titlespacing*{\subsection}{0pt}{1.1\baselineskip}{0.4\baselineskip}

\renewcommand{\maketitle}{
  \begin{center}
    {\Large\bfseries \@title\par}
    \vspace{0.8\baselineskip}
    {\normalsize \@author\par}
    \vspace{0.4\baselineskip}
    {\small \@date\par}
  \end{center}
  \vspace{1.2\baselineskip}
}

\newcommand{\thesis}[1]{\textbf{Tese:} #1}
\newcommand{\topicclaim}[1]{\textbf{Ideia central do topico:} #1}
