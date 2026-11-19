# IS 412 Capstone 1 Manuscript LaTeX Template

JRMSU College of Computing Studies — IS 412 Capstone 1 Manuscript Template (Overleaf & local TeX compatible).

## Files
- `main.tex` — Main manuscript file (compile this file)
- `frontmatter/` — Front matter sections:
  - `cover.tex` — Cover page
  - `certification.tex` — Certification page
  - `approval.tex` — Approval sheet
  - `acknowledgement.tex` — Acknowledgement section
  - `dedication.tex` — Dedication section
  - `abstract.tex` — Abstract section
  - `lists.tex` — List of Figures and List of Tables
- `chapters/` — Main manuscript chapters:
  - `chapter1.tex` to `chapter5.tex` — Chapters 1–5
  - `references.tex` — References section
- `appendices/` — Appendix sections (`appendices.tex`, `appendixA.tex` to `appendixI.tex`)
- `images/` — Put all images/logos/diagrams in this directory (`image1.png`, `image2.jpeg`, `image3.png`, `image4.jpeg`)
- `build.bat` / `build.ps1` — Optional Windows build scripts for local XeLaTeX compilation

## Overleaf Usage (Recommended for Students)
1. Download or zip this repository (`main.tex`, `frontmatter/`, `chapters/`, `appendices/`, `images/`).
2. In [Overleaf](https://www.overleaf.com/), click **New Project → Upload Project** and upload the `.zip` file.
3. Click **Recompile**. It works out of the box with Overleaf's default **pdfLaTeX** compiler (and also supports **XeLaTeX** and **LuaLaTeX**).

## Local Requirements
- LaTeX distribution (MiKTeX on Windows, TeX Live / `texlive-most` on Linux, MacTeX on macOS)
- Build locally with `build.bat`, `.\build.ps1`, VS Code (`Ctrl+Shift+B`), or:
  ```cmd
  xelatex -interaction=nonstopmode main.tex
  xelatex -interaction=nonstopmode main.tex
  ```
- Minimum required packages (automatically installed on MiKTeX / pre-installed on Overleaf):
  `{iftex}`, `{mathptmx}`, `{geometry}`, `{setspace}`, `{graphicx}`, `{xcolor}`, `{array}`, `{tabularx}`, `{float}`, `{enumitem}`, `{indentfirst}`, `{chngcntr}`, `{caption}`, `{fancyhdr}`, `{titlesec}`, `{tocloft}`, `{hyperref}`

## Fill It In
- Edit the title, researcher names, office, adviser, dates, etc. **once** in the `EDIT YOUR DETAILS HERE` block of `main.tex`.
- Placeholders stay in `[square brackets]` so you can search for `[` to find what is left to write.
- Replace a placeholder box (`\figbox{[Insert ...]}{Caption}`) with an image:
  ```latex
  \begin{figure}[H]\centering
    \includegraphics[width=\linewidth]{images/yourfile.png}
    \caption{Caption}
  \end{figure}
  ```
- Figure/table numbers are automatic and continuous. Set `\autoliststrue` in `main.tex` to generate the List of Figures and List of Tables automatically from your captions.
- Layout: Letter paper, 1" top/bottom/right, 1.5" left; Times New Roman 12 pt (XeLaTeX/LuaLaTeX) or Times/mathptmx (pdfLaTeX/Overleaf); roman page numbers (bottom center) before Chapter 1, then arabic (top right).

## Format & References
- JRMSU College of Computing Studies — IS 412 Capstone 1 Manuscript (`Capstone_1_Manuscript.docx`)
- ICS Thesis Template by JCE Plaras: https://github.com/jceplaras/icsthesislatextemplate
