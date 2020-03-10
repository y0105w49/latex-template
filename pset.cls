\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pset}[2019/10/16 y0105w49 problem set]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{default}}
\ProcessOptions\relax
\LoadClass{default}

\def\@maketitle{
    \newpage
    \begingroup
    \centering
    \let\footnote\thanks
    {\large\textbf{\@title}\par}
    \vskip 0.5\baselineskip
    \begin{tabular}[t]{c}
    \@author
    \end{tabular}\par
    \vskip0.5\baselineskip
    \@date
    \par
    \endgroup
    \vskip\baselineskip
}

\newtheoremstyle{problem}
    {}{}
    {}{}
    {\bfseries}{.}
    { }
    {\thmname{#1}\@ifnotempty{#1}{ }\thmnumber{\@ifempty{#3}{#2}\@ifnotempty{#3}{#3}}}
\theoremstyle{problem}
\newtheorem{prob}{Problem}
\newtheorem{bprob}[prob]{Extra Credit}
\newtheorem{sprob}{}[prob]
\renewcommand{\thesprob}{(\alph{sprob})}
\newtheorem{ssprob}{}[sprob]
\renewcommand{\thessprob}{\roman{ssprob}}
\newcommand{\pp}{\endssprob\endsprob\endprob\prob}
\newcommand{\ppp}{\endssprob\endsprob\sprob}
\newcommand{\pppp}{\endssprob\ssprob}
\newcommand{\closepp}{\endssprob\endsprob\endprob}

\theoremstyle{plain}
\undefthm{lem}
\newtheorem{lem}{Lemma}[prob]
\renewcommand{\thelem}{\arabic{lem}}
\newtheorem{case}{Case}[ssprob]
\renewcommand{\thecase}{\arabic{case}}
\newtheorem{scase}{}[case]

\numberwithin{equation}{prob}
\renewcommand\theequation{\arabic{equation}}
