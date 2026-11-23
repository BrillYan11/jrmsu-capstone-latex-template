# IS 412 Capstone 1 Manuscript LaTeX Template

JRMSU College of Computing Studies - IS 412 Capstone 1 Manuscript Template (Overleaf & local TeX compatible).

## Files
- `main.tex` - Main manuscript file (compile this file)
- `sample_output.pdf` - Compiled sample PDF output of the template
- `frontmatter/` - Front matter sections:
  - `cover.tex` - Cover page
  - `certification.tex` - Certification page
  - `approval.tex` - Approval sheet
  - `acknowledgement.tex` - Acknowledgement section
  - `dedication.tex` - Dedication section
  - `abstract.tex` - Abstract section
  - `lists.tex` - List of Figures and List of Tables
- `chapters/` - Main manuscript chapters:
  - `chapter1.tex` to `chapter5.tex` - Chapters 1-5
  - `references.tex` - References section
- `appendices/` - Appendix sections (`appendices.tex`, `appendixA.tex` to `appendixI.tex`)
- `images/` - Put all images/logos/diagrams in this directory (`image1.png`, `image2.jpeg`, `image3.png`, `image4.jpeg`)
- `build.bat` / `build.ps1` - Optional Windows build scripts for local XeLaTeX compilation

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
- **Sample: Inserting a Photo (Figure)** — put your image inside `images/`, then replace `\figbox{...}{...}` with:
  ```latex
  \begin{figure}[H]
    \centering
    \includegraphics[width=0.75\linewidth]{images/yourfile.png}
    \caption{Sample System Screenshot}
    \label{fig:sample-screenshot}
  \end{figure}
  ```
  Reference it in a sentence with `As shown in Figure~\ref{fig:sample-screenshot}, ...`. Adjust `width=0.75\linewidth` (e.g. `0.5\linewidth` to `1.0\linewidth`) to resize.
- **Sample: Inserting a Table** — caption goes at the top; `Y` is a left-aligned auto-width column, `C` is centered, and `\hd{...}` bolds headers:
  ```latex
  \begin{table}[H]
    \caption{Sample Functional Requirements}
    \label{tab:sample-requirements}
    \centering
    \begin{tabularx}{\textwidth}{|>{\raggedright\arraybackslash}p{1.6in}|Y|C|}\hline
      \hd{MODULE} & \hd{DESCRIPTION} & \hd{STATUS} \\ \hline
      User Login  & Allows authorized users to sign in securely. & Complete \\ \hline
      Schedules   & Displays and updates class schedules.        & Ongoing  \\ \hline
    \end{tabularx}
  \end{table}
  ```
  Reference it in a sentence with `Table~\ref{tab:sample-requirements} summarizes...`.
- Figure/table numbers are automatic and continuous. Set `\autoliststrue` in `main.tex` to generate the List of Figures and List of Tables automatically from your captions.
- Layout: Letter paper, 1" top/bottom/right, 1.5" left; Times New Roman 12 pt (XeLaTeX/LuaLaTeX) or Times/mathptmx (pdfLaTeX/Overleaf); roman page numbers (bottom center) before Chapter 1, then arabic (top right).

## Format & References
- JRMSU College of Computing Studies - IS 412 Capstone 1 Manuscript (`Capstone_1_Manuscript.docx`)
- ICS Thesis Template by JCE Plaras: https://github.com/jceplaras/icsthesislatextemplate
