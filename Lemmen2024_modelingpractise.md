---
title: "Good modeling software practises"
keyword:
  - Good Modeling Practise
  - Good Software Practise
  - Standards
  - Reuse
author:
  - name: Carsten Lemmen
    affil: 1
    email: carsten.lemmen@hereon.de
  - name: Philipp Sommer
    affil: 1
affiliation:
  - num: 1
    address: Helmholtz-Zentrum Hereon, Max-Planck-Str. 1, 21502 Geesthacht, Germany
citation_author: Lemmen et al.
date: to be submitted to Ecological Modelling, April 2024
license: CC-BY-4.0
bibliography: Lemmen2024_modelingpractise.bib
SPDX-FileCopyrightText: 2024 Helmholtz-Zentrum hereon GmbH
SPDX-License-Identifier: CC-BY-4.0
abstract: "In environmental or socio-environmental sciences, models are frequently used as tools to represent, understand, project and predict the behaviour of these complex systems."
acknowledgements: "This research is funded by the program Changing Coasts of the Helmholtz-Gemeinschaft der Forschungszentren and an outcome of the Multiple Stressors on North Sea Life (MuSSeL) project funded by BMBF."
conflictsofinterests: "The authors declare that no conflict of interest has arisen from this work."
abbreviations:
  - short: ABM
    long: "Agent-based Model"
  - short: ViNoS
    long: "Viable North Sea"
  - short: MuSSeL
    long: "Multiple Stressors on North Sea Life"
---

# Introduction

In environmental or socio-environmental sciences, models are frequently used as tools to represent, understand, project and predict the behaviour of these complex systems.
The degree of formalization of such models ranges from conceptual thought models to mathematical equations and to implementations in software, but by definition all of these models are purpose-driven simplifications of the system they represent [@Romanowska2014,@Stachowiak1973]. I will here concentrate on socio-environmental models that are implemented in software, and there are many of those out there. @Janssen2015 asked 42 modelers about their inventory of aquatic ecosystem models and came up with a list of 278 different models, a subset of some 1360 ecological models counted by @Benz2001 in 2001.

<!comses model library 1117 https://www.comses.net/codebases/>

Those omnipresent in our field -- with undoubted value -- have been criticised as "unscientific", as they escape the concept of falsification. @Refsgaard2004 differentiates the model code from its domain specific-application

<!-- A distinction is made between the conceptual model, the model code and the site-specific model. A conceptual model is subject to confirmation or falsification like scientific theories. A model code may be verified within given ranges of applicability and ranges of accuracy, but it can never be universally verified. Similarly, a model may be validated, but only with reference to site- specific applications and to pre-specified performance (accuracy) criteria. Thus, a model’s validity will always be limited in terms of space, time, boundary conditions and types of application
-->

So all we can do is to provide at best verified and validated models, and the concept of Good Modeling Practice aims at ensuring this. Good practices often named are a clear purpose of a model, a thorough domain understanding, going from simple to complex, ensuring reproducibility and validation with data; exploring sensitivities and carefully selecting data of good quality. But also collaboration, ethical considerations and communication about the model (REFS).

The concept of Good Modeling Practise has been mentioned early in @Porteus1962, but likely first used in an environmental model context by @Smagorinsky1982, who claimed that "under any cirumstance, GMP demands an awareness of the sensitivity ... to parametrization" (p.16). Water management seems to have been the original domain of GWP, as the Dutch Institute for Inland water managmeet put together the first handbook of GWP in 1999.

<!-- Smagorinskiy 1982 in Land surface processes:
P. S. Eagleson, Peter S. Eagleson
Cambridge University Press, 17.02.2011 - 572 Seiten

[ZITATION] Vloeiend modelleren in het waterbeheer: Handboek Good Modelling Practice
RH Van Waveren, S Groot, H Scholten, F Van Geer… - 1999 - research.wur.nl
Vloeiend modelleren in het waterbeheer : Handboek Good Modelling Practice —
-->

put forward since XXXX, and has been widely adopted in a number of community standards such a ODD for ABM
The focus of Good Modeling Practise is the purpose of the model, not its specific implementation;
Separate ideas have been put forward for scope (Wang2023), for assumptions ()

