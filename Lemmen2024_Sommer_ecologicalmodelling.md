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
So all we can and should do is to provide at best verified and validated models, and Good Modeling Practice aims at ensuring this. Examples of such good practices often named are: a clear purpose of a model, a thorough domain understanding, going from simple to complex, ensuring reproducibility and validation with data; exploring sensitivities and carefully selecting data of good quality [@Crout2008]. GMP may have been used first in socio-environmental sciences by @Smagorinsky1982, who claimed that "under any cirumstance, good modeling practise demands an awareness of the sensitivity ... to parametrization" (p.16), and the first application area of GMP seems to have been hydrology, with the first handbook on GMP by @VanWaveren1999; it has by now been applied to all areas of in socio-environmental, and socio-economic sciences and has been adopted in community standards such as the Overview, Design, Detail (ODD) documentation protocol and its derivatives [@Grimm2010].

@Jakeman2024 provide a list of studies on GMP (their table 1) and identify five main phases in the model life cycle, where GMP is relevant: (1) Problem scoping, (2) Problem conceptualization, (3) Model formulation and evaluation, (4) Model application, and (5) Model perpetuation, and the reiteration of these phase. Good Modeling Software Practices (GSP) span their phases 3--5, and are thus subsumed under GMP. But where GMP is concerned with the reliability and validity of model -- possibly foremost its purpose, scope and assumptions [@Wang2023], the part on GSP is concerned with the quality and reliability of its software implementation. A good quality software is not restricted to good computer code, but can also aid to support the iterative model life cycle and help to follow Good Scientific Conduct [@DFG2022].

<!-- Compute rmodel is only one part of the modeling cycle EFSA -->
<!-- Clean code -->

Independent of GMP, other scientific and technical fields where software plays a major role have developed the concept of Good Software Practise.
This concept can be traced back to the origin of the Unix systems, which has at its core not a monolithic but highly granular structure of many little programs that "do one thing only, and do it well", a later summary of the philosphy published by @Ritchie1974. These little tools should also allow to develop new software in a better way, argued @Kernighan1976, cautioning against reinventing the weel: "Do not repeat yourself" (DRY).
In 1996 Kernighan published the practise of programming, which was followed up by The Art of Unix Programming [@Raymond2003], of which the first chapter's content is a single acronym: KISS, short for "keep it simple, stupid!", an initially military slang attributed to @Stroop1960. But there was also a political component to it, advocated by Richard Stallman and implemented by researchers in universities like Berkeley and MIT: information should be free and computer programs should not be owned by companies but be public goods [@Stallman1994; @Stallman1983]. The Free Software movement emerged carrying the four basic freedoms to (1) run for any purpose, (2) be studied and modified, (3) distribute, and (4) modify and distribute [@Stallman2015].

<!--
- Raymond provides a series of design rules:
- Software Carpentry @Wilson2016 Software carpentry: t’s to teach computational competence: live coding, pair programming, open everthing
-->

Good software and good modeling practices have been brought together earlier: @Wilson2017 formulated "Good Enough Practices in Scientific Computing", addressing data managment, software organization, collaboration, project organization, change tracking, and manuscripts; @Comses2024c published a video tutorial series on "Responsible practices for Scientific Software", educating on the value of FAIR (Findable, Accessiple, Interoperable, Reusable, @ChueHong2022) principles, rich metadata, code management, archiving, documentation, and licensing.

<!--
Comses2024c
https://www.comses.net/education/responsible-practices/
-->

Despite these published best practise guidelines, much of the model corpus is not published at all, and for a trivial reason: @Barnes2010's survey stated that "the code is a little raw" was named as the main reason for not publishing the model. Here we aim to address this fear and help build confidence that the model code is good enough. We combine the existing advice on Good Modeling and on Good Software Practices, including those that address both, and break them down to concrete recipes on how to implement those good practices during the modeling software creation process. We start off by motivating each of the good practices and contextualizing them towards the goal of publishing a model software or a scientific result arising from model software. Then, we describe the tools that can be used in a non-exhausive way, but covering the entire range of good practices. You may deviate from the tools we selected, or disagree with them, and you may add others or leave some out that we suggested.

<!-- Wilson:
Scientists typically develop their own software for these purposes because doing so requires substantial domain-specific knowledge. As a result, recent studies have found that scientists typically spend 30% or more of their time developing software [1,2]. However, 90% or more of them are primarily self-taught [1,2], Prabhu2011 -->

## Structure

