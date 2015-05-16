%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Programa de Pos-Graduacao em Informatica (PPGIa)
% Pontificia Universidade Catolica do Parana (PUCPR)
% Abril de 2007
% Alterado pela Catolica de Santa Catarina
% Abril 2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% pppgiathesis.cls
% Modelo LATEX ainda não-oficial de dissertação/tese do PPGIa
% Publicado em Abril de 2007.
% Prof. Alessandro L. Koerich (alekoe@ppgia.pucpr.br)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Historico
%
% Desenvolvido por Leonardo Bispo de Oliveira (2004).
% Modificado por Carlos Nascimento Silla Jr. (2007).
%
% Contribuições para o aperfeiçoamento do modelo são bem vindas.
% Enviar contribuicoes para direcao@ppgia.pucpr.br
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Atenção! Este não é um modelo definitivo, pois ainda apresenta
% algumas imperfeições.
% 
% Problemas identificados a serem resolvidos
%
% 1. Numeração das páginas iniciais dos capítulos devem ser centradas
% no pé da página.
% 2. ???
% 3. ???
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{ppgiathesis}

\DeclareOption{msc}{%
   \let\@degreetype=1
}

\DeclareOption{phd}{%
   \let\@degreetype=2
}

\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}

%%%%%% DEFAULT TYPE (msc) %%%%%%

\ExecuteOptions{msc, oneside}
\ProcessOptions

\if@twoside
  \PassOptionsToClass{twoside}{book}
\else
  \PassOptionsToClass{oneside}{book}
\fi

\LoadClass[12pt,a4paper,oneside]{book}

%%%%%% REQUIRED PACKAGES %%%%%%

\RequirePackage[brazil]{babel}
\RequirePackage{calc}
\RequirePackage[latin1]{inputenc}
\RequirePackage{theorem}
\RequirePackage{xspace}
\RequirePackage{indentfirst}
\RequirePackage{ifthen}
\RequirePackage{setspace}
\newboolean{changepagetp}
\setboolean{changepagetp}{false}

%%%%%% PAGE LAYOUT %%%%%%

\setlength{\parindent}{1.27cm}

% HORIZONTAL
\setlength{\oddsidemargin}{3cm-\hoffset-1in}
\setlength{\evensidemargin}{2cm-\hoffset-1in}
\setlength{\textwidth}{\paperwidth-\oddsidemargin-\hoffset-1in-2cm}

% VERTICAL
\setlength{\headsep}{1.2cm-\headheight}
\setlength{\topmargin}{2cm-1in-\voffset}
\setlength{\textheight}{\paperheight-\topmargin-\voffset-1in-\headheight-\headsep-2cm}
\setlength{\topmargin}{2cm-\headheight-\headsep-\voffset-1in}
\setlength{\textheight}{\paperheight-2cm-\footskip-2cm}

% NUMBER PAGE TYPE - Before \changepage (Roman Bottom Center) After (Arabic Top Right)
\newcommand\changepage{\setboolean{changepagetp}{true}\setcounter{page}{1}}

\newcommand{\ps@plainheader}{%
   \ifthenelse{\boolean{changepagetp}}
      {\renewcommand{\thepage}{\arabic{page}}
         \renewcommand{\@oddfoot}{}
         \renewcommand{\@evenfoot}{}
         \renewcommand{\@oddhead}{\hfill{\thepage}}
         \renewcommand{\@evenhead}{{\thepage}\hfill}
         \renewcommand{\chaptermark}[1]{%
            \markboth{%
           \ifnum \c@secnumdepth >\m@ne
                  \thechapter\ \
               \fi
               ##1
        }
            {%
           \ifnum \c@secnumdepth >\m@ne
                  \thechapter\ \ %
               \fi%
               ##1
        }
         }%
         \renewcommand{\sectionmark}[1]{%
            \markright{%
               \ifnum \c@secnumdepth >\z@
                  \thesection\ \
               \fi
               ##1
        }
         }
      }
      {%
         \renewcommand{\thepage}{\roman{page}}
         \pagestyle{plain}
      }
}

\newcommand\pretextualchapter{%
   %\if@openright\cleardoublepage\else\clearpage\fi%
%   \if@twoside
%     \cleardoublepage
%   \else
      \cleardoublepage
%   \fi
   \global\@topnum\z@%
   \@afterindentfalse%
   \@schapter%
}%

\def\chaptermark#1{\markboth{\sc\MakeLowercase{#1}}{\sc\MakeLowercase{#1}}}
\def\sectionmark#1{\markright{\sc\MakeLowercase{\thesection\ #1}}}


