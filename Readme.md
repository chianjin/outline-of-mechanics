# 《力学概论》重排本

本项目旨在使用 $\LaTeX$ 重排《力学概论》一书。



## 字体设置

### 英文字体

英文使用 $\TeX$ Live 发行版本自带的 XITS 系列字体。

#### 正文字体

- Regular: XITS-Regular.otf
- Bold: XITS-Bold.otf
- Italic: XITS-Italic.otf
- Bold Italic: XITS-BoldItalic.otf

```latex
\setmainfont[
	BoldFont=XITS-Bold.otf,
	ItalicFont=XITS-Italic.otf,
	BoldItalicFont=XITS-BoldItalic.otf
	]{XITS-Regular.otf}
```

#### 数学字体

导入 unicode-math 以支持英文字体设置

- Regular: XITSMath-Regular.otf
- Bold: XITSMath-Bold.otf

```latex
\setmathfont[
	BoldFont=XITSMath-Bold.otf
	]{XITSMath-Regular.otf}
```

### 中文字体

中文采用四款方正商业免费字体（GBK），配合思源字体作为相应字体粗体。

- 宋体：方正书宋_GBK（FZShuSong-Z01），粗体：小标宋，斜体：楷体
- 小标宋：思源宋体粗体（Source Han Serif SC Bold）
- 大标宋：思源宋体超粗（Source Han Serif SC Heavy）
- 黑体：方正黑体_GBK（FZHei-B01），粗体：大黑
- 大黑：思源黑体粗体（Source Han Sans SC Bold）
- 楷体：方正楷体_GBK（FZKai-Z03）
- 仿宋：方正仿宋_GBK（FZFangSong-Z02）

```latex
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
```