Whenever a socio-ecological model is realized in software, however, there are additional challenges to address beyond Good Modeling Practise: Good Scientific Conduct and Good Software Practise, which includes but is not restricted to writing good code.

<!-- Good Modeling Practice (GMP) and Good Software Practice (GSP) are both important in their respective fields, but they focus on different aspects:
Good Modeling Practice: This is primarily concerned with the creation and use of models, particularly in scientific and engineering contexts. It involves setting the scope and context of use, defining the project goal, and designing calibration runs and a model validation strategy1. It also includes considerations for dealing with complex socio-environmental systems2. The basis of GMP is the knowledge of relevant processes and the availability of data of sufficient quality3.
Good Software Practice: On the other hand, GSP is more focused on the development and maintenance of software. It includes principles related to coding standards, software design, testing, and documentation. It emphasizes on practices that ensure the software is reliable, maintainable, and efficient.
In summary, while GMP is about ensuring the reliability and validity of models, GSP is about ensuring the quality and reliability of software. Both are crucial in their respective fields and often intersect in areas such as computational modeling.
-->

<!-- Compute rmodel is only one part of the modeling cycle EFSA -->

The concept of Good Software Practise can be traced back to the origin of the UNIX systems, which has at its core not a monolithic but highly granular structure of many little programs that "do one thing only, and do it well", a later summary of the philosphy published by @Ritchie1974. These little tools should also allow to develop new software in a better way, argued @Kernighan1976, cautioning against reinventing the weel (DNRY). In 1996 Kernighan published the practise of programming, which was followed up by Raymonds Raymonds 2003 The Art of Unix Programming, of which the first chapter's content is a single acronym: KISS, short for "keep it simple, stupid!" (an initially military term attributed to @Stropp1960).

In his book The Art of Unix Programming that was first published in 2003,[11] Eric S. Raymond (open source advocate and programmer) summarizes the Unix philosophy as KISS Principle of "Keep it Simple, Stupid."[12] He provides a series of design rules:[1]

OSS: In the 1960’s and 1970’s software was developed by researchers in universities like Berkeley and MIT. In 1983 Richard Stallman, one of the first public advocates of the OSS movement, claimed that information should be free and computer programs should not be owned by companies but be public goods (Stallman 1994; Stallman 1983)

Software Carpentry Wilson2016
Software carpentry: t’s to teach computational competence: live coding, pair programming, open everthing

## Structure

All models start with a purpose. That is the number one Good Modeling Practise advice put forward: know the purpose of the model. It doesn't hurt to know about your domain, either! Speak to experts, develop a conceptual model, only then start formalizing your model in math or in software.

Socio-environmental modeling software can be created by a single person; in fact, it often is in student projects or individual programming sprints. But even if only one person ever looks at her own code and applies it for simulations, she will have to have a plan, will have to understand what she did in the past, she will have to retrace the steps that led her to the current state of the software, she will have to have backups. She will have to have verifiable codes. All the software should be covered by tests.

If the model is to be used to produce scientific results subject to peer review, the single person will have to ensure replicability of results, will have to subject it to review (thus make it readable), and documented it.

If at least one other person is using the model, the permission issue becomes pertinent. The model needs a license. Also the user needs a way to communicate with the developer, for feature requests or bugs/issues. Self checks and badges.

If at least one other person is contributing to the model, the permissions become more important, needing contributor agreements and codes of conduct. How are decisions made?
The more persons are contributing, the governance becomes more important. Even a community management system might be required, with granular access, distributed roles, and fine-grained permissions. To keep the code quality, structured reviews, pre-commits, and common coding standards are used

Software sustainabilty is critical once a larger user base is established, or other scientific software depends on the model. Boosting to truck factor!

# Tools for Good Modeling Practise

## Ethics - agile

<!-- The Agile manifesto: Individuals and interactions over processes and tools. Working software over comprehensive documentation. Customer collaboration over contract negotiation. Responding to change over following a plan.
That is, while we value the items on the right, we value the items on the left more.-->

