#import "tmlr.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: tmlr.with(
  title: "Formatting Instructions for TMLR 
Journal Submissions",
  authors: (
    (name: "Kyunghyun Cho", email: "kyunghyun.cho@nyu.edu", affiliation: "Department of Computer Science
University of New York"),
    (name: "Raia Hadsell", email: "raia@google.com", affiliation: "DeepMind"),
    (name: "Hugo Larochelle", email: "hugolarochelle@google.com", affiliation: "Google Research"),
  ),
  abstract:"The abstract paragraph should be indented 1/2~inch on both left and right-hand margins. Use 10~point type, with a vertical spacing of 11~points. The word Abstract must be centered, in bold, and in point size 12. Two line spaces precede the abstract. The abstract must be limited to one paragraph.",
  type: "accepted", //submission accepted preprint
  bibliography-file: "ref.bib"
)


= Introduction
#lorem(100)

== In this paper
#lorem(100)

=== Contributions
#lorem(40)

= Related Work
#lorem(100)@Bengio_chapter2007

#lorem(100)@Hinton06

#lorem(100)@goodfellow2016deep

= Conclusion
#lorem(100)


