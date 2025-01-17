#lang scribble/doc
@require[scribble/manual
         scribble-abbrevs/manual
         @for-label[qi
                    racket]]

@title{Qi: An Embeddable Flow-Oriented Language}

@defmodule[qi]

An embeddable, general-purpose language to allow convenient framing of programming logic in terms of functional @emph{flows}.

Start by @seclink["Using_These_Docs"]{getting your bearings}. For an overview of the language, continue to @secref["Introduction_and_Usage"]. For a thorough orientation, @hyperlink["https://www.youtube.com/watch?v=XkIoGmWkEpM"]{watch the original video} from RacketCon 2021.

@table-of-contents[]

@section{Using These Docs}

@secref["Introduction_and_Usage"] provides a high-level overview and includes installation and setup instructions. Learn the language by going through the @secref["Tutorial"], and read @secref["When_Should_I_Use_Qi_"] for examples illustrating its use. The many ways in which Qi may be used from the host language (e.g. Racket), as well as the ways in which Qi may be used in tandem with other DSLs, are described in @secref["Language_Interface"]. The various built-in forms of the language are documented in @secref["Qi_Forms"], while @secref["Qi_Macros"] covers using macros to extend the language by adding new features or implementing new DSLs. @secref["Principles_of_Qi"] provides a theoretical foundation to develop a sound intuition for Qi, and the @secref["Field_Guide"] contains practical advice.

This site hosts @emph{user} documentation. If you are interested in contributing to Qi development you may be interested in the @emph{developer} documentation at the @hyperlink["https://github.com/drym-org/qi/wiki"]{Qi Wiki}. The wiki is also your one-stop shop for keeping up with planned events in the Qi community.

@include-section["intro.scrbl"]
@include-section["tutorial.scrbl"]
@include-section["interface.scrbl"]
@include-section["forms.scrbl"]
@include-section["macros.scrbl"]
@include-section["field-guide.scrbl"]
@include-section["principles.scrbl"]
@include-section["using-qi.scrbl"]