<!-- Singer et al. 2008: “Software engineering is an intensely people-oriented activity, yet little is known about how software engineers perform their work.”2 -->

<!-- Joel test: The Joel Test

Do you use source control?
Can you make a build in one step?
Do you make daily builds?
Do you have a bug database?
Do you fix bugs before writing new code?
Do you have an up-to-date schedule?
Do you have a spec?
Do programmers have quiet working conditions?
Do you use the best tools money can buy?
Do you have testers?
Do new candidates write code during their interview?
Do you do hallway usability testing?
-->

<!--
Understand the Problem: Before starting, ensure you have a deep understanding of the problem you’re trying to solve.
Simplicity: Start with a simple model and add complexity only when necessary.
Reproducibility: Ensure your work can be reproduced by others. This includes using version control systems and documenting your work thoroughly.
Validation: Validate your model with real-world data to ensure it’s accurate and reliable.
Sensitivity Analysis: Conduct sensitivity analyses to understand how changes in model parameters affect the output.
Collaboration: Collaborate with others, especially domain experts, to gain different perspectives and improve your model.
Iterative Refinement: Modeling should be an iterative process. Continually refine and improve your model based on feedback and new data.
Data Quality: Ensure the data you’re using is of high quality. Garbage in, garbage out.
Ethical Considerations: Always consider the ethical implications of your model, including potential biases and how the model will be used.
Communication: Be able to effectively communicate your model, its assumptions, and its results to both technical and non-technical audiences.
Remember, these are general practices and may need to be adapted depending on your specific modeling task and field of study. Good luck with your paper!
-->

## Source code management

Start with version control, source code management

## DNRY - good software development templates

Use software templates

## Folder documentation

## Licensing

REUSE.sfotawre
Fossology
ORT

## Contributor guideline

- Project Harmony
- Contributor Covenant
- Platforms, wikis, bugs, emails

## Versioning and Releasing

## Documentation

- readMe
- User documentaiton
- API documentation

## Code formatting

- The code is the coumentaion
  "Code should be written to minimize the time it would take for someone else to understand it." Boswell & Foucher
- Code conventions
- Black
- F
- Prettier

## Code Structure

- Clear, consise, well-commented
- Accessible and consistent naming practise
- Modular, complex tasks in managable functions
- error handling
- reuse and recycle, don't reinvent the wheel, use small tools (Kernighan 1976)
- The practise of programming "Simplicity, Generality, clarity"

## Maintanance

- Regularly updating and maintaining code.
- Keeping dependencies up to date.

## Unit tests

- unitt testing
- code coverage

## Continuous integration

- Reproducibility/regression tests

## Continuous deployment

- Product updates
- Documentation updates

## Archiving

- Zenodo

## Governance

A benevolent dictator in software development refers to a leadership style where one individual, often the project's creator or lead developer, has significant control over decision-making processes within the project. Despite holding considerable authority, this individual typically exercises their power with the best interests of the project and its community in mind, hence the term "benevolent." This leadership model aims to maintain direction and cohesion within the project while still allowing for contributions and feedback from other team members or contributors.

# Self-checks and badges

- https://www.repostatus.org/#active
- Open SSF best practises

Clearly defining the objectives and scope of the model.
Using appropriate model structure and complexity.
Documenting assumptions and limitations.
Validating and verifying the model with empirical data.
Conducting sensitivity analysis to understand model behavior.
Providing clear and transparent documentation.
Collaborating with domain experts for model development.
Adhering to coding standards and version control.
Ensuring model reproducibility.
Communicating results effectively.

# Good enough software practise - a use case

Viable North Sea (ViNoS) is a socio-ecological model of the German North Sea small-scale fisheries (Lemmen2023,Lemmen2024). It is an agent-based model coded in NetLogo (Wilensky1999) embedded in a larger software system containing data, and Python data preprocessing and postprocessing scripts.

# References

Stroop 1960, U.S. Navy "Project KISS", Chicago Daily Tribune, p.43, 4 December 1960; reported in The Routledge Dictionary of Modern American Slang and Unconventional English, Tom Dalzell, 2009, 1104 pages, p.595
