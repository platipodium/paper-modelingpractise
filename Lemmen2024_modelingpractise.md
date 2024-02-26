---
title: "Good software and modeling practise - a case study"
keyword:
  - Good Modeling Practise
  - Good Software Practise
  - Standards
  - Reuse
author:
  - Carsten Lemmen, Helmholtz-Zentrum Hereon, Max-Planck-Str. 1, 21502 Geesthacht, Germany
correspondence: C. Lemmen <carsten.lemmen@hereon.de>
citation_author: Lemmen et al.
date: submitted to SESMO, April 2024
license: CC-BY-4.0
bibliography: Lemmen2024_modelingpractise.bib
SPDX-FileCopyrightText: 2024 Helmholtz-Zentrum hereon GmbH
SPDX-License-Identifier: CC-BY-4.0
abstract: ""
acknowledgements: "TThis research if funded by the German Ministry of Education and Research (BMBF) through the Küstenforschung Nord- und Ostseee (KüNO) project 'Multiple Stressors on North Sea Life' (MuSSeL) with grant numbers 03F0862A."
conflictsofinterests: "The author declares that no conflict of interest has arisen from this work."
abbreviations:
  - short: ABM
    long: "Agent-based Model"
  - short: ViNoS
    long: "Viable North Sea"
  - short: MuSSeL
    long: "Multiple Stressors on North Sea Life"
---

# Introduction

In environmental or socie-environmental sciences, models are used as tools to represent, understand, project and predict the behaviour of these complex systems.
The degree of formalization of such models ranges from conceptual thought models to mathematical equations and to implementations in software, but by definition all of these models are purpose-driven simplifications of the system they represent Romanowska2014,Stachowiak1973.

The concept of Good Modeling Practise has been put forward since XXXX, and has been widely adopted in a number of community standards such a ODD for ABM
The focus of Good Modeling Practise is the purpose of the model, not its specific implementation;
Separate ideas have been put forward for scope (Wang2023), for assumptions ()

Whenever a socio-ecological model is realized in software, however, there are additional challenges to address beyond Good Modeling Practise: Good Software Practise, which includes but is not restricted to writing good code.
The concept of Good Software Practise can be traced back to the origin of the UNIX systems, which has at its core not a monolithic but highly granular structure of many little programs that "do one thing only, and do it well", a later summary of the philosphy published by Ritchie1974. These little tools should also allow to develop new software in a better way, argued Kernighan1976, cautioning against reinventing the weel (DNRY). In 1996 Kernighan published the practise of programming, which was followed up by Raymonds Raymonds 2003 The Art of Unix Programming, of which the first chapter's content is a single acronym: KISS, short for "keep it simple, stupid!" (an initially military term attributed to Stropp1960).

In his book The Art of Unix Programming that was first published in 2003,[11] Eric S. Raymond (open source advocate and programmer) summarizes the Unix philosophy as KISS Principle of "Keep it Simple, Stupid."[12] He provides a series of design rules:[1]

OSS: In the 1960’s and 1970’s software was developed by researchers in universities like Berkeley and MIT. In 1983 Richard Stallman, one of the first public advocates of the OSS movement, claimed that information should be free and computer programs should not be owned by companies but be public goods (Stallman 1994; Stallman 1983)

Software Carpentry Wilson2016
Software carpentry: t’s to teach computational competence: live coding, pair programming, open everthing

## Structure

Socio-environmental modeling software can be created by a single person; in fact, it often is in student projects or individual programming sprints. But even if only one person ever looks at her own code and applies it for simulations, she will have to understand what she did in the past, she will have to retrace the steps that led her to the current state of the software, she will have to have backups. She will have to have verifiable codes. All the software should be covered by tests.

If the model is to be used to produce scientific results subject to peer review, the single person will have to ensure replicability of results, will have to subject it to review (thus make it readable), and documented it.

If at least one other person is using the model, the permission issue becomes pertinent. The model needs a license. Also the user needs a way to communicate with the developer, for feature requests or bugs/issues.

If at least one other person is contributing to the model, the permissions become more important, needing contributor agreements and codes of conduct. How are decisions made?
The more persons are contributing, the governance becomes more important. Even a community management system might be required, with granular access, distributed roles, and fine-grained permissions. To keep the code quality, structured reviews, pre-commits, common coding standards.

Software sustainabilty is critical once a larger user base is established, or other scientific software depends on the model. Boosting to truck factor!

# Tools for Good Modeling Practise

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

# References

Stroop 1960, U.S. Navy "Project KISS", Chicago Daily Tribune, p.43, 4 December 1960; reported in The Routledge Dictionary of Modern American Slang and Unconventional English, Tom Dalzell, 2009, 1104 pages, p.595