All models start with a purpose. That is the number one Good Modeling Practise advice put forward: know the purpose of the model. It doesn't hurt to know about your domain, either! Speak to experts, develop a conceptual model, only then start formalizing your model in math or in software [e.g. @Wang2023;Grimm2010].

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

## 1. Version control software

A transparent and reproducible distributed source code management (SCM, a modern term for version control system, VCS) is the basis for good software. The dominant SCM software is Git, originally invented by Linus Torvalds, the creator of Linux. As source code is text, the SCM tracks changes in lines or parts of lines of text. It can be very well used to manage other kinds of changing texts, such as the text of this manuscript. In fact, this manuscript was started with `git init; git add manuscript.md; git commit -m "Added empty manuscript"`, and has been evolving with repeated recording of small changes à la `git add -u; git commit -m "Added sections"`, with descriptive texts in quotation marks, the so-called commit messages.

With graphical interfaces to Git (such as Fork, Sourcetree or Tortoise), it is now easy to follow the step-wise development of code (or text documents), go back to points in time or critical development stages, to open experimental deviations from main development (`git branch`) and combine diverging developments (`git merge`). Did you mess up? Simply retrace your step back `git revert`; it helps you even to find in the recorded history those developments where things might have unnoticingly gone wrong `git bisect`.

<!--  Joel Spolsky described distributed version control systems as "possibly the biggest advance in software development technology in the [past] ten years". https://www.joelonsoftware.com/2010/03/17/distributed-version-control-is-here-to-stay-baby/
-->

Git and others are most powerful as distributed version control systems, in combination with other locations on your own computer, an intranet or the internet, for saving the software in different places (the "repositories") while keeping all those versions synchronized. The interaction of two repositories is managed by `git pull` and `git push`, i.e. unidirectional synchronizations. These synchronization commands can be used to synchronize the managed code also across different source code management services, effectively allowing redunandt and distributed backups minimizing the risk of losing the software from technical or human errors.

## 2. Source code management service

The most prominent online SCM services are GitHub, Sourceforge, and Gitlab, but many academic institutions also offer on-premise or cross-institutional GitLab or GitHub as a dedicated service for its students and researchers. The platform should be chosen based upon the target group of collaborators. Platforms that are used already within a community are preferred. When there is an organization, a project, or group on this platform already, the developer should aim for adding the source code repository to this organizaiton, in order to increase the visibility of the software within that community. When there is no such platform, one may choose GitHub because of the higher amount of potential contributors on this platform. On-premise GitLabs be preferred by academic institution, because the code is then hosted in the research center or a dedicated subcontracted partner.

All platforms allow the development to be visible publicly or to be private or accessible only to a small user group <!-- ; with Git's distributed capabilities it is also straightforward to have both a public and a private version of a repository and synchronize from the private one, where development may be hidden, to a public one.-->

This online platform serves as the entrypoint for collaborators to contribute, provides a ticketing system and release managment, and offers functionalities for continuous integration and continuous deployment of the software.

### Ticketing system

Often things don't work right away, or an error is detected in the software. For this, SCM services offer ticketing (also called bug tracker or issue tracking) systems, where one typically records the occurrence of an error, a "bug report", or a wish for future development, a "feature request". This works well for a single person, but even better when collaborators and reviewers of the software record their observations on faulty or missing issues with the software on this ticketing system.

<!-- If an on-premise solution is chosen, one should make sure that external collaborators or reviewers can gain access to the source code and participate in discussions. Ideally the on-premise platform allows self-contained account creation. often offer more powerful Continuous Integration systems and may
-->

Also Wikis, Discussions, ...

### Release management

Serve as documentation of the release and development workflow.

### Pull requests

### Continuous integration and deployment

The collaborative tools they offer, such as issues, merge/pull requests, and continous integration, improve the reusability of the code as tEach of the following sections offer integrations with the source code management, and/or are represented by the tools that these platforms offer.

<!--
The tools used should be adequate for the purpose of the modeling software, geared towards its software life cycle and tailored to its developer and user groups.
-->

## Licensing

<!-- it's a nobrainer that you *have* to give permission -->

Strategic decisions copyleft or no copyleft?

- Availability/Re-use
- Public money - public code?

REUSE.softawre - License manifesto
Fossology - License compatibility checking
ORT

## Before you start

- Sustainability
- Life cycle

## Sustainability

How long to you want to use the software? Is it a one-off?

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

:::info

- [ ] to be reviewed by Carsten
- [ ] needs citations
- [ ] needs to be shortened/reformatted?
      :::

A crucial aspect that often determines the software's impact and usability is its documentation. This chapter underscores the necessity of automated documentation for research software, focusing on six key components:

1. **The Necessity of a Proper README**: The README file serves as the first point of contact between the user and the software. It provides an overview of the software, its purpose, and its scope. A well-crafted README can significantly enhance user experience by providing clear, concise, and relevant information about the software. It can also include a brief description of the software's architecture and its main components.

2. **The Need for Installation Instructions**: Detailed and clear installation instructions eliminate guesswork, making the software accessible to a broader audience. These instructions should cover various operating systems and potential issues that might arise during the installation process. They should also specify the prerequisites, such as required libraries or dependencies.

3. **The Need for User Manuals**: User manuals are essential for enabling other modelers to rerun and use your code. They provide step-by-step guidance on how to use the software, explaining the functionality of different modules, and providing examples of how to use them. This allows users to understand the software's capabilities and apply it effectively to their research.

4. **The Necessity of an API Documentation**: API documentation provides a detailed description of how the software's functions work, the parameters they take, and the output they return. This is crucial for users who want to integrate the software into their own code or use it for more complex tasks. Good API documentation enhances the software's usability and encourages its adoption.

5. **The Need for a Developer Guide**: A developer guide is essential for fostering a collaborative environment and encouraging contributions from other researchers. It provides guidelines on how to contribute to the software, the coding standards to follow, and the process for submitting changes. This ensures that the software continues to evolve and improve, benefiting the entire research community.

6. **The Need for Automated Documentation Tools**: Tools like Sphinx or MkDocs, which automate the process of building documentation, are invaluable. They ensure that the documentation, including the API documentation, is always up-to-date. Additionally, they support doctests, which are tests embedded in the documentation. This ensures that the examples in the documentation work as expected, enhancing the reliability of the documentation.

## Code formatting

:::info

- [ ] to be reviewed by Carsten
- [ ] needs citations
      :::

@Flesch1950 once stated that "Code should be written to minimize the time it would take for someone else to understand it". This principle underscores the importance of code readability and maintainability, which can be significantly enhanced through automated code formatting and linting.

Adherence to community conventions is a key aspect of this process. For instance, the PEP8 conventions for Python ensure consistency across different parts of the codebase. This makes the code easier to read and understand, thereby reducing the time it takes for someone else to comprehend it.

Following such conventions can be facilitated by using automated formatters. They play a crucial role in maintaining these conventions. Tools like Black and isort for python adjust the code to meet specific formatting guidelines, eliminating the need for manual formatting and ensuring consistency across the codebase.

Linters, such as flake8, go a step further by analyzing the code for potential errors and violations of coding standards. They provide feedback that can help developers improve their code quality and adhere to best practices.

Linters and formatters should both be combined in pre-commit hooks. Pre-commit hooks facilitate the formatting and linting process by automatically running these tools before each commit. This ensures that all committed code adheres to the defined standards, further enhancing code quality and readability.

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

:::info

- [ ] to be reviewed by Carsten
- [ ] needs citations
      :::

Code verification is a critical aspect of climate modelling. It ensures good scientific practice, as well as the accuracy and reliability of the models.

Model developers should aim for using Continuous Integration (CI) in their software development process. Not only for post-processing software, but ideally even for the models themselves. CI is a development practice where developers integrate code into a shared repository frequently, ideally several times a day. Each integration is then verified by an automated build and automated tests to detect integration errors as quickly as possible. This practice is particularly important in climate modelling, where the codebase is often large and complex.

The methods used in the CI ranges simple tests whether the models compile, over unit tests that check individual routines in the model, to reproducibility/regression tests that ensure the scientific validity and integrity of the model. The compilation test is a basic but essential step in the code verification. If the model doesn't compile, it's an immediate indication that there's an issue that needs to be addressed. Unit tests can be challenging to implement in the realm of climate modelling. This is because it's often difficult to extract small, independent parts from the larger codebase for testing. Despite these challenges, unit tests are crucial for maintaining code quality and should be implemented wherever possible.

Finally, code coverage reports are an invaluable tool in code verification, in particular for post processing software that often contains analysis routines for various scientific questions. These reports provide a visual representation of what parts of the code are not covered by the test suite. This helps developers identify areas of the code that need more thorough testing.

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

:::warning

### The Joel Test

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

# Good enough modeling software practise - a use case

Viable North Sea (ViNoS) is a socio-ecological model of the German North Sea small-scale fisheries [@Lemmen2023,@Lemmen2024]. It is an agent-based model coded in NetLogo [@Wilensky1999] embedded in a larger software system containing data, and Python data preprocessing and postprocessing scripts.
