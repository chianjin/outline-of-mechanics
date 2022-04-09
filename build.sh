# ------------------------------------------------
# ->> Source and dist file names
# ------------------------------------------------
PDFFileName=力学概论
TeXFileName=introMech
# ------------------------------------------------
# ->> Set Compiler
# ------------------------------------------------
Compiler=latexmk -xelatex
# ------------------------------------------------
# ->> Set build directory
# ------------------------------------------------
BuildPath=build
SourcePath=src
if [ ! -d ${BuildPath} ]
then
    mkdir ${BuildPath}
fi
# ------------------------------------------------
# ->> Build textual content
# ------------------------------------------------
cd ${SourcePath}
$Compiler -synctex=1 -interaction=nonstopmode -output-directory=../${BuildPath} ${TeXFileName}.tex
cd ..
# ------------------------------------------------
# ->> Rename output PDF filename
# ------------------------------------------------
if [ -f ${PDFFileName}.pdf ]
then
    rm ${PDFFileName}.pdf
fi
if [ -f ${BuildPath}/${TeXFileName}.pdf ]
then
    cp ${BuildPath}/${TeXFileName}.pdf ${PDFFileName}.pdf
fi
echo ------------------------------------------------
echo $Compiler ${TeXFileName} finished...
echo ------------------------------------------------
