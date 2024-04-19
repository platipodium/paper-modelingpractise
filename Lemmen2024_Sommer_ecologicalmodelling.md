---
title: Good Modeling Software Practises
journal: Ecological Modelling
keywords:
  - Good Modeling Practise
  - Good Software Practise
  - Good Research Practise
author:
  - name: Carsten Lemmen
    affil: 1
    orcid: 0000-0003-3483-6036
    email: carsten.lemmen@hereon.de
  - name: Philipp Sebastian Sommer
    affil: 2
    orcid: 0000-0001-6171-7716
affiliations:
  - num: 1
    address: Institute of Coastal Systems - Analysis and Modeling, Helmholtz-Zentrum Hereon, Max-Planck-Str. 1, 21502 Geesthacht, Germany
  - num: 2
    address: Helmholtz Coastal Data Center, Helmholtz-Zentrum Hereon, Max-Planck-Str. 1, 21502 Geesthacht, Germany
citation_author: Lemmen and Sommer
date: to be submitted to Ecological Modelling, May 2024
license: CC-BY-4.0
bibliography: paper.bib
SPDX-FileCopyrightText: 2024 Helmholtz-Zentrum hereon GmbH
SPDX-License-Identifier: CC-BY-4.0
abstract: "In socio-environmental sciences, models are frequently used as tools to represent, understand, project and predict the behaviour of these complex systems.  Along the modeling chain, Good Modeling Practices (GMP) have been evolving that ensure -- amongst others -- that models are transparent and replicable.   Whenever such models are represented in software, good modeling meet good software practises, such as a tractable software development workflow, good code, collaborative development and governance, attribution of copyrights and acknowledgement of intellectual property, continuous integration and deployment, publication of a software paper and archiving. Too often in existing socio-environemntal model software, these practices have been regarded as an add-on to be considered at a later stage only; in fact, many modelers have shied away from publishing their model as open source out of fear that having to add good software practise is too demanding.  We here argue for making a habit of following a list of simple and not so simple practices early on in the implementation of the model.  We contextualize cherry-picked and hands-on practices for supporting good modeling practises, and we demonstrate their application in the example context of the Viable North Sea fisheries socio-ecological systems model."
acknowledgements: "This research is funded by the program Changing Coasts of the Helmholtz Society of German Research Centres and an outcome of the Multiple Stressors on North Sea Life (MuSSeL) project funded by BMBF."
conflictsofinterests: "The authors declare that no conflict of interest has arisen from this work."
authorcontributions: "C. Lemmen: Conceptualization, Methodology, Writing – original draft, Writing – review & editing. P. Sommer: Writing - original draft, Writing - review & editing."
abbreviations:
  - short: ABM
    long: Agent-based Model
  - short: ViNoS
    long: Viable North Sea
  - short: MuSSeL
    long: Multiple Stressors on North Sea Life
  - short: DRY
    long: Do not repeat yourself
  - short: KISS
    long: Keep it simple, stupid!
  - short: GMP
    long: Good Modeling Practise
  - short: ODD
    long: Overview, Design, Details
  - short: VCS
    long: Version Control System
  - short: SCM
    long: Source Code Management
  - short: CoMSES
    long: Network for Computational Modeling in the Social and Ecological Sciences
  - short: GMP
    long: Good Modeling Practise
  - short: OOP
    long: Object-oriented programming
---

# Introduction

In environmental or socio-environmental sciences, models are frequently used as tools to represent, understand, project and predict the behaviour of these complex systems.
The degree of formalization of such models ranges from conceptual thought models to mathematical equations and to implementations in software -- by definition -- all of these models are purpose-driven simplifications of the system they represent [@Stachowiak1973;@Romanowska2015]. We here concentrate on environmental or socio-ecological models implemented in software, and there are many of those out there: Currently the CoMSES Network lists 1117 models [@CoMSES2024]; @Janssen2015 asked 42 modelers about their inventory of aquatic ecosystem models and came up with a list of 278 different models, more than a decade after @Benz2001 counted some 1360 ecological models.

