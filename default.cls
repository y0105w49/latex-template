\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{default}[2019/10/16 y0105w49 default]

\newif\ifshowkeys\DeclareOption{showkeys}{\showkeystrue}
\newif\ifshowkeysinline\DeclareOption{showkeys=inline}{\showkeystrue\showkeysinlinetrue}
\newif\ifdraft\DeclareOption{draft}{\drafttrue}
\newif\iffinal\DeclareOption{final}{\finaltrue}
\newif\ifdarkmode\DeclareOption{darkmode}{\darkmodetrue}
\newif\ifebook\DeclareOption{ebook}{\ebooktrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}


\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[english]{babel}
\usepackage{alphabeta}
\usepackage{fmtcount}
\usepackage{csquotes}
\usepackage[style=alphabetic]{biblatex}
\usepackage{datetime2}
\usepackage[margin=1.25in,head=15pt]{geometry}
\usepackage{fancyhdr}
\usepackage{pageslts}
\usepackage{setspace}
\usepackage{etoolbox}
\usepackage[dvipsnames]{xcolor}
\usepackage{amsmath,amsthm,amssymb,mathtools}

\ifdraft\doublespacing\fi
\AfterPreamble{\let\headtitle\@title}
\ifdraft
  \pagestyle{fancy}
  \lhead{\headtitle}
  \rhead{\DTMnow{} \theCurrentPage/\lastpageref*{LastPages}}
  \fancypagestyle{plain}{}
  \fancypagestyle{empty}{}
\else
  \renewcommand{\headrulewidth}{0pt}
\fi

\ifdraft\showkeystrue\fi
\ifshowkeysinline\PassOptionsToPackage{inline}{showlabels}\onehalfspacing\fi
\ifshowkeys\else\PassOptionsToPackage{final}{showlabels}\fi
\ifebook\geometry{margin=.25in,a5paper}\fi

\ifdarkmode\pagecolor{darkgray}\color{lightgray}\fi

\usepackage{hyperref}
\hypersetup{final}
\usepackage[capitalize,noabbrev]{cleveref}
\newcommand{\creflastconjunction}{, and~}

\usepackage{tikz,tikz-cd}
\usetikzlibrary{calc,quotes,matrix,automata,positioning}

\usepackage{thm-restate}
\usepackage[normalem]{ulem}
\usepackage{braket}
\usepackage[ampersand]{easylist}
\usepackage[inline]{enumitem}
\usepackage{fancybox}
\usepackage{multicol}
\usepackage[commentmarkup=uwave,deletedmarkup=xout]{changes}

