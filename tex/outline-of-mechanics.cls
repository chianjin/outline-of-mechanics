\ProvidesClass{outline-of-mechanics}[Introduction to Mechanics]
\NeedsTeXFormat{LaTeX2e}

\ProcessOptions\relax
\LoadClass[openany,fontset=none]{ctexbook}

% ----------------------------------------------------------
% 字体
% ----------------------------------------------------------
% 英文字体
\setmainfont[
    BoldFont=XITS-Bold.otf,
    ItalicFont=XITS-Italic.otf,
    BoldItalicFont=XITS-BoldItalic.otf
    ]{XITS-Regular.otf}

% 中文字体，使用CTeX内置方正字体设置
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

\RequirePackage{CJKfntef}

% ----------------------------------------------------------
% 排版格式
% ----------------------------------------------------------

% 版心：大32开, textwidth=103mm
\RequirePackage[
    paperheight=203mm,
    paperwidth=140mm,
    top=27mm,
    bottom=20mm,
    left=21mm,
    right=16mm,
    footskip=10mm
    ]{geometry}

%\RequirePackage[fontsize=10.5pt]{grid}

% 修改行距，适应行内公式间距
\setlength{\lineskip}{3.5pt}
\setlength{\lineskiplimit}{3.5pt}

% ----------------------------------------------------------
% 版式
% ----------------------------------------------------------
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

