# negative-cycle

A synchronic and diachronic model of emphatic negation. Emphatic negation is implemented as a markedness implicature using a Rational Speech Act model with Lexical Uncertainty, following [Bergen et al. 2016](http://dx.doi.org/10.3765/sp.9.20) and [Scontras et al. 2018](https://www.problang.org/chapters/08-lexical-uncertainty.html).

Diachronic change, i.e. Jespersen's cycle of negation, is modeled as changing costs. As the cost of "emphatic" negation lowers relative to plain negation, the marker of emphatic negation ceases to be emphatic.

# model and results

Implemented in [WebPPL](webppl.org).

Results are exported as json objects for each utterance and processed in R using ggplot2.