So models are plenty and omnipresent in our field. But despite their undoubted value, the approaches that socio-environmental models have taken have been criticised as "unscientific", as they often escape the concept of falsification beyond the conceptual stage: the code may be verifiable within accuracy and applicability ranges but not universally; the model may be validated only in site-specific application and performance criteria but not universally [@Refsgaard2004].
So all we can and should do is to provide at best verified and validated models, and Good Modeling Practice aims at ensuring this. Examples of such good practices often named are: a clear purpose of a model, a thorough domain understanding, going from simple to complex, ensuring reproducibility and validation with data; exploring sensitivities and carefully selecting data of good quality [@Crout2008].

<!-- check list in ref -->

But also collaboration, ethical considerations and communication about the model including a software publication. But much of the model corpus is not published at all: @Barnes2010's survey stated that "the code is a little raw" was named as the main reason for not publishing the model.

<!-- add ref -->

<!-- history of GMP -->

One of the first uses of the term Good Modeling Practice may be by @Smagorinsky1982, who claimed that "under any cirumstance, good modeling practise demands an awareness of the sensitivity ... to parametrization" (p.16). Water management seems to have been the original domain of GMP, as the Dutch Institute for Inland water managment put together the first handbook on GMP [@VanWaveren1999].

<!-- when did it appear in SES science? need ref -->

put forward since XXXX, and has been widely adopted in a number of community standards such a ODD for ABM
The focus of Good Modeling Practise is the purpose of the model, not its specific implementation;
Separate ideas have been put forward for scope [@Wang2023], for assumptions ()
Whenever a socio-ecological model is realized in software, however, there are additional challenges to address beyond Good Modeling Practise: Good Scientific Conduct and Good Software Practise, which includes but is not restricted to writing good code.

<!-- Good Modeling Practice (GMP) and Good Software Practice (GSP) are both important in their respective fields, but they focus on different aspects:
Good Modeling Practice: This is primarily concerned with the creation and use of models, particularly in scientific and engineering contexts. It involves setting the scope and context of use, defining the project goal, and designing calibration runs and a model validation strategy1. It also includes considerations for dealing with complex socio-environmental systems2. The basis of GMP is the knowledge of relevant processes and the availability of data of sufficient quality3.
Good Software Practice: On the other hand, GSP is more focused on the development and maintenance of software. It includes principles related to coding standards, software design, testing, and documentation. It emphasizes on practices that ensure the software is reliable, maintainable, and efficient.
In summary, while GMP is about ensuring the reliability and validity of models, GSP is about ensuring the quality and reliability of software. Both are crucial in their respective fields and often intersect in areas such as computational modeling.
-->

<!-- Compute rmodel is only one part of the modeling cycle EFSA -->
<!-- Clean code -->

The concept of Good Software Practise can be traced back to the origin of the Unix systems, which has at its core not a monolithic but highly granular structure of many little programs that "do one thing only, and do it well", a later summary of the philosphy published by @Ritchie1974. These little tools should also allow to develop new software in a better way, argued @Kernighan1976, cautioning against reinventing the weel: "Do not repeat yourself" (DRY). In 1996 Kernighan published the practise of programming, which was followed up by The Art of Unix Programming [@Raymond2003], of which the first chapter's content is a single acronym: KISS, short for "keep it simple, stupid!", an initially military slang attributed to @Stroop1960. But there was also a political component to it, advocated by Richard Stallman and implemented by researchers in universities like Berkeley and MIT: information should be free and computer programs should not be owned by companies but be public goods [@Stallman1994; @Stallman1983]. The Free Software movement emerged carrying the four basic freedoms to (1) run for any purpose, (2) be studied and modified, (3) distribute, and (4) modify and distribute [@Stallman2015].

- Raymond provides a series of design rules:
- Software Carpentry @Wilson2016 Software carpentry: t’s to teach computational competence: live coding, pair programming, open everthing

## Structure

All models start with a purpose. That is the number one Good Modeling Practise advice put forward: know the purpose of the model. It doesn't hurt to know about your domain, either! Speak to experts, develop a conceptual model, only then start formalizing your model in math or in software.

Socio-environmental modeling software can be created by a single person; in fact, it often is in student projects or individual programming sprints<<!-- find reference -->. But even if only one person ever looks at her own code and applies it for simulations, she will have to have a development plan, will have to understand what she did in the past, she will have to retrace the steps that led her to the current state of the software, she will have to have backups. She will have to have verifiable codes. All the software should be covered by tests.

If the model is to be used to produce scientific results subject to peer review, the single person will have to ensure replicability of results, will have to subject it to review (thus make it readable), and document it. To record the reviewer feedback and answer to it, there should be a platform to file the individual concerns and address them.

If at least one other person is using the model, the permission issue becomes pertinent. The model needs a license. Also the user needs a way to communicate with the developer, for feature requests or bugs/issues. Self checks and badges.

If at least one other person is contributing to the model, the permissions become more important, needing contributor agreements and codes of conduct. How are decisions made?
The more persons are contributing, the governance becomes more important. Even a community management system <!-- we dont talk about it yet --> might be required, with granular access, distributed roles, and fine-grained permissions. To keep the code quality, structured reviews, pre-commits, and common coding standards are used.

Software sustainabilty is critical once a larger user base is established, or other scientific software depends on the model. Boost the truck factor!

## Single authors

<!-- @Singer2008: “Software engineering is an intensely people-oriented activity, yet little is known about how software engineers perform their work.”2 -->

Authors of scientific models eventually become authors or co-authors of scientific publications arising from or with the help of a model. As scientific authors, they are bound by ethical considerations such as the Guidelines for Safeguarding Good Research Practice, among them the unambiguous declaration of intellectual property to the work and ensuring availability of the model for a prolonged period of time [@DFG2022]. The declaration of intellectual property carries with it the proper acknowledgement of software the model is built on, and respecting the permissions pertaining to the sources used. The archiving requirement carries with it the obligation to ensure that technical failures or changes in the circumstances of the model author do not lead to the loss of the model: decentralized backups or public repositories help.

- software life cycle

For many scientific model authors, getting stuff done may be more important than documenting it thoroughly, usefulness is more valued than red tape, spontaneous ideas are implemented preferably over those layed down in a management plan; individual agency supersedes organizational processes. In this way, scientific model software development reflects the ideas formulated in agile development: "Individuals and interactions over processes and tools. Working software over comprehensive documentation. Customer collaboration over contract negotiation. Responding to change over following a plan" [@AgileAlliance2001]. And while the items on the left are valued more, the items on the right are still important.<!-- this could go to discussion -->

There are many tools available to structure and ameliorate the work for the less preferred actions. Some that help with clarifying legal constraints and documentation, and others that help with structuring the development process, among them source code management services.

## Reviewers

To be published in a scientific journal, reviewers need to be able to access and understand the model. Various documentation principles can help to ensure this accessibility, including automatically generated application programming interface references, in-code documentation and the generation of Metadata. Advice on how to write the code is old and simple: "Write code that minimizes the time it would take someone else to understand it---even if that someone else is you." [@Flesch1950].

But even before a reviewer invests her time in evaluating a model software, much can be done in advance by the author herself. In fact, where a reviewer might concentrate on model validation, the author could ensure model verification [@Sargent1994]. Verification answers the questions: Does the code do what the author intends it to do? To ensure this, it has become good software practise to employ unit testing and try to reach a good coverage of the test framework over your entire code base [@Ellims2006], and to integrate automated verification with the source code management service as Continuous Integration [CI,@Shahin2017].

How does an author deal with the feedback she receives during a friendly or journal-led review? Often, this comes as an itemized list of points to address; as such it is in an ideal form to be converted to so-called "issues" or "tickets" in the source code management service, or a dedicated issue tracker system linked to the model software. Improvements to the model code can then be tied to the issue tracker, transparently documenting the resolution of those issues, and helping to formulate the rebuttal to reviewer critique.

## Collaborators

While most reviewers may only need passive (read) access to the software, it is often desirable to collaboratively develop the software, i.e. involve another person or persons in improving the software. With this collaboration come legal and governance decisions, as well as technical requirements. The legal once concerns copyrights of the different contributors, and often of the employers (research organizations): Many academic institutions do not have yet clear guidelines on the legal aspects of how to contribute to collaborative software or how to accept contributions by other institutions. These can be established in contributor agreements. <!-- often we have MoA or collaboration agreements as legal frameworks -->

<!-- community building, badges -->

# Tools for Good Modeling Software Practise

The tools used should be adequate for the purpose of the modeling software, geared towards its software life cycle and tailored to its developer and user groups.

## Before you start

- Sustainability
- Availability/Re-use
- Life cycle.

## Ethics

Public money - public code?

## Source code management

<!-- Start with version control, source code management, offene Issue-Struktur

:::info
- [ ] to be reviewed by Carsten
- [ ] needs citations
:::
-->

A transparent and reproducible source code management (SCM, a modern term for version control system, VCS) is the basis for good software. The most common implementation nowadays is using the SCM-Software Git in combination with an online repository (a version control service), either hosted on the publicly available platform GitHub, GitLab, or an on-premise GitLab hosted and managed by an academic institution. This online platform serves as entrypoint for collaborators to contribute, provides a ticketing system, and offers functionalities for continuous integration and continuous deployment of the software. The platform (GitHub, GitLab or on-premise GitLab) should be chosen based upon the target group of collaborators. Platforms that are used already within a community are preffered. When there is an organization on this platform already, the developer should aim for adding the source code repository to this organizaiton, in order to increase visibility of the software within the community. When there is no such platform, one may choose GitHub because of the higher amount of potential contributors on this platform. On-premise GitLabs often offer more powerful Continuous Integration systems and may be preferred by academic institution, because the code is then hosted in the research center or a dedicated subcontracted partner. If an on-premise solution is chosen, one should make sure that external collaborators or reviewers can gain access to the source code and participate in discussions. Ideally the on-premise platform allows self-contained account creation.

Source code management is more than just an online backup for the code. The collaborative tools they offer, such as issues, merge/pull requests, and continous integration, improve the reusability of the code as they serve as documentation of the release and development workflow. Each of the following sections offer integrations with the source code management, and/or are represented by the tools that these platforms offer.

## Sustainability

How long to you want to use the software? Is it a one-off?

## Licensing

<!-- it's a nobrainer that you *have* to give permission -->

Strategic decisions copyleft or no copyleft?

REUSE.softawre - License manifesto
Fossology - License compatibility checking
ORT

## Contributor guideline

- Project Harmony
- Contributor Covenant
- Platforms, wikis, bugs, emails (oder ist das SCM?)
- Attribution

## Packaging

:::info

- [ ] to be reviewed by Carsten
- [ ] needs citations
      :::

Packages are commonly used in programming languages to standardize and simplify the installation of software, and to make the software findable via machine- and human-readable metadata. We distinguish language-specific package managers, such as they exist for Python, Julia, R, NPM or Fortran, from language inpendent package managers, such as Debians `dpkg` or Continuums `conda`. Language independent package managers commonly rely on the language-specific ones and build packages for a specific operating system (e.g. Debian Linux) or ecosystem (e.g. `conda`).

For the purpose of reproducibility and making software FAIR, any post processing routine, model or even small analysis scripts should be distibuted in form of a package. As packages declare dependencies, authorships, copyright, etc., they improve reusability and findability of the code. These packages should be built and deployed as part of the continuous integration and deployment pipeline to document the software architecture.

## Versioning and Releasing

- Keepachangelog (also concerning input/output of the model)
- Semantic Versioning
- Distribute pre-compiled binaries?

:::info

- [ ] to be reviewed by Carsten
- [ ] needs citations
      :::

In contrast to standard journal publications, software is always a work-in-progress (WIP). Even if there are no new features implemented, software needs to receive regular updates because of the rapid technological development we are facing. Without updates to the software, scientific analysis may become irreproducible because the software cannot be used, known as "code rot".