% ----------------------------------------------------------
% 标题格式
% ----------------------------------------------------------
% 章节标题设置
\ctexset{
    contentsname=~\vspace{-2em}\\目~~~~录\vspace{-1em},
    chapter={
        name={第,章},
        nameformat=\zihao{4}\fangsong,
        aftername=\vspace{1em}\break,
        titleformat+=\zihao{-3},
        beforeskip=0.5em,
        afterskip=2.5em,
},
    section={
        %number={\arabic{chapter}$\cdot$\arabic{section}},
        format=\zihao{4}\kaishu,
        afterskip=1em,
        beforeskip=1.5em,
}
}
% 绪论标题
\newcommand{\chapterx}[2][绪~~~~论]{
    \ctexset{
        chapter={
            number={#1},
            name={},
        }
    }
\addtocounter{chapter}{-1}
    \chapter{#2}
    %\addcontentsline{#1#2}
    \ctexset{
        chapter={
            number={\chinese{chapter}},
            name={第,章},
        }
    }

}

% 目录
\RequirePackage{titletoc}
\RequirePackage{titlesec}

\dottedcontents{chapter}[4em]{\vspace{-0.3518em}\heiti}{5em}{0.5pc}
\dottedcontents{section}[4em]{\vspace{-0.3518em}}{2em}{0.5pc}

% 思考题，按节处理
\newcounter{question}
\newcommand{\question}{\refstepcounter{question}\par\thequestion .}
\newenvironment{questions}{
    \refstepcounter{section}
    \addcontentsline{toc}{section}{思考题}
    \setcounter{question}{0}
    \begin{center}\textsf{思~~考~~题}\end{center}
    \fangsong
    }
    {\normalfont}

% 习题，按节处理
\newcounter{exercise}
\newcommand{\exercise}{\refstepcounter{exercise}\par\theexercise .}
\newenvironment{exercises}{%
    \refstepcounter{section}
    \addcontentsline{toc}{section}{习题}
    \setcounter{exercise}{0}
    \begin{center}\textsf{习~~~~~~题} \end{center}
    \fangsong
    }
    {\normalfont}

\RequirePackage[
    leftmargin=2em,
    rightmargin=2em,
    font={fangsong},
    vskip=\lineskip
    ]{quoting}
% ----------------------------------------------------------
% 排版元素
% ----------------------------------------------------------
% PDF单页
\RequirePackage{pdfpages}

\RequirePackage{hyperref}
\hypersetup{
    hidelinks,
    colorlinks=true,
    allcolors=black,
    pdfstartview=Fit,
    breaklinks=true
}

%\RequirePackage{bookmark}

% 单位
\RequirePackage{siunitx}

% 数学公式
\RequirePackage[fleqn]{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{yhmath}
\RequirePackage{unicode-math}
\setmathfont[
    BoldFont=XITSMath-Bold.otf,
    StylisticSet=8 % 直立积分符号
    ]{XITSMath-Regular.otf}
\setlength{\mathindent}{6em} % 数学公式左缩进 6em

% 行距
\RequirePackage{zhlineskip}

% 公式按节编号
\numberwithin{equation}{section}

% 向量字体
\renewcommand{\vec}[1]{{\symbfsf {#1}}}

% 数学模式连字符
\mathchardef\mathdash="2D

% 数学常数
\newcommand{\e}{\mathrm e}

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
% 求导符号
\newcommand{\dif}{\mathop{}\!\symrm{d}}
%
\newcommand{\sumx}{\textstyle\sum\limits}

% 例、解、讨论
\newcounter{example}[chapter]
\newcommand{\example}{\refstepcounter{example}【例~\theexample】\quad}
\newcommand{\solution}{\textsf{解}\quad}
\newcommand{\resolve}{\solution}
\newcommand{\discussion}{\heiti 讨论~\normalfont}

% 表格
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{makecell}
\RequirePackage{tabularx}
\renewcommand{\tabularxcolumn}[1]{m{#1}}
\newcolumntype{C}{>{\centering\arraybackslash}X}
%\newcolumntype{L}{>{\centering\arraybackslash}X}
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}
\newenvironment{tablex}[1][htbp]
{
    \begin{table}[#1]
        \vspace{-0.5em}
}
{
        \vspace{-1.2em}
    \end{table}
}

% 图片
%\RequirePackage{import}
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\newenvironment{figurex}[1][htbp]
{
    \begin{figure}[#1]
    \vspace{-0.5em}
}
{
    \vspace{-1.2em}
    \end{figure}
}

% 图表标题
\RequirePackage{caption}
\DeclareCaptionFormat{table}{\heiti\zihao{-5}#1#2#3}
\captionsetup[table]{%
    position=above,
    format=table,
    skip=0.1em,
    labelsep=space
}
\captionsetup[figure]{%
    position=below,
    format=hang,
    font=small,
    skip=0.1em,
    labelsep=space
}

% 作图
\RequirePackage{tikz}
\RequirePackage{tkz-euclide}

% 图表绕排
\RequirePackage{wrapfig}

% 单位
\RequirePackage{siunitx}

% 下划线
\RequirePackage{ulem}

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

% 无符号校注
%\newcommand\blfootnote[1]{%
%    \begingroup
%    \renewcommand\thefootnote{}\footnote{#1}%
%    \addtocounter{footnote}{-1}%
%    \endgroup
%}

% 校注
\RequirePackage{marginnote}
\RequirePackage{endnotes}
\RequirePackage{xparse}
\def\makeenmark{[\,\theenmark\,]~}
\def\enotesize{\normalsize}
\renewcommand{\notesname}{\heiti 重排校注}
%\NewDocumentCommand{\erratanote}{mmoo}{%
%    #1\marginnote{$^{\endnotemark}$}
%    \IfNoValueT{#4}{\label{err:\theenmark}}
%    %\edef\addnotetext\IfValueT{#3}{#3}
%    \addtoendnotes{\par\makeenmark\hspace{0.5em}%
%        #1：原文“#2”。\IfValueT{#3}{#3} (%
%            \IfNoValueTF{#4}
%                {\noexpand\pageref{err:\theenmark}}
%                {\pageref{#4}}%
%            页%
%        )%
%    }%
%}

% ----------------------------------------------------------
% 自定义命令
% ----------------------------------------------------------
\newcommand{\hsp}{}
\newcommand{\lhbrak}{〔}
\newcommand{\rhbrak}{〕}
\newcommand{\mlhbrak}{\lbrbrak}
\newcommand{\mrhbrak}{\rbrbrak}
