\ProvidesClass{outline-of-mechanics}[Introduction to Mechanics]
\NeedsTeXFormat{LaTeX2e}

\ProcessOptions\relax
\LoadClass[openany,twoside,scheme=chinese,fontset=none]{ctexbook}

% ----------------------------------------------------------
% 基本设置
% ----------------------------------------------------------

% 页面、版心
\RequirePackage{geometry}
\geometry{
  paperheight=203mm,
  paperwidth=140mm,
  top=27mm,
  bottom=19.8mm,
  left=21mm,
  right=15mm,
  footskip=10mm
}

% 中文行距 1.5


% 英文字体
\setmainfont{XITS}

% 中文字体，使用方正书宋、黑体、楷体、仿宋四种免费字体，采用思源字体作为书宋和黑体粗体
\setCJKmainfont[
  BoldFont=Source Han Serif SC Bold,
  ItalicFont=FZKai-Z03
]{FZShuSong-Z01}
\setCJKsansfont[
  BoldFont=Source Han Sans SC Bold
]{FZHei-B01}

\setCJKmonofont{FZFangSong-Z02}

\setCJKfamilyfont{zhsong}{FZShuSong-Z01}
\setCJKfamilyfont{zhxbs}{Source Han Serif SC Bold}
\setCJKfamilyfont{zhdbs}{Source Han Serif SC Heavy}
\setCJKfamilyfont{zhhei}{FZHei-B01}
\setCJKfamilyfont{zhdh}{Source Han Sans SC Bold}
\setCJKfamilyfont{zhfs}{FZFangSong-Z02}
\setCJKfamilyfont{zhkai}{FZKai-Z03}

\newcommand{\songti}{\CJKfamily{zhsong}}
\newcommand{\xbsong}{\CJKfamily{zhxbs}}
\newcommand{\dbsong}{\CJKfamily{zhdbs}}
\newcommand{\heiti}{\CJKfamily{zhhei}}
\newcommand{\dahei}{\CJKfamily{zhdh}}
\newcommand{\fangsong}{\CJKfamily{zhfs}}
\newcommand{\kaishu}{\CJKfamily{zhkai}}

% 汉字效果，着重号等
\RequirePackage{CJKfntef}

% ----------------------------------------------------------
% 版式
% ----------------------------------------------------------

% PDF 整页
\RequirePackage{pdfpages}

% 版式风格
\RequirePackage{fancyhdr}