\newcommand{\todo}[2][]{\comment[id=#1]{\PackageWarning{todos}{#1 #2}TODO #2}}
\newcommand{\td}[1][!]{\todo{#1}}
\newcommand{\cmt}[2][]{\comment[id=#1]{#2}}
\newcommand{\ch}[3][]{\replaced[id=#1]{#2}{#3}}
\newcommand{\editor@helper}[4]{
  \definechangesauthor[name=#3,color=#4]{#2}
  \@namedef{#1@cmt}##1{\cmt[#2]{##1}}
  \@namedef{#1@todo}##1##2{\todo[#2]{##2}}
  \@namedef{#1@ch}##1##2##3{\ch[#2]{##2}{##3}}
  \@namedef{#1}{
    \@ifnextchar!{\csname #1@ch\endcsname}{\@ifnextchar*{\csname #1@todo\endcsname}{\csname #1@cmt\endcsname}}
  }
}
\newcommand{\editor}[4][]{\ifthenelse{\equal{#1}{}}{\editor@helper{#2}{#2}{#3}{#4}}{\editor@helper{#1}{#2}{#3}{#4}}}
\editor[am]{AM}{Antonio}{Mulberry}

\usepackage{showlabels}
\showlabels{autocite}
\showlabels{cite}
\showlabels{textcite}
\showlabels{cref}
\showlabels{Cref}

\usepackage{listings}
\usepackage{algorithm}
\usepackage[noend]{algpseudocode}
\renewcommand{\algorithmicrequire}{\textbf{Input:}}
\renewcommand{\algorithmicensure}{\textbf{Output:}}

\allowdisplaybreaks

\newcommand{\aliasenv}[2]{\newenvironment{#1}{\begin{#2}}{\end{#2}}}
\newcommand{\undefthm}[1]{
  \expandafter\let\csname#1\endcsname\relax
  \expandafter\let\csname c@#1\endcsname\relax
}

\theoremstyle{plain}
\newtheorem{thm}{Theorem}%[section]
\newtheorem{prop}[thm]{Proposition}
\newtheorem{cor}[thm]{Corollary}
\newtheorem{lem}[thm]{Lemma}
  \crefname{lem}{Lemma}{Lemmas}
\newtheorem{conj}[thm]{Conjecture}
\newtheorem{fact}[thm]{Fact}
\newtheorem{claim}[thm]{Claim}

\theoremstyle{definition}
\newtheorem{defn}[thm]{Definition}

\theoremstyle{remark}
\newtheorem{rmk}[thm]{Remark}

\aliasenv{pf}{proof}

\renewcommand*{\env@matrix}[1][*\c@MaxMatrixCols c]{
  \hskip-\arraycolsep
  \let\@ifnextchar\new@ifnextchar
  \array{#1}
}

\newcommand{\tighten}{
  \setlength{\itemsep}{2pt}
  \setlength{\parskip}{1pt}
  \setlength{\partopsep}{1pt}
}

\newcommand{\lef}{\left}
\newcommand{\rig}{\right}
\newcommand{\N}{\mathbf{N}}
\newcommand{\Z}{\mathbf{Z}}
\newcommand{\Q}{\mathbf{Q}}
\newcommand{\R}{\mathbf{R}}
\newcommand{\C}{\mathbf{C}}
\newcommand{\F}{\mathbf{F}}
\newcommand{\mc}{\mathcal}
\newcommand{\mf}{\mathfrak}
\newcommand{\mbf}{\mathbf}
\newcommand{\lat}{\mathrm}
\newcommand{\ssf}{\mathsf}
\newcommand{\bb}{\mathbb}
\renewcommand{\sc}{\textsc}
\newcommand{\lin}{\mathsf L}
\newcommand{\dd}{\mathop{}\!d}
\newcommand{\eps}{\epsilon}
\newcommand{\se}{\subseteq}
\newcommand{\es}{\supseteq}
\newcommand{\cmp}{^{\mathsf{c}}}
\newcommand{\ol}{\overline}
\newcommand{\ul}{\underline}
\newcommand{\inv}{^{-1}}
\newcommand{\de}{\coloneqq}
\newcommand{\ed}{\eqqcolon}
\newcommand{\sm}{\setminus}
\newcommand{\tr}{^{\mathsf{T}}}
\newcommand{\bp}{\begin{pmatrix}}
\newcommand{\ep}{\end{pmatrix}}
\newcommand{\yields}{\vdash}
\newcommand{\fa}{\forall}
\newcommand{\te}{\exists}
\renewcommand{\a}{\alpha}
\newcommand{\G}{\Gamma}
\newcommand{\m}{\models}
\newcommand{\y}{\yields}
\newcommand{\s}{\sigma}
\renewcommand{\S}{\Sigma}
\newcommand{\g}{\gamma}
\renewcommand{\b}{\beta}
\newcommand{\mt}{\emptyset}
\newcommand{\p}{\partial}
\newcommand{\we}{\wedge}
\renewcommand{\t}{\tilde}
\newcommand{\wh}{\widehat}
\newcommand{\vphi}{\varphi}
\newcommand{\vrho}{\varrho}
\newcommand{\veps}{\varepsilon}
\renewcommand{\it}{\intertext}
\newcommand{\sit}{\shortintertext}
\renewcommand{\t}{\text}
\renewcommand{\l}{\ell}
\newcommand{\acts}{\lefttorightarrow}
\newcommand{\incl}{\hookrightarrow}
\newcommand{\hra}{\hookrightarrow}
\newcommand{\xra}{\xrightarrow}
\newcommand{\xRa}{\xRightarrow}
\newcommand{\dc}{\dotsc}
\newcommand{\db}{\dotsb}
\newcommand{\dm}{\dotsm}
\newcommand{\restr}{\restriction}
\newcommand{\os}{\overset}
\newcommand{\us}{\underset}
\newcommand{\Sq}{\mathbin{\square}}
\newcommand{\op}{\operatorname}
\newcommand{\mcl}{\mathclap}
\newcommand{\sst}{\substack}
\newcommand{\SST}[1]{\mcl{\sst{#1}}}
\newcommand{\tri}{\triangle}
\newcommand{\ones}{\mathbf1}
\newcommand{\lims}{\limits}
\newcommand{\nlims}{\nolimits}
\newcommand{\co}{\colon}
\newcommand{\na}{\nabla}
\newcommand{\gr}{\nabla}

\DeclarePairedDelimiter{\fl}{\lfloor}{\rfloor}
\DeclarePairedDelimiter{\cl}{\lceil}{\rceil}
\DeclarePairedDelimiter{\abs}{\lvert}{\rvert}
\DeclarePairedDelimiter{\norm}{\lVert}{\rVert}
\DeclarePairedDelimiter{\ang}{\langle}{\rangle}
\DeclarePairedDelimiter{\pa}{(}{)}
\DeclarePairedDelimiter{\sq}{[}{]}
\DeclarePairedDelimiter{\cu}{\{}{\}}
\DeclarePairedDelimiter{\clop}{[}{)}
\DeclarePairedDelimiter{\opcl}{(}{]}

\DeclareMathOperator*{\amin}{arg\,min}
\DeclareMathOperator*{\amax}{arg\,max}
\DeclareMathOperator*{\Var}{Var}
\DeclareMathOperator*{\Cov}{Cov}
\DeclareMathOperator*{\E}{\mathbf E}
\undef{\Pr}\DeclareMathOperator*{\Pr}{\mathbf P}
\undef{\H}\DeclareMathOperator{\H}{\mathbf H}

\author{Antonio J. Molina Lovett}
