# 《力学概论》$\LaTeX$ 重排本

《力学概论》，方励之、李淑娴合著，安徽科学技术出版社出版。1986年1月第一次出版。

作者自述道：“这本书原是一份普通物理课程的力学讲义，它曾在中国科学技术大学沿用多年，也曾在北京大学教授过数次。”实际上，即使在某事件之后学校改用梁昆淼先生的《力学》作为正式教科书，也在相当长的一段时间内作为实际的教科书在科大学子和老师中沿用。

由于某些原因，该书已经不可能再出版了，纸质书籍也难以觅得踪迹。网上仅见一份1986年1月第1版第1次印刷的扫描本，精度较差，字迹模糊，不少细节难以分辨。本重排版采用$\LaTeX$ 根据该扫描本重新编排并绘制了全部插图（个别图片替换为网上寻得的高清晰图片），对明显的错漏做了更正。

由于原书铅字排版印刷，与$\LaTeX$ 排版相比，再各排版间距上有很大差异。在重排过程中，无法实现完全相同的效果，只能在可能的情况下，尽量按照原书页码安排内容。

重排本全部源代码文件在网上公开，项目地址如下：

https://github.com/chianjin/outline-of-mechanics

当然个人精力、水平有限，亦难免遗漏或者改错之处。阅读者如有发现，可前往上述网址讨论或提交相关信息。如有兴趣者，亦可在上述项目网址联系本人参与修订。

## 下载地址

GitHub : [Releases · chianjin/outline-of-mechanics · GitHub](https://github.com/chianjin/outline-of-mechanics/releases)

百度网盘 : https://pan.baidu.com/s/1NrHRigBab635aR77eTGOyQ?pwd=q817 

阿里云盘 : https://www.aliyundrive.com/s/B7fhNm7JmwL

## 字体设置

### 英文字体

英文使用 $\TeX$ Live 发行版本自带的 XITS 系列字体。

#### 正文字体

- Regular: XITS-Regular.otf
- Bold: XITS-Bold.otf
- Italic: XITS-Italic.otf
- Bold Italic: XITS-BoldItalic.otf

```latex
\setmainfont{XITS}
```

#### 数学字体

导入 unicode-math 以支持英文字体设置

- Regular: XITSMath-Regular.otf
- Bold: XITSMath-Bold.otf

```latex
\setmathfont{XITS Math}[StylisticSet=8]
```

选项`StylisticSet=8`，表示使用直立积分符号。

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
\setCJKmainfont{FZShuSong-Z01}[
    BoldFont={Source Han Serif SC Bold},
    ItalicFont=FZKai-Z03
    ]
\setCJKsansfont{FZHei-B01}[
    BoldFont={Source Han Sans SC Bold}
    ]
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

## 特别提示

该书的版权、著作权由原作者、出版机构及该书权利人所有。如需商用，请与原作者、出版机构及该书权利人联系。

本重排版仅作个人学习之用。若有侵犯原书相关权利人权利，请联系本人删除网络发布。
