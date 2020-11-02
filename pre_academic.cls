%-------------------------------------------------------------------
% This is my first package aims at doing presentations in a easier way.
% My purpose is to just use one package to make presentations.
% Make my code clean and neat.
% Keep modest and keep updating.
% Author: Lingchu Xi
% Version: 0.1.0
% Date: 2020-09-27
% And maybe that is the most difficult one.
%-------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pre_academic}[2020/09/27 v0.1.0 Help you make your presentations easier.]
%----------------------------------------%
%------------ Options Of Pre ------------%
%----------------------------------------%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\DeclareOption{sysucolortheme}{\def\@colortheme{sysu}}
\DeclareOption{hitcolortheme}{\def\@colortheme{hit}}
\newif\if@bgphoto
\@bgphotofalse
\DeclareOption{bgphoto}{\@bgphototrue}
\newif\if@logo
\@logofalse
\DeclareOption{logo}{\@logotrue}
\newif\if@title
\@titlefalse
\DeclareOption{autotitle}{\@titletrue}
\newif\if@contents
\@contentsfalse
\DeclareOption{autocontents}{\@contentstrue}
\newif\if@subtitle
\@subtitlefalse
\DeclareOption{subtitle}{\@subtitletrue}
\ProcessOptions\relax

\LoadClass[
    aspectratio=43, % You can change to 16:9 using 169
    12pt
]{beamer}

%----------------------------------------%
%----------- Package Required -----------%
%----------------------------------------%
%------------- Math Formula -------------%
\RequirePackage{amsmath}
%-------- Draw Or Import Graphic --------%
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\RequirePackage{caption}
\RequirePackage{tikz}
\RequirePackage{tikz-3dplot}
\usetikzlibrary{arrows, shapes, backgrounds}
\RequirePackage{epstopdf}
%-------- Geometry And Sturcture --------%
\RequirePackage{float}
\RequirePackage{booktabs}
%------------- Fonts Setting -------------%
\RequirePackage{fontspec}
\setmainfont{Times New Roman}
%--------------- Hyperref ---------------%
\RequirePackage{hyperref}
%----------------------------------------%
%------------- Define Fonts -------------%
%----------------------------------------%
% Fonts in title page
\setbeamerfont{title}{size=\Huge}
\setbeamerfont{subtitle}{size=\Large}
% Table of contents
\setbeamerfont{section in toc}{size=\Large}
\setbeamerfont{subsection in toc}{size=\large}
% Block
\setbeamerfont{block title}{size=\large}
% Frametitle
\setbeamerfont{frametitle}{size=\Large}
%----------------------------------------%
%---------- Define Color Theme ----------%
%----------------------------------------%
\usecolortheme{\@colortheme}
% Frame Title
\setbeamercolor{frametitle}{fg=sthemecolor}
% Text
\setbeamercolor{normal text}{fg=textcolor}
\setbeamercolor{alerted text}{fg=alertcolor}
\setbeamercolor{example text}{fg=themecolor}
% Block
\setbeamercolor{block title}{bg=themecolor, fg=white}
\setbeamercolor{block body}{bg=themecolor!10!white, fg=textcolor}
\setbeamercolor{block title alerted}{bg=themecolor, fg=white}
\setbeamercolor{block body alerted}{bg=themecolor!10!white, fg=textcolor}
\setbeamercolor{block title example}{bg=themecolor, fg=white}
\setbeamercolor{block body example}{bg=themecolor!10!white, fg=textcolor}
% Item
\setbeamercolor{itemize item}{fg=sthemecolor}
\setbeamercolor{itemize subitem}{fg=sthemecolor}
\setbeamercolor{enumerate item}{fg=textcolor}
\setbeamercolor{enumerate subitem}{fg=textcolor}
\setbeamercolor{item projected}{bg=sthemecolor, fg=white}
% Table of contents
\setbeamercolor{section in toc}{fg=toccolor}
\setbeamercolor{subsection in toc}{fg=stoccolor}
\setbeamercolor{section number projected}{bg=themecolor}
% Figures and tables
\setbeamercolor{caption}{fg=textcolor}
\setbeamercolor{caption name}{fg=textcolor}
%----------------------------------------%
%--------- Settings Of Headline ---------%
%----------------------------------------%
\setbeamertemplate{frametitle}{
   \begin{tikzpicture}[remember picture, overlay]
       % Add Frame Title line
       \filldraw[themecolor]
       ([yshift=-0.1\paperheight] current page.north west) --
       ([yshift=-0.1\paperheight, xshift=\paperwidth] current page.north west) --
       ([yshift=-0.11\paperheight, xshift=\paperwidth] current page.north west) --
       ([yshift=-0.11\paperheight] current page.north west) -- cycle;
       %\filldraw[themecolor]
       %([yshift=-0.1\paperheight, xshift=0.25\paperwidth] current page.north west) --
       %([yshift=-0.1\paperheight, xshift=0.5\paperwidth] current page.north west) --
       %([yshift=-0.11\paperheight, xshift=0.5\paperwidth] current page.north west) --
       %([yshift=-0.11\paperheight, xshift=0.25\paperwidth] current page.north west) -- cycle;
       %\filldraw[themecolor]
       %([yshift=-0.1\paperheight, xshift=0.5\paperwidth] current page.north west) --
       %([yshift=-0.1\paperheight, xshift=0.75\paperwidth] current page.north west) --
       %([yshift=-0.11\paperheight, xshift=0.75\paperwidth] current page.north west) --
       %([yshift=-0.11\paperheight, xshift=0.5\paperwidth] current page.north west) -- cycle;
       %\filldraw[themecolor]
       %([yshift=-0.1\paperheight, xshift=0.75\paperwidth] current page.north west) --
       %([yshift=-0.1\paperheight, xshift=\paperwidth] current page.north west) --
       %([yshift=-0.11\paperheight, xshift=\paperwidth] current page.north west) --
       %([yshift=-0.11\paperheight, xshift=0.75\paperwidth] current page.north west) -- cycle;
       % Add logo
       \node[inner sep=0, anchor=east] (logo) at ([yshift=-0.105\paperheight] current page.north east) {
           \includegraphics[scale=0.25]{pics/logo}
       };
       % Add frametitle
       \node[inner sep=0, anchor=west] at ([yshift=-0.05\paperheight, xshift=12pt] current page.north west) {
           \usebeamerfont{frametitle} \insertframetitle
       };
   \end{tikzpicture}
   \vspace{1.2cm}
}
%----------------------------------------%
%--------- Settings Of Footline ---------%
%----------------------------------------%
\setbeamertemplate{footline}{
    \ifnum\c@framenumber>0
        \begin{tikzpicture}
            \filldraw[themecolor]
            (current page.south west) -- ([yshift=0.05\paperheight] current page.south west) [rounded corners=3pt] --
            ([yshift=0.05\paperheight, xshift=0.125\paperwidth] current page.south west)  --
            ([yshift=0.025\paperheight, xshift=0.125\paperwidth] current page.south west)  --
            ([yshift=0.025\paperheight, xshift=-0.125\paperwidth] current page.south east)  --
            ([yshift=0.05\paperheight, xshift=-0.125\paperwidth] current page.south east) [sharp corners] --
            ([yshift=0.05\paperheight] current page.south east) -- (current page.south east) -- cycle;
        \node [inner sep=0pt, anchor=center] at ([yshift=0.025\paperheight, xshift=0.0625\paperwidth] current page.south west) {
            \small\color{white} \insertinstitute
        };
        \node [inner sep=0pt, anchor=center] at ([yshift=0.025\paperheight, xshift=-0.0625\paperwidth] current page.south east) {
            \small\color{white} \insertframenumber/\inserttotalframenumber
        };
        \end{tikzpicture}
    \fi
}
%-----------------------------------------%
%----------- Define Title Page -----------%
%-----------------------------------------%
\setbeamertemplate{title page}{
    \begin{tikzpicture}[overlay, remember picture]
        \if@bgphoto
            \node at (current page.center) [anchor=center, inner sep=0, opacity=0.6]{
                \includegraphics[width=\paperwidth]{pics/background.jpg}
            };
        \else
            \filldraw[themecolor]
            (current page.north west) -- (current page.north east) -- ([yshift=-0.1\paperheight] current page.north east) %--
            parabola bend
            ([yshift=-0.05\paperheight] current page.north) 
            ([yshift=-0.1\paperheight] current page.north west) -- cycle;
            \node (logo) at ([yshift=-0.25\paperheight]current page.north) [anchor=center, inner sep=0]{
                \includegraphics[scale=0.35]{pics/logo}
            };
            \node[rectangle, rounded corners, fill=sthemecolor, text=white, inner sep = 15pt, align=center] (title) at ([yshift=-40pt] logo.south) {
                \usebeamerfont{title} \inserttitle 
                \if@subtitle \\ \usebeamerfont{subtitle} \insertsubtitle\fi};
            \node [align=center, text=toccolor ] (author) at ([yshift=-0.05\paperheight-20pt] title.south) {
                                                \Large \insertauthor \\[5pt]  
                                                \insertdate };
        \fi
    \end{tikzpicture}
    \addtocounter{framenumber}{-1}
}
% Also Add Table of Contents
\AtBeginDocument{
    \if@title
        \begin{frame}
            \titlepage
        \end{frame}
    \fi
    \if@contents
        \addtocounter{framenumber}{1}
    \fi
    
    %\if@contents
    %    \begin{frame}
    %        \frametitle{Contents}
    %        \tableofcontents[hidesubsections, sectionstyle=show]
    %        \addtocounter{framenumber}{-1}
    %    \end{frame}
    %\fi
}
%----------------------------------------%
%----------- Contents Setting -----------%
%----------------------------------------%
\setbeamertemplate{section in toc}[square]
\setbeamertemplate{subsection in toc}{ 
    \leavevmode \leftskip=10pt {\color{sthemecolor} $\bullet$} \hskip1pt \inserttocsubsection\par
}
\AtBeginSection{
    \if@contents
        \begin{frame}
            \frametitle{Contents}
            \tableofcontents[currentsection, currentsubsection, hideothersubsections]
            \addtocounter{framenumber}{-1}
        \end{frame}
    \fi
}
%----------------------------------------%
%------------ Block Settings ------------%
%----------------------------------------%
\setbeamertemplate{blocks}[rounded][shadow=true]
%----------------------------------------%
%----------- Itemize Settings -----------%
%----------------------------------------%
\setbeamertemplate{enumerate item}[square]
\setbeamertemplate{itemize item}[square]
\setbeamertemplate{enumerate subitem}[circle]
\setbeamertemplate{itemize subitem}[circle]
%----------------------------------------%
%--------------- Captions ---------------%
%----------------------------------------%
\setbeamertemplate{caption}[numbered]
%----------------------------------------%
%--------------- Hyperref ---------------%
%----------------------------------------%
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    urlcolor=cyan,
    filecolor=magenta
}
\urlstyle{same}
%----------------------------------------%
%------------ Utils Settings ------------%
%----------------------------------------%
\setbeamertemplate{navigation symbols}{}
\setbeamersize{text margin left=.64cm, text margin right=.64cm}
\newcommand{\upcite}[1]{\textsuperscript{\textsuperscript{\cite{#1}}}}
\renewcommand{\indent}{\hspace*{1em}}