This need for continoues maintenance requires tracking the state of the software. Each scientific analysis should state what versions has been used (ideally in form of a _software bill of material_ (needs citation, lookup)) to make it reproducible, and in order to evaluate the analysis in the light of subsequent improvements of the software. The version of the software is thereby derived from so-called _tags_ in the source code repository. Each _tag_ has a name and describes the version of the software at a specific point, for instance after a major feature integration. The name of the _tag_ should follow the _semantic versioning_ or the _date versioning_ strategy (https://semver.org/lang/de/, https://packaging.python.org/en/latest/specifications/version-specifiers/). By following these versioning schemes, one guarantees the human- and machine-readibility of the software state.

Version control services, such as GitHub and GitLab, additionally allow the creation of so-called releases. _Releases_ are an addon to _tags_ in the source code repository and allow to equip the tag with additional notes, pre-compiled binaries of build artifacts, such as the documentation. Furthermore, _releases_ can and should be uploaded to an archive such as zenodo.org (see below), to make the software citeable at the given point in time.

## Documentation

- readMe
- User documentation
- API documentation
- Contributor/Developer Guide

## Code formatting

- The code is the documentation
  "Code should be written to minimize the time it would take for someone else to understand it." @Flesch1950
- Code conventions
- Black/Flake8/isort => but python specific
- Prettier
- linting?

## Code Structure

- Clear, consise, well-commented
- Accessible and consistent naming practise (community standards, conventions) PEP8
- Modular, complex tasks in managable functions, API
- error handling
- reuse and recycle, don't reinvent the wheel, use small tools [@Kernighan1976]
- The practise of programming "Simplicity, Generality, clarity" Worst case in scientific models: IO combined with core functionality.
- Encapsulation, OOP

## Maintenance

- Code Rot
- Regularly updating and maintaining code.
- Keeping dependencies up to date.

## Code verification

- unit testing (only available if you have units :=)
- code coverage
- doesitcompile?
- Continuous integration
- Reproducibility/regression tests

## Continuous deployment

- Product updates
- Documentation updates

## Archiving

- OpenABM.org
- Zenodo (communities)
- DOI
- softwareheritage.org
- hermes

## Governance

<!-- See Schneider2022 and DeNoni2014 -->

A benevolent dictator in software development refers to a leadership style where one individual, often the project's creator or lead developer, has significant control over decision-making processes within the project. Despite holding considerable authority, this individual typically exercises their power with the best interests of the project and its community in mind, hence the term "benevolent." This leadership model aims to maintain direction and cohesion within the project while still allowing for contributions and feedback from other team members or contributors.

- merge requests, even for small fixes and for core maintainers
- reviews
- community engagement: mailing lists, chats

## Publish your model

- Software paper => not part of doc
- Research Software directory => know your community

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

<!-- why it does not work
- lack of funding sustainability
- lack of resource to do GMSP
- change of personnel
-->

:::example The Joel Test

- [ ] Do you use source control?
- [ ] Can you make a build in one step?
- [ ] Do you make daily builds?
- [ ] Do you have a bug database?
- [ ] Do you fix bugs before writing new code?
- [ ] Do you have an up-to-date schedule?
- [ ] Do you have a spec?
- [ ] Do programmers have quiet working conditions?
- [ ] Do you use the best tools money can buy?
- [ ] Do you have testers?
- [ ] Do new candidates write code during their interview?
- [ ] Do you do hallway usability testing?
      :::

# DRY - good software development templates

Use software templates, copy from other projects

# Good enough software practise - a use case

Viable North Sea (ViNoS) is a socio-ecological model of the German North Sea small-scale fisheries [@Lemmen2023,@Lemmen2024]. It is an agent-based model coded in NetLogo [@Wilensky1999] embedded in a larger software system containing data, and Python data preprocessing and postprocessing scripts.

<!-- Wilson:
Scientists typically develop their own software for these purposes because doing so requires substantial domain-specific knowledge. As a result, recent studies have found that scientists typically spend 30% or more of their time developing software [1,2]. However, 90% or more of them are primarily self-taught [1,2], Prabhu2011
