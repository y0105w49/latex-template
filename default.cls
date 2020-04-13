\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{default}[2019/10/16 y0105w49 default]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\usepackage{geometry}
\geometry{margin=1in}
\bibliographystyle{alpha}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[dvipsnames]{xcolor}
\newcommand{\invert}{\pagecolor{darkgray}\color{lightgray}}

\usepackage{amsmath,amsthm,amssymb,mathtools}
\usepackage{thm-restate}

\usepackage{tikz,tikz-cd}
\usetikzlibrary{calc,quotes,matrix,automata,positioning}

\usepackage[normalem]{ulem}
\usepackage{braket}
\usepackage[ampersand]{easylist}
\usepackage{enumerate}
\usepackage{fancybox}

\usepackage{listings}
\usepackage{algorithm}
\usepackage[noend]{algpseudocode}
\renewcommand{\algorithmicrequire}{\textbf{Input:}}
\renewcommand{\algorithmicensure}{\textbf{Output:}}

\usepackage{hyperref}
\usepackage[capitalize,noabbrev]{cleveref}
\newcommand{\creflastconjunction}{, and~}

\allowdisplaybreaks

\newcommand{\aliasenv}[2]{\newenvironment{#1}{\begin{#2}}{\end{#2}}}
\newcommand{\undef}[1]{
    \expandafter\let\csname#1\endcsname\relax
}
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

\newcommand{\todohelp}[3]{{\PackageWarning{#1}{#3}#2#1: #3}}
\newcommand{\todo}[1]{\todohelp{TODO}{\color{red}\bf}{#1}}
\newcommand{\todoq}[1]{\begin{quote}\todo{#1}\end{quote}}
\newcommand{\td}[1][!]{\todo{#1} }
\newcommand{\am}[1]{\todohelp{Antonio}{\color{Mulberry}\bf}{#1}}

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
\newcommand{\Sq}{\mathbin{\square}}
\newcommand{\op}{\operatorname}
\newcommand{\mcl}{\mathclap}
\newcommand{\sst}{\substack}
\newcommand{\SST}[1]{\mcl{\sst{#1}}}
\newcommand{\tri}{\triangle}
\newcommand{\ones}{\mathbf1}

\DeclarePairedDelimiter{\fl}{\lfloor}{\rfloor}
\DeclarePairedDelimiter{\cl}{\lceil}{\rceil}
\DeclarePairedDelimiter{\abs}{\lvert}{\rvert}
\DeclarePairedDelimiter{\norm}{\lVert}{\rVert}
\DeclarePairedDelimiter{\ang}{\langle}{\rangle}
\DeclarePairedDelimiter{\pa}{(}{)}
\DeclarePairedDelimiter{\sq}{[}{]}
\DeclarePairedDelimiter{\cu}{\{}{\}}

\DeclareMathOperator*{\amin}{arg\,min}
\DeclareMathOperator*{\amax}{arg\,max}
\DeclareMathOperator*{\Var}{Var}
\DeclareMathOperator*{\Cov}{Cov}
\DeclareMathOperator*{\E}{\mathbf E}
\undef{Pr}
\DeclareMathOperator*{\Pr}{\mathbf P}
\undef{H}
\DeclareMathOperator{\H}{\mathbf H}

\author{Antonio J. Molina Lovett}
