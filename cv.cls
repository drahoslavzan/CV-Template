\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[6/6/2013 custom CV class]
\LoadClass{article}
\RequirePackage{titlesec}
\RequirePackage{marvosym}
\RequirePackage{fontawesome}
\RequirePackage{xstring}
\RequirePackage[margin=0.6in]{geometry}

\thispagestyle{empty}

\newcount\nbofwords
\makeatletter  
\def\myutil@empty{}
\def\multiwords#1 #2\@nil{% 
 \def\NextArg{#2}%
 \advance\nbofwords by  1 %   
 \expandafter\edef\csname word\@alph\nbofwords\endcsname{#1}% 
 \ifx\myutil@empty\NextArg
     \let\next\@gobble
 \fi
 \next#2\@nil
}%    

\def\GetWords#1{%
   \let\next\multiwords 
   \nbofwords=0 %
   \expandafter\next#1 \@nil %
}% 
\makeatother

\titleformat{\section}         % Customise the \section command 
  {\Large\scshape\raggedright\bf} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  [\titlerule]                 % Inserts a horizontal line after the heading
  
  \titleformat{\subsection}
  {\large\scshape\raggedright}
  {}{0em}
  {}
  
  \newcommand{\datedsection}[2]{ %
  \section[#1]{#1 \hfill #2}%
}

\newcommand{\uni}[5]{%
	\noindent
	\small
	{\textbf{#1} in \textbf{#2},\\#3, \scriptsize \uppercase{#4} \hfill \small #5}%
}

\newcommand{\hsc}[2]{%
	\noindent
	\small
	{#1 \hfill #2}%
}

\newcommand{\thesis}[4]{%
	\GetWords{\nm}
	\noindent
	\small
    \StrLeft{\worda}{1}[\fst]%
	{{\wordb\,\fst.}, \textbf{#2}, \textit{#1}, #4.}
	{URL: {\tt<#3>}}%
}

\newcommand{\name}[1]{
	\def\nm{#1}
	\centerline{\Huge{#1}}
	\par\vspace{.2cm}
}

\newcommand{\contact}[3]{
	\small
	\centerline{{\Email\hspace{.1cm}#1} {\large\hspace{.1cm}\textperiodcentered\hspace{.1cm}} {\Mobilefone\hspace{.1cm}#2} {\large\hspace{.1cm}\textperiodcentered\hspace{.1cm}} {\faLinkedin\hspace{.1cm}#3}}
}