%%%%%% USER IDENTIFICATIONS %%%%%%

\def\university#1{%
   \gdef\@university{#1}
}

\def\@university{Centro Universitário Católica de Santa Catarina}

\def\majorfield#1{%
   \gdef\@majorfield{#1}
}

\def\@majorfield{Área não especificada}

\def\address#1{%
   \gdef\@address{#1}
}

\def\@address{Curitiba}

\def\author#1{%
   \gdef\@author{#1}
}

\def\@author{Autor não especificado}

\def\adviser{
   \@ifnextchar[%
      {\@padviser}%
      {\@padviser[\@empty]}
}

\def\@padviser[#1]#2{%
   \ifx#1\@empty
      \gdef\@advisertitle{Orientador}
   \else
      \gdef\@advisertitle{Orientadora}
   \fi
   \gdef\@adviser{#2}
}

\def\@author{Orientador não especificado}

\let\@showcoadviser=0

\def\coadviser{%
   \@ifnextchar[%
      {\@pcoadviser}%
      {\@pcoadviser[\@empty]}
}

\def\@pcoadviser[#1]#2{%
   \let\@showcoadviser=1
   \ifx#1\@empty
      \gdef\@coadvisertitle{Co-orientador}
   \else
      \gdef\@coadvisertitle{Co-orientadora}
   \fi
     \gdef\@coadviser{#2}
}

\def\title#1{%
   \gdef\@title{#1}
}

\def\@title{Título não especificado}

\def\@mastersdissertation{Monografia}

\def\@phdthesis{Tese}

\def\@texttype{%
   \if\@degreetype0
      \@bachelordissertation
   \else\if\@degreetype1
      \@mastersdissertation
   \else\if\@degreetype2
      \@phdthesis
   \fi\fi\fi
}

\def\@mastersdegree{Mestre}

\def\@phddegree{Doutor}

\def\@degree{%
   \if\@degreetype0
      \@bachelordegree
   \else\if\@degreetype1
      \@mastersdegree
   \else\if\@degreetype2
      \@phddegree
   \fi\fi\fi
}

%%%%%% FRONTPAGE %%%%%%

\def\frontpage{%
   \cleardoublepage
   \thispagestyle{empty}

   \begin{center}
      {\Large\bfseries\@author}

      \vskip 80mm

      \begin{minipage}{150mm}
         \begin{center}
        \setstretch{1.35}
            {\bfseries\LARGE\@title}
            \vskip\baselineskip
            \vskip\baselineskip
         \end{center}
      \end{minipage}\\
      \vskip 20mm

      \begin{flushright}
         \begin{minipage}{80mm}
            \@texttype\ apresentada no curso de Pós-Graduação do \@university\ como requisito parcial para obtenção do certificado do curso.
          \end{minipage}
      \end{flushright}

      \vfill
      \@address\\
      \@date
   \end{center}
   \if@twoside
     \newpage
     \thispagestyle{empty}
      ~\\
   \fi

\newpage

   \presentationpage
}

\def\presentationpage{%
   \cleardoublepage
   \thispagestyle{empty}

   \begin{center}
      {\Large\bfseries\@author}

      \vskip 80mm

      \begin{minipage}{150mm}
         \begin{center}
            \setstretch{1.35}
            {\bfseries\Huge\@title}
            \vskip\baselineskip
            \vskip\baselineskip
         \end{center}
      \end{minipage}\\
   \vskip 20mm

      \begin{flushright}
         \begin{minipage}{80mm}
            \@texttype\ apresentada no curso de Pós-Graduação do \@university\ como requisito parcial para obtenção do certificado do curso.
            \vskip2\baselineskip
            {Área de Concentração:} \@majorfield
            \vskip2\baselineskip
            {\@advisertitle:} \@adviser
            \if\@showcoadviser1
               \\ {\@coadvisertitle:} \@coadviser
            \fi
         \end{minipage}
      \end{flushright}

      \vfill
      \@address\\
      \@date
   \end{center}
}

%%%%%% INFORMATIONS %%%%%%

\newcommand\informations[5]{%
   \if@twoside
     \clearpage
   \else
     \cleardoublepage
   \fi

   \thispagestyle{empty}
   ~\\
   \vfill
   \vfill

   \begin{center}
      \begin{minipage}{140mm}
         \hsize=135mm
         \textwidth=\hsize
         \linewidth=\hsize
         \framebox[140mm]{%
            \vbox{%
           \noindent #1, #2\\\@title. \@address, \@date. \vskip2\baselineskip
           \@texttype\ - \@university . \vskip2\baselineskip 1. #3 2. #4 3. #5 I.\@university. Curso de Bacharaledo em Sistemas de Informação. Curso de Pós-Graduação em Engenharia de Software.
            }
         }
      \end{minipage}
   \end{center}

   \if@twoside
   \else
     \newpage
     \thispagestyle{empty}
     ~\\
   \fi
   \newpage
   \pagestyle{plainheader}
   \setcounter{page}{1}
}


%%%%%% DEDICATORY %%%%%%

\def\dedicatory{%
   \if@twoside
     \clearpage
   \else
     \cleardoublepage
   \fi
   ~\\
   \vfill

   \begin{flushright}
      \begin{minipage}{80mm}
}

\def\enddedicatory{%
         \normalfont
      \end{minipage}
   \end{flushright}
}

%%%%%% ACKNOWLEDGEMENTS %%%%%%

\def\acknowledgementsname{Agradecimentos}

\def\acknowledgements{%
   \chapter*{\acknowledgementsname}
}

%%%%%% ABSTRACT %%%%%%

\def\resumoname{Resumo}

\def\resumo{%
   \gdef\@keywordsname{\keywordsnamePT}
   \chapter*{\resumoname}
}

\def\abstrname{Abstract}

\def\abstract{%
   \gdef\@keywordsname{\keywordsnameEN}
   \chapter*{\abstrname}
}

\def\keywordsnamePT{Palavras-chave}

\def\keywordsnameEN{Keywords}

\def\@keywordsname{\@defaultkeywordsname}

\def\keywords{%
   \par\vskip\baselineskip\noindent{\bf\@keywordsname: }
}

\def\endkeywords{}

%%%%%% TABLE OF CONTENTS, LIST OF FIGURES, LIST OF TABLES, LIST OF SYMBOLS, LIST OF ABREVIATIONS %%%%%%

\renewcommand\tableofcontents{%
   \chapter*{\contentsname}
   \@starttoc{toc}
}

\newcommand{\listofsymbols}{%
   \pretextualchapter{Lista de Símbolos}
   {%
      \setstretch{0.5}
      \@starttoc{los}
   }
}

\newcommand{\listofabreviations}{%
   \pretextualchapter{Lista de Abreviações}
   {%
      \setstretch{0.5}
      \@starttoc{loa}
   }
}

\newcommand{\symb}[2]{%
   \addcontentsline{los}{symbol}{\ensuremath{#1}}%
   \addcontentsline{los}{definition}{#2}%
$#1$%
}

\newcommand{\abrevpuc}[2]{%
   \addcontentsline{loa}{abrevpuc}{#1}%
   \addcontentsline{loa}{full}{\textit{#2}}%
#1 (\textit{#2})%
}

\def\@caption#1[#2]#3{%
   \par
   \ifthenelse{\equal{\csname ext@#1\endcsname}{lot}}
   {%
      \addcontentsline{\csname ext@#1\endcsname}{#1}
      {\tablename~\protect\numberline{\csname the#1\endcsname}{\ignorespaces #2}}
   }
   {%
      \addcontentsline{\csname ext@#1\endcsname}{#1}
      {\figurename~\protect\numberline{\csname the#1\endcsname}{\ignorespaces #2}}
   }
   \begingroup
      \@parboxrestore
      \if@minipage
         \@setminipage
      \fi
      \normalsize
      \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}
      \par
   \endgroup
}

\def\@makechapterhead#1{%
   {\noindent\sffamily\LARGE\bfseries\chaptername~\thechapter}
   \vskip 4\baselineskip
   {\noindent\LARGE\sffamily\bfseries#1}
   \vskip 1.5\baselineskip
}

\def\@makeschapterhead#1{%
   {\noindent\sffamily\huge\MakeUppercase{~}}
   \vskip 2\baselineskip
   \ifthenelse{\boolean{changepagetp}}
   {{\noindent\LARGE\sffamily\bfseries#1}}
   {%
      {%
         \begin{center}
            \noindent\LARGE\sffamily\bfseries#1
         \end{center}
      }
   }
   \vskip 1.5\baselineskip
}

\newcommand\l@symbol[2]{\noindent\makebox[6em][l]{#1}}

\newcommand\l@definition[2]{\parbox[t]{\textwidth-6em}{#1}\vskip\baselineskip\par}

\newcommand\l@abrevpuc[2]{\noindent\makebox[6em][l]{#1}}

\newcommand\l@full[2]{\parbox[t]{\textwidth-6em}{#1}\vskip\baselineskip\par}

\def\l@part#1#2{%
   \ifnum \c@tocdepth >-2\relax
      \addpenalty{-\@highpenalty}
      \addvspace{2.25em \@plus\p@}

      \setlength\@tempdima{3em}%

      \begingroup
         \parindent \z@ \rightskip \@pnumwidth
         \parfillskip -\@pnumwidth
         {%
            \leavevmode
            \large\sf\bfseries #1\hfil \hb@xt@\@pnumwidth{\hss}
         }
         \par

     \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}
      \endgroup
   \fi
}

\def\l@beforechapter#1#2{%
   \addpenalty{-\@highpenalty}%
   \vskip 1.0em \@plus\p@
   \setlength\@tempdima{1.5em}%

   \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \leavevmode %\sffamily\bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      {%
         \sffamily\bfseries #1
      }
      \par
      \vskip .1\baselineskip
      \penalty\@highpenalty
   \endgroup
}


\def\l@chapter#1#2{%
   \ifnum \c@tocdepth >\m@ne
      \addpenalty{-\@highpenalty}%
      \setlength\@tempdima{1.5em}%

      \begingroup
         \parindent \z@ \rightskip \@pnumwidth
         \parfillskip -\@pnumwidth
         \leavevmode %\sffamily\bfseries
         \advance\leftskip\@tempdima
         \hskip -\leftskip
         {%
            \sffamily\bfseries #1
         }
         \nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}
         \par
         \penalty\@highpenalty
      \endgroup
   \fi
}

\setcounter{tocdepth}{4}

%%%%%% SECTIONING %%%%%%

\setcounter{secnumdepth}{4}

\def\part{%
   \cleardoublepage
   \thispagestyle{empty}
   \secdef\@part\@spart
}

\def\@part[#1]#2{%
   \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}
   \else
      \addcontentsline{toc}{part}{#1}%
   \fi

   \markboth{}{}

   {%
      \centering
      \interlinepenalty \@M
      \normalfont
      \null\vfil
      \ifnum \c@secnumdepth >-2\relax
         \Large\sf \MakeUppercase{\partname\nobreakspace\thepart}
         \par
         \vskip 20\p@
      \fi
      \huge\bfseries\MakeUppercase{#2}\par
   }
   \vfil
}

\def\@spart#1{%
   {%
      \centering
      \interlinepenalty \@M
      \normalfont
      \null\vfil
      \huge\sf\bfseries\MakeUppercase{#1}\par
   }
   \vfil
}

\def\chapter{%
   \if@openright
      \cleardoublepage
   \else
      \clearpage
   \fi
   \global\@topnum\z@
   \@afterindentfalse
   \secdef\@chapter\@schapter
}

\def\@chapter[#1]#2{%
   \if@twoside
     \clearpage
   \else
      \cleardoublepage
   \fi
   \pagestyle{plainheader}
   \refstepcounter{chapter}
   \addcontentsline{toc}{beforechapter}{\chaptername~\thechapter}
   \addcontentsline{toc}{chapter}{#1}
   \chaptermark{#1}
   \addtocontents{lof}{\protect\addvspace{10\p@}}
   \addtocontents{lot}{\protect\addvspace{10\p@}}
   \@makechapterhead{#2}
   \vskip 3\baselineskip
   \setstretch{1.35}
}

\def\@schapter#1{%
   \if@twoside
     \clearpage
   \else
      \cleardoublepage
   \fi
   \pagestyle{plainheader}
   \addcontentsline{toc}{chapter}{#1}
   \chaptermark{#1}
   \@makeschapterhead{#1}
   \vskip 3\baselineskip
   \setstretch{1.35}
}

\def\appendix{%
   \setcounter{chapter}{0}
   \renewcommand{\thechapter}{\Alph{chapter}}
   \renewcommand{\chaptername}{\appendixname}
}

\def\section{%
   \@startsection{section}{1}{0mm}{\baselineskip}
   {.625\baselineskip}{\Large\sffamily\bfseries}
}

\def\subsection{%
   \@startsection{subsection}{2}{0mm}{\baselineskip}
   {.6\baselineskip}{\normalsize\sffamily\bfseries}
}

\def\subsubsection{%
   \@startsection{subsubsection}{3}{0mm}{1.2\baselineskip}
   {.6\baselineskip}{\normalsize\sffamily\bfseries}
}

\def\paragraph{%
   \@startsection{paragraph}{4}{0mm}{\baselineskip}
   {-1em}{\itshape}
}