% plain 版式，章标题页
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyhead[RO,LE]{\zihao{-5}\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}
% heading 版式，正文普通页
\fancypagestyle{heading}{
  \fancyhf{}
  \fancyhead[LO]{\zihao{6}\underline{力学概论}}
  \fancyhead[RE]{\zihao{6}\underline{\leftmark}}
  \fancyhead[RO,LE]{\zihao{-5}\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}
% foreword 版式，前言、目录、序等页
\fancypagestyle{foreword}{
  \fancyhf{}
  \fancyfoot[RO,LE]{\zihao{-5}\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

% 章节标题
\ctexset{
  %contentsname=~\vspace{-2em}\\\makebox[5][s]{目录}\vspace{-1em},
  chapter={
    nameformat=\zihao{4}\fangsong,
    aftername=\vspace{0.7em}\break,
    titleformat=\zihao{-3},
    beforeskip=1em,
    afterskip=2em,
   },
  section={
    %number={\arabic{chapter}$\cdot$\arabic{section}},
    format=\zihao{4}\kaishu,
    beforeskip=1.2em,
    afterskip=1em,
   }
}

% 目录
\RequirePackage[subfigure]{tocloft}
\tocloftpagestyle{foreword}
\renewcommand{\contentsname}{\bfseries\zihao{-3}\hfill\makebox[5em][s]{目录}\hfill\vspace{-1em}}
\renewcommand{\cftchapfont}{\heiti\zihao{-5}}
\renewcommand{\cftsecfont}{\zihao{-5}}
\renewcommand{\cftdot}{\ensuremath{\cdots}}
\renewcommand{\cftdotsep}{0}
\renewcommand{\cftchapdotsep}{0}
\cftbeforetoctitleskip=2em
\cftaftertoctitleskip=6em
\cftbeforechapskip=-0.14em
\cftbeforesecskip=-0.14em

% 思考题，按节处理
\newcounter{question}[chapter]
\newcommand{\question}{\stepcounter{question}\par\thequestion .}
\newenvironment{questions}{
  \refstepcounter{section}
  \addcontentsline{toc}{section}{思考题}
  \setcounter{question}{0}
  \begin{center}\textsf{\makebox[5em][s]{思考题}}\end{center}
  \fangsong
}{\normalfont}

% 习题，按节处理
\newcounter{exercise}[chapter]
\newcommand{\exercise}{\stepcounter{exercise}\par\theexercise .}
\newenvironment{exercises}{%
  \refstepcounter{section}
  \addcontentsline{toc}{section}{习题}
  \setcounter{exercise}{0}
  \begin{center}\textsf{\makebox[5em][s]{习题}} \end{center}
  \fangsong
}{\normalfont}

% ----------------------------------------------------------
% 数学排版
% ----------------------------------------------------------
\RequirePackage[fleqn]{amsmath}
% 公式缩进
\setlength{\mathindent}{6em}
% 公式按节编号
\numberwithin{equation}{section}

% 行距调整
\RequirePackage{zhlineskip}
\SetMathEnvironmentSinglespace{1.05}

% 符号
\RequirePackage{yhmath}
\RequirePackage{unicode-math}
%\RequirePackage{scalerel}

% 数学字体
\setmathfont[
  StylisticSet=8 % 直立积分符号
]{XITS Math}

\RequirePackage{etoolbox}
% 公式前导文本， align 环境
\makeatletter
\newif\if@gather@prefix
\preto\place@tag@gather{%
  \if@gather@prefix
    \iftagsleft@
      \kern-\gdisplaywidth@
      \rlap{\gather@prefix}%
      \kern\gdisplaywidth@
    \fi
  \fi
}
\appto\place@tag@gather{%
  \if@gather@prefix
    \iftagsleft@\else
      \kern-\displaywidth
      \rlap{\gather@prefix}%
      \kern\displaywidth
    \fi
  \fi
  \global\@gather@prefixfalse
}
\preto\place@tag{%
  \if@gather@prefix
    \iftagsleft@
      \kern-\gdisplaywidth@
      \rlap{\gather@prefix}%
      \kern\displaywidth@
    \fi
  \fi
}
\appto\place@tag{%
  \if@gather@prefix
    \iftagsleft@\else
      \kern-\displaywidth
      \rlap{\gather@prefix}%
      \kern\displaywidth
    \fi
  \fi
  \global\@gather@prefixfalse
}
\def\math@cr@@@align{%
  \ifst@rred\nonumber\fi
  \if@eqnsw \global\tag@true \fi
  \global\advance\row@\@ne
  \add@amps\maxfields@
  \omit
  \kern-\alignsep@
  \if@gather@prefix\tag@true\fi
  \iftag@
    \setboxz@h{\@lign\strut@{\make@display@tag}}%
    \place@tag
  \fi
  \ifst@rred\else\global\@eqnswtrue\fi
  \global\lineht@\z@
  \cr
}
\newcommand*{\beforetext}[1]{%
  \ifmeasuring@\else
    \gdef\gather@prefix{#1}%
    \global\@gather@prefixtrue
  \fi
}
\makeatother

% 向量格式
\renewcommand{\vec}[1]{{\symbfsf {#1}}}
% 求导符号
\newcommand{\dif}{\mathop{}\!\symrm{d}}
% 数学模式连字符
\mathchardef\mathdash="2D

% 数学常数
\newcommand{\e}{\mathrm e}

% 例、解、讨论
\newcounter{example}[chapter]
\newcommand{\example}{\stepcounter{example}【例~\theexample】\quad}
\newcommand{\solution}{\textsf{解}\quad}
\newcommand{\resolve}{\solution}
\newcommand{\discussion}{\heiti 讨论~\normalfont}

% ----------------------------------------------------------
% 页面元素
% ----------------------------------------------------------

% 书签、链接
\RequirePackage{hyperref}
\hypersetup{
  hidelinks,
  colorlinks=true,
  allcolors=black,
  pdfstartview=Fit,
  breaklinks=true,
  bookmarksnumbered=true,
  pdftitle=力学概论,
  %pdfpagelabels=true
}
\RequirePackage{bookmark}

% 摘录
\RequirePackage[
  leftmargin=2em,
  rightmargin=2em,
  font={fangsong},
  vskip=0pt
]{quoting}

% 图形
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\RequirePackage{wrapfig}

% 表格
\RequirePackage{tabularray}
%\UseTblrLibrary{amsmath}
\UseTblrLibrary{siunitx}
\UseTblrLibrary{booktabs}
% 自定义格式
\NewColumnType{Z}[1][]{Q[co=1,si,#1]}

% 图表标题
\RequirePackage{caption}
\DeclareCaptionFormat{table}{\heiti\zihao{-5}#1#2#3}
\captionsetup[table]{%
  position=above,
  format=table,
  skip=0.2em,
  labelsep=quad
}
\captionsetup[figure]{%
  position=below,
  format=hang,
  font=small,
  skip=0.5em,
  labelsep=quad
}

% ----------------------------------------------------------
% 注释
% ----------------------------------------------------------
% 星号脚注
\newcommand\sbfootnote[1]{%
  \begingroup
  \renewcommand\thefootnote{\fnsymbol{footnote}}
  \footnote{#1}%
  \addtocounter{footnote}{-1}%
  \endgroup
}

% ----------------------------------------------------------
% 自定义命令
% ----------------------------------------------------------
% 旧式正切余切函数名 tan cot tanh coth arctan arccot
\newcommand{\sh}{\operatorname{sh}}
\newcommand{\ch}{\operatorname{ch}}
\renewcommand{\th}{\operatorname{th}}
\newcommand{\tg}{\operatorname{tg}}
\newcommand{\ctg}{\operatorname{ctg}}
\newcommand{\tgh}{\operatorname{tgh}}
\newcommand{\ctgh}{\operatorname{ctgh}}
\newcommand{\arctg}{\operatorname{arctg}}
\newcommand{\arcctg}{\operatorname{arcctg}}

\newcommand{\lbr}{\ensuremath{\lbrbrak}}
\newcommand{\rbr}{\ensuremath{\rbrbrak}}
\newcommand{\lhbrak}{\ensuremath{\lbrbrak}}
\newcommand{\rhbrak}{\ensuremath{\rbrbrak}}