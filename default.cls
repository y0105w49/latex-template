% -*- TeX-master: "main"; -*-
% !TEX root=main.tex

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{default}[2019/10/16 y0105w49 default]

\newif\ifshowkeys\DeclareOption{showkeys}{\showkeystrue}
\newif\ifshowkeysinline\DeclareOption{showkeys=inline}{\showkeystrue\showkeysinlinetrue}
\newif\ifdraft\DeclareOption{draft}{\drafttrue}
\newif\iffinal\DeclareOption{final}{\finaltrue}
\newif\ifdarkmode\DeclareOption{darkmode}{\darkmodetrue}
\newif\ifheader\DeclareOption{header}{\headertrue}
\newif\ifcropped\DeclareOption{cropped}{\croppedtrue}
\newif\ifpcropped\DeclareOption{pcropped}{\pcroppedtrue}
\newif\iffullcites\DeclareOption{fullcites}{\fullcitestrue}
\newif\ifsentencecase\DeclareOption{sentencecase}{\sentencecasetrue}
\newif\ifsectionthms\DeclareOption{sectionthms}{\sectionthmstrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}


\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[canadian]{babel}
\usepackage{newunicodechar}
\usepackage{fmtcount}
\usepackage{csquotes}
\usepackage[style=alphabetic,alldates=year]{biblatex}
\usepackage{datetime2}
\usepackage[margin=1in,head=15pt]{geometry}
\usepackage{fancyhdr}
\usepackage{pageslts}
\usepackage{setspace}
\usepackage{etoolbox}
\usepackage{amsmath,amsthm,amssymb,mathtools}

\usepackage[dvipsnames]{xcolor}
\usepackage{bm}
\usepackage{libertine,libertinust1math}

\ifdraft\doublespacing\fi
\ifdraft\showkeystrue\fi
\ifshowkeysinline\PassOptionsToPackage{inline}{showlabels}\onehalfspacing\fi
\ifshowkeys\else\PassOptionsToPackage{final}{showlabels}\fi
\ifcropped\geometry{margin=.22in,bottom=.5in}\fi
\ifpcropped\geometry{margin=.6in,bottom=.5in}\fi
\ifdarkmode
  \pagecolor{darkgray}
  \color{lightgray}
  \definecolor{textfull}{gray}{1}
\else
  \definecolor{textfull}{gray}{0}
\fi


\AfterPreamble{\let\headtitle\@title}
\ifdraft\headertrue\fi
\ifheader
  \ifcropped\geometry{top=.6in}\fi
  \pagestyle{fancy}
  \lhead{\headtitle}
  % \rhead{\DTMnow{}\enspace(\theCurrentPage/\lastpageref*{LastPages})}
  \rhead{\Today{}\enspace(\theCurrentPage/\lastpageref*{LastPages})}
  \fancypagestyle{plain}{}
  \fancypagestyle{empty}{}
\else
  \renewcommand{\headrulewidth}{0pt}
\fi

\ifdraft\fullcitestrue\fi
\iffullcites
  \AtEveryBibitem{{\scriptsize\color{gray}\url {file:///Users/antonio/Dropbox/papers/\thefield{entrykey}.pdf}\par}}
\else
  \AtEveryBibitem{\clearfield{url}}
  \AtEveryBibitem{\clearfield{eprintclass}}
\fi
\ifsentencecase\DeclareFieldFormat{titlecase}{\MakeSentenceCase*{#1}}\fi

\usepackage{hyperref}
\hypersetup{final}
\usepackage[capitalize,noabbrev]{cleveref}
\newcommand{\creflastconjunction}{, and~}
\crefformat{footnote}{#2\footnotemark[#1]#3}
\hypersetup{
  colorlinks,
  linkcolor={red!50!textfull},
  citecolor={green!25!textfull},
  urlcolor={blue!50!textfull},
}

\usepackage{tikz,tikz-cd}
\usetikzlibrary{calc,quotes,matrix,automata,positioning}

\usepackage{thm-restate}
% \usepackage[normalem]{ulem}
\usepackage{braket}
\usepackage[ampersand]{easylist}
\usepackage[inline]{enumitem}
\usepackage{fancybox}
\usepackage{multicol}
\usepackage[commentmarkup=uwave,deletedmarkup=xout]{changes}

\newcommand{\todo}[2][]{\iffinal\PackageWarning{todos}{[#1] #2}\fi\comment[id=#1]{TODO #2}}
\newcommand{\td}[1][!]{\todo{#1}}
\newcommand{\cmt}[2][]{\comment[id=#1]{#2}}
\newcommand{\ch}[3][]{\replaced[id=#1]{#2}{#3}}
\newcommand{\editor@helper}[4]{
  \definechangesauthor[name=#3,color=#4]{#2}
  \@namedef{#1@cmt}##1{\cmt[#2]{##1}}
  \@namedef{#1@todo}##1##2{\todo[#2]{##2}}
  \@namedef{#1@ch}##1##2##3{\ch[#2]{##2}{##3}}
  \@namedef{#1}{%
    \@ifnextchar/{\csname #1@ch\endcsname}{\@ifnextchar!{\csname #1@todo\endcsname}{\csname #1@cmt\endcsname}}%
  }
}
\NewDocumentCommand{\editor}{O{#2}mmm}{\editor@helper{#1}{#2}{#3}{#4}}
\editor[a]{AM}{Antonio}{Mulberry}

\usepackage{showlabels}
\showlabels{autocite} % cite
\showlabels{cite} % cite as object, singular
\showlabels{Cite}
\showlabels{textcite} % in-text subject, plural.
\showlabels{Textcite}
\showlabels{cref}
\showlabels{Cref}

\usepackage{listings}
\usepackage{algorithm}
\usepackage[noend]{algpseudocode}
\renewcommand{\algorithmicrequire}{\textbf{Input:}}
\renewcommand{\algorithmicensure}{\textbf{Output:}}

\allowdisplaybreaks{}

\newcommand{\aliasenv}[2]{\newenvironment{#1}{\begin{#2}}{\end{#2}}}
\newcommand{\undefthm}[1]{
  \expandafter\let\csname#1\endcsname\relax
  \expandafter\let\csname c@#1\endcsname\relax
}

\theoremstyle{plain}
\ifsectionthms
\newtheorem{theorem}{Theorem}[section]
\else
\newtheorem{theorem}{Theorem}
\fi
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{lemma}[theorem]{Lemma}
  \crefname{lemma}{Lemma}{Lemmas}
\newtheorem{conjecture}[theorem]{Conjecture}
\newtheorem{fact}[theorem]{Fact}
\newtheorem{claim}[theorem]{Claim}

\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}

\theoremstyle{remark}
\newtheorem{remark}[theorem]{Remark}

\renewcommand*{\env@matrix}[1][*\c@MaxMatrixCols c]{%
  \hskip-\arraycolsep%
  \let\@ifnextchar\new@ifnextchar%
  \array{#1}%
}

\newcommand{\tighten}{%
  \setlength{\itemsep}{2pt}%
  \setlength{\parskip}{1pt}%
  \setlength{\partopsep}{1pt}%
}

\DeclarePairedDelimiter{\fl}{\lfloor}{\rfloor}
\DeclarePairedDelimiter{\cl}{\lceil}{\rceil}
\DeclarePairedDelimiter{\abs}{\lvert}{\rvert}
\DeclarePairedDelimiter{\nrm}{\lVert}{\rVert}
\DeclarePairedDelimiter{\ang}{\langle}{\rangle}
\DeclarePairedDelimiter{\p}{\lparen}{\rparen}
\DeclarePairedDelimiter{\s}{\lbrack}{\rbrack}
\DeclarePairedDelimiter{\cu}{\lbrace}{\rbrace}
\DeclarePairedDelimiter{\clop}{\lbrack}{\rparen}
\DeclarePairedDelimiter{\opcl}{\lparen}{\rbrack}

\DeclareMathOperator*{\amin}{arg\,min}
\DeclareMathOperator*{\amax}{arg\,max}
\DeclareMathOperator*{\Var}{Var}
\DeclareMathOperator*{\Cov}{Cov}
\DeclareMathOperator*{\E}{\mathbb E}
\undef{\Pr}\DeclareMathOperator*{\Pr}{\mathbb P}
\DeclareMathOperator{\diag}{diag}

\newcommand{\lef}{\left}
\newcommand{\rig}{\right}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\F}{\mathbb{F}}
\newcommand{\mc}{\mathcal}
\newcommand{\mf}{\mathfrak}
\newcommand{\mb}{\mathbf}
\newcommand{\lat}{\mathrm}
\newcommand{\ssf}{\mathsf}
\newcommand{\bb}{\mathbb}
\newcommand{\tsc}{\textsc}
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
\newcommand{\fa}{\forall}
\newcommand{\te}{\exists}
\newcommand{\mt}{\emptyset}
\newcommand{\pa}{\mathop{}\!\partial}
\NewDocumentCommand{\gr}{e{_^}}{\mathop{}\!\nabla\IfValueT{#1}{_{\!#1}}\IfValueT{#2}{^{#2}}}
\newcommand{\til}{\tilde}
\newcommand{\wh}{\widehat}
\newcommand{\vphi}{\varphi}
\newcommand{\vrho}{\varrho}
\newcommand{\veps}{\varepsilon}
\newcommand{\itx}{\intertext}
\newcommand{\sitx}{\shortintertext}
\newcommand{\tx}{\text}
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
\newcommand{\ones}{\mathbf1}
\newcommand{\lims}{\limits}
\newcommand{\nlims}{\nolimits}
\newcommand{\co}{\colon}

\newcommand{\upgreek}[1]{{\mathrm #1}}
\newcommand{\Alpha}{\upgreek A}
\newcommand{\Beta}{\upgreek B}
\newcommand{\Epsilon}{\upgreek E}
\newcommand{\Zeta}{\upgreek Z}
\newcommand{\Eta}{\upgreek H}
\newcommand{\Iota}{\upgreek I}
\newcommand{\Kappa}{\upgreek K}
\newcommand{\Mu}{\upgreek M}
\newcommand{\Nu}{\upgreek N}
\newcommand{\omicron}{o}
\newcommand{\Omicron}{\upgreek O}
\newcommand{\Rho}{\upgreek P}
\newcommand{\Tau}{\upgreek T}
\newcommand{\Chi}{\upgreek X}
\newunicodechar{α}{\alpha}
\newunicodechar{Α}{\Alpha}
\newunicodechar{β}{\beta}
\newunicodechar{Β}{\Beta}
\newunicodechar{γ}{\gamma}
\newunicodechar{Γ}{\Gamma}
\newunicodechar{δ}{\delta}
\newunicodechar{Δ}{\Delta}
\newunicodechar{ε}{\varepsilon}
\newunicodechar{Ε}{\Epsilon}
\newunicodechar{ζ}{\zeta}
\newunicodechar{Ζ}{\Zeta}
\newunicodechar{η}{\eta}
\newunicodechar{Η}{\Eta}
\newunicodechar{θ}{\theta}
\newunicodechar{Θ}{\Theta}
\newunicodechar{ι}{\iota}
\newunicodechar{Ι}{\Iota}
\newunicodechar{κ}{\kappa}
\newunicodechar{Κ}{\Kappa}
\newunicodechar{λ}{\lambda}
\newunicodechar{Λ}{\Lambda}
\newunicodechar{μ}{\mu}
\newunicodechar{Μ}{\Mu}
\newunicodechar{ν}{\nu}
\newunicodechar{Ν}{\Nu}
\newunicodechar{ξ}{\xi}
\newunicodechar{Ξ}{\Xi}
\newunicodechar{ο}{\omicron}
\newunicodechar{Ο}{\Omicron}
\newunicodechar{π}{\pi}
\newunicodechar{Π}{\Pi}
\newunicodechar{ρ}{\rho}
\newunicodechar{Ρ}{\Rho}
\newunicodechar{σ}{\sigma}
\newunicodechar{Σ}{\Sigma}
\newunicodechar{τ}{\tau}
\newunicodechar{Τ}{\Tau}
\newunicodechar{υ}{\upsilon}
\newunicodechar{Υ}{\Upsilon}
\newunicodechar{φ}{\varphi}
\newunicodechar{Φ}{\Phi}
\newunicodechar{χ}{\chi}
\newunicodechar{Χ}{\Chi}
\newunicodechar{ψ}{\psi}
\newunicodechar{Ψ}{\Psi}
\newunicodechar{ω}{\omega}
\newunicodechar{Ω}{\Omega}

\newunicodechar{∂}{\pa}
\newunicodechar{∇}{\gr}
\newunicodechar{√}{\sqrt}

\author{Antonio J. Molina Lovett}
