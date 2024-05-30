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
    address: Institute of Carbon Cycles, Helmholtz Coastal Data Center, Helmholtz-Zentrum Hereon, Max-Planck-Str. 1, 21502 Geesthacht, Germany
citation_author: Lemmen and Sommer
date: to be submitted to Ecological Modelling, May 2024
license: CC-BY-4.0
bibliography: paper.bib
SPDX-FileCopyrightText: 2024 Helmholtz-Zentrum hereon GmbH
SPDX-License-Identifier: CC-BY-4.0
abstract: "In socio-environmental sciences, models are frequently used as tools to represent, understand, project and predict the behaviour of these complex systems.  Along the modeling chain, Good Modeling Practices have been evolving that ensure -- amongst others -- that models are transparent and replicable.   Whenever such models are represented in software, good modeling meet good software practises, such as a tractable software development workflow, good code, collaborative development and governance, attribution of copyrights and acknowledgement of intellectual property, continuous integration and deployment, publication of a software paper and archiving. Too often in existing socio-environemntal model software, these practices have been regarded as an add-on to be considered at a later stage only; in fact, many modelers have shied away from publishing their model as open source out of fear that having to add good software practise is too demanding.  We here argue for making a habit of following a list of simple and not so simple practices early on in the implementation of the model.  We contextualize cherry-picked and hands-on practices for supporting good modeling practises, and we demonstrate their application in the example context of the Viable North Sea fisheries socio-ecological systems model."
acknowledgement: "This research is funded by the PACES programme Changing Coasts of the Helmholtz Gemeinschaft and an outcome of the Multiple Stressors on North Sea Life (MuSSeL) project funded by the German Ministry of Education and Research (BMBF, grant 03F0862A), and the DataHub Project of the Helmholtz Association [@Castell2023]. This manuscript benefitted from discussions in the context of the Open Modeling Foundation (OMF, https://www.openmodelingfoundation.org). We thank the open source communities that make ours and other modelers' work possible, among them the developers of and contributors to Git, Python, pandoc, and LaTeX."
authorcontributions: "C.L.: Conceptualization, Methodology, Writing – original draft, Writing – review & editing. P.S.: Writing - original draft, Writing - review & editing."
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
  - short: WIP
    long: Work in progress
  - short: SemVer
    long: Semantic versioning
  - short: CalVer
    long: Calendar versioning
  - short: CI
    long: Continuous Integration
  - short: CD
    long: Continuous Deployment
  - short: CTA
    long: Copyright Transfer Agreement
  - short: CLA
    long: Contributor License Agreement
  - short: OS
    long: Open Source
  - short: OSI
    long: Open Source Initiative
  - short: RT
    long: Regression Testing
  - short: PR
    long: Pull Request
  - short: RSE
    long: Research Software Engineer
  - short: SSI
    long: Software Sustainability Institute
  - short: MIT
    long: Massachusetts Institute of Technology
  - short: BSD
    long: Berkeley Software Distribution
  - short: GNU
    long: GNU is Not Unix
  - short: GPL
    long: GNU General Public License
  - short: CC
    long: Creative Commons
  - short: DOI
    long: Digital Object Identifier
  - short: OMF
    long: Open Modeling Foundation
  - short: JOSS
    long: Journal of Open Source Software
  - short: FOSS
    long: Free and Open Source Software
  - short: OA
    long: Open Access
  - short: PEP
    long: Python Enhancement Proposal
---

# Introduction

In socio-environmental sciences, models are frequently used as tools to represent, understand, project and predict the behaviour of these complex systems. The degree of a model's formalization ranges from conceptual to mathematical equations to implementation in software, and--by definition--all of these models are purpose-driven simplifications of the system they represent [@Stachowiak1973;@Romanowska2015]. We here concentrate on computational models, i.e. on socio-environmental models implemented in software, and there are many of those out there: Currently the CoMSES Network lists 1117 models [@Comses2024codebase]; @Janssen2015 asked 42 modelers about their inventory of aquatic ecosystem models and came up with a list of 278 different models, more than a decade after @Benz2001 counted some 1360 ecological model softwares.

So computational models are plenty and omnipresent in our field. But despite their undoubted value, they have been criticised as "unscientific", as they often escape a strict requirement of falsifiability: the code may be verifiable only within certain accuracy ranges but not universally; the model may be validated only in site-specific application but not universally [@Refsgaard2004].
So all we can do is to provide at best verified and validated models, and Good Modeling Practices (GMP) aim at ensuring this. Examples of such practices often named are: a clear purpose, a thorough domain understanding, going from simple to complex, ensuring reproducibility, exploring sensitivities and validation with good quality data [e.g., @Crout2008]. The first reference to this may have been by @Smagorinsky1982, who claimed that "under any cirumstance, good modeling practise demands an awareness of the sensitivity [] to parametrization" (p.16). From here on, GMP were elaborated and became widespread in the field of hydrology, with the first handbook on the topic by @VanWaveren1999; it has since been applied to all areas of socio-environmental sciences and has been adopted in community standards such as the Overview, Design, Detail (ODD) documentation protocol and its derivatives [@Grimm2006;@Grimm2010;@Grimm2020].

Good Modeling Practises appear as five phases in the model life cycle [@Jakeman2024; their table 1]: (1) Problem scoping and (2) conceptualization, (3) Model formulation and evaluation, (4) application, and (5) perpetuation, and the reiteration of these phases. Good Modeling Software Practices (GMSP) are prominent in phases 3--5, and are thus subsumed under GMP. But where GMP is concerned with the reliability and validity of a model --- possibly foremost its purpose, scope and assumptions [@Wang2023] --- GMSP is concerned with the quality and reliability of a model's software implementation and beyond: a good quality model software is not restricted to good computer code, but can also aid to support iterations through the model life cycle and help to follow Good Scientific Practise [@DFG2022].

Other scientific and technical fields where software plays a major role developed the concept of Good Software Practise, which can be traced back to the origins of the Unix systems, which has at its core not a monolithic but highly granular structure of many little programs that "do one thing only, and do it well" [@Ritchie1974]. These little tools should allow to develop new software in a better way, argued @Kernighan1976, for example by following the DRY principle: "Do not repeat yourself", and to KISS --- "keep it simple, stupid!" [@Stroop1960;@Raymond2003].

<!--. [@Kernighan1999] published the practise of programming, which was followed up by The Art of Unix Programming [@Raymond2003], of which the first chapter's content is a single acronym: KISS, short for "keep it simple, stupid!", an initially military slang attributed to .
There was also a political component to it, advocated by Richard Stallman and implemented by researchers in universities like Berkeley and MIT: information should be free and computer programs should not be owned by companies but be public goods [@Stallman1983]. T
-->

Cotemporaneously the Free Software movement emerged to emancipate software from the ownership of companies and consider it a public good, which can be (1) run for any purpose, (2) studied and modified, (3) distributed, and (4) modified and distributed [@Stallman1983;@Stallman1996], and with it the practices to ensure these freedoms in Open Source software. Educating about good practices became central in projects such as the Software Carpentry [@Wilson2016], highlighting the utility of live coding, pair programming and "open everything".

<!-- needs reference to GNU Stallmann 1984 system, also transition to Open Source or Fress Software
- Raymond provides a series of design rules:
-->

“Better software, better research” is a slogan by the Software Sustainability Institute (SSI), promoting better planning, development, reliability, performance and collaboration in research software, and advocationg for the recognition of the work of the people that develop such software but are often not acknowledged in publications as the major form of scientific output -- the Research Software Engineers (RSE) [@Katz2019;@Hettrick2022]. International agreements require that research data must be Findable, Accessiple, Interoperable, and Reusable [@Wilkinson2016]. Consequently, also software should be FAIR: (F) easy to find; (A) retrievable via standardised protols; (I) interoperates with other software by data exchange or an application programming interfaces (API), and (R) can be understood, modified, built upon, or incorporated into other software [@Barker2022]. Research organizations like @Comses2024fair educate about FAIR research software, including rich metadata, code management, archiving, documentation, and licensing. And as this seems too large a burden for many, @Wilson2017 formulated the "Good Enough Practices in Scientific Computing", addressing good enough data managment, software organization, collaboration, project organization, change tracking, and manuscripts. Together, good practises in modeling, software development, and research form a triangle around Good Modeling Software Practises ([Figure 1](#fig:triangle)).

:::warning

> And as this seems too large a burden for many, [@Wilson2017] formulated the "Good Enough Practices in Scientific Computing", addressing good enough data managment, software organization, collaboration, project organization, change tracking, and manuscripts.

- PS: Müssen wir genauer darauf eingehen was wir daraus ableiten und was das für das paper hier bedeutet?
- CL: Möglicherweise. Lies es mal und sag, was du daraus ableitest!
  :::

<!-- Do we need to talk about CARE, too?
Collective Benefit: Data ecosystems shall be designed and function in ways that enable Indigenous Peoples to derive benefit from the data.
Authority to Control: Indigenous Peoples’ rights and interests in Indigenous data must be recognised and their authority to control such data be empowered. Indigenous data governance enables Indigenous Peoples and governing bodies to determine how Indigenous Peoples, as well as Indigenous lands, territories, resources, knowledges and geographical indicators, are represented and identified within data.
Responsibility: Those working with Indigenous data have a responsibility to share how those data are used to support Indigenous Peoples’ selfdetermination and collective benefit. Accountability requires meaningful and openly available evidence of these efforts and the benefits accruing to Indigenous Peoples.
Ethics: Indigenous Peoples’ rights and wellbeing should be the primary concern at all stages of the data life cycle and across the data ecosystem.
-->

<div id="fig:triangle">

![The triangle formed by good practises in modeling, software and research \label{fig:triangle}](Figure_1.pdf)

</div>

Despite these published best practise guidelines, much of the model source code corpus, roughly 80% [@Barton2022] is not published at all along with the scientific publication, and for a trivial reason:
@Barnes2010's survey stated that "the code is a little raw" was named as the main reason for not publishing the model.
Here we aim to address this fear and help build confidence that the model code is good enough in line with @Wilson2016 and @Barnes2010;
beyond those, we break them down to concrete recipes on how to implement those good practices during the modeling software creation process.
We start off by motivating each of the good practices and contextualizing them towards the goal of publishing a model software or a scientific result arising from model software.
We describe the tools that can be used in a non-exhaustive way covering the entire range of good practices.
You may deviate from the tools we selected, or disagree with them, and you may add others or leave some out that we suggested.

## Structure

All models start with a purpose. That has since long bin the number one Good Modeling Practise advice put forward. It doesn't hurt to know about your domain, either, and most often a scientific software is developed by a domain expert [@Wilson2016]. Speak to other experts, develop a conceptual model, only then start formalizing your model in math and in software [@Wang2023;@Romanowska2015;@Grimm2006] to arrive at at your computational model -- the purpose-driven and simplified representation of your system in software.

Socio-environmental modeling software can be created by a _single person_; in fact, it often is in student or postdoc projects or individual programming sprints [@Hettrick2022]. Unfortunately from a software developing perspective, the necessity of having to be a domain expert at the same time means that 90% of scientists are self-taught developers without formal training in software engineering, and who spend 30% of their time on software development [@Wilson2016].
That one person will have to read her own code and to apply it for simulations, she will have to align the software development with her research, will have to understand what she did in the past, she will have to retrace the steps that led her to the current state. All of this necessitates to some degree that the work is stored redundantly in backups, and that changes are documented. She would like to ensure that code changes do not break previous work, and does that by testing the model after every update [@Rosero2016].

If the model is to be used to produce scientific results subject to peer review, the single person will have to ensure replicability of results. She will have to subject it to review (thus make it readable), and document it. And sometimes, she might be asked to support the reviewers in executing the model somewhere outside her own computer infrastructure. When feedback comes, there should be a platform to file the individual concerns and address them.

<!--
- PS: Is this really the case that a reviewer asks, how to run the model?
- CL: For JOSS it is mandatory, I have not seen it for others
-->

If at least one _other person_ is using the model, the permission issue --- also known as the license -- becomes pertinent. This other user needs a way to communicate with the developer, for feature requests or for reporting bugs. If that person intents to improve on your work, the permissions become more important, needing contributor agreements and codes of conduct. How are decisions made about the now joint modeling software -- some form of governance model needs to be established. With the growth of a community, even a community management system <!-- we dont talk about it yet. @PS, would you add an example here? --> might be required, with granular access, distributed roles, and fine-grained permissions. Regardless of the size of the collaboration structured reviews, pre-commit hooks, and common coding standards can be used to maintain high code quality.

Software sustainabilty not only critical once a larger user base is established other scientific software depends on the model, or the model is used for supporting scientific conclusions:

<!--
- PS: isn't this always the case? and doesn't this mean, that *Software sustainability* is always critical?
- CL: true, but how to rephrase it without losing this last point?
-->

Good Scientific Practise demands that primary data are available for a minimum of 10 years after when a scientific publications relies on them, and so should models [@DFG2022].
This is often a difficult requirement when models are developed in externally funded projects, when hardware and software environment change, or where mobility requirements demand for relocations of staff and frequent change of jobs. Mobility is a good argument in such circumstances for releasing your model as Free and Open Source Software (FOSS) so that the developer herself can take it along.

<!-- @todo Citation needed on support from communities, -->

### Single authors

Authors of scientific models eventually become authors or co-authors of scientific publications arising from or with the help of a model. As scientific authors, they are bound by ethical considerations such as the Guidelines for Safeguarding Good Research Practice, among them the unambiguous declaration of intellectual property to the work and ensuring availability of the model for a prolonged period of time [@DFG2022]. The declaration of intellectual property carries with it the proper acknowledgement of software the model is built on, and respecting the permissions pertaining to the sources used. The archiving requirement carries with it the obligation to ensure that technical failures or changes in the circumstances of the model author do not lead to the loss of the model: decentralized backups or public repositories help.

For many scientific model authors, getting stuff done may be more important than documenting it thoroughly, usefulness is more valued than red tape <!-- what does red tape mean? -->, spontaneous ideas are implemented preferably over those layed down in a management plan; individual agency supersedes organizational processes. In this way, scientific model software development reflects the ideas formulated in agile development: "Individuals and interactions over processes and tools. Working software over comprehensive documentation. Customer collaboration over contract negotiation. Responding to change over following a plan" [@Beck2001]. And while the items on the left are valued more, the items on the right are still important.<!-- this could go to discussion -->

There are many tools available to structure and ameliorate the work for the less preferred actions. Some that help with clarifying legal constraints and documentation, and others that help with structuring the development process, among them source code management services.

One criterion to assess whether software is sustainable is the truck factor, asking: "How many people can get hit by a truck, before the project becomes unmaintainable?"; the OpenSSF gold standard requires that is truck factor is $>= 3$ [@OpenSSF2024].

### Reviewers

To be published in a scientific journal, reviewers need to be able to access and understand the model. Various documentation principles can help to ensure this accessibility, including automatically generated application programming interface (API) references, in-code documentation and the generation of metadata <!-- through packaging? -->. Advice on how to write the code is old and simple: "Write code that minimizes the time it would take someone else to understand it---even if that someone else is you." [@Flesch1950].

But even before a reviewer invests her time in evaluating a model software, much can be done in advance by the author herself. In fact, where a reviewer might concentrate on model validation, the author could ensure model verification [@Sargent1994]. Verification answers the questions: Does the code do what the author intends it to do? To ensure this, it has become good software practice to employ unit testing and try to reach a good coverage of the test framework over your entire code base [@Ellims2006], and to integrate automated verification with the source code management service as Continuous Integration [CI,@Shahin2017].

How does an author deal with the feedback she receives during a friendly or journal-led review? Often, this comes as an itemized list of points to address; as such it is in an ideal form to be converted to _tickets_ or _issues_ in the SCM service, or a dedicated issue tracker system linked to the model software. Improvements to the model code can then be tied to the issue tracker, transparently documenting the resolution of those issues, and helping to formulate the rebuttal to reviewer critique.

### Collaborators

While most reviewers may only need passive (read) access to the software, it is often desirable to collaboratively develop the software, i.e. involve another person or persons in improving the software. With this collaboration come legal and governance decisions, as well as technical requirements. The legal once concerns copyrights of the different contributors, and often of the employers (research organizations): Many academic institutions do not have yet clear guidelines on the legal aspects of how to contribute to collaborative software or how to accept contributions by other institutions. These can be established in contributor agreements.

<!-- Possibly merge the above sections so that the single - reviewer -
<!-- often we have MoA or collaboration agreements as legal frameworks -->
<!-- community building, badges -->

# Tools for Good Modeling Software Practise

The tools described here can roughly be categorized as version control, source code management system, licensing, documentation, packaging, good code, archiving and maintenance, and publication.

<!-- Todo structue below sections under these (or other ) headings -->

## Version control software

A transparent and reproducible distributed source code management (SCM, a modern term for version control system, VCS) is the basis for good software and has been termed "possibly the biggest advance in software development technology" [@Spolsky2010]. The dominant SCM software is Git[^git], originally invented by Linus Torvalds, the creator of Linux. As source code is text, the SCM tracks changes in lines or parts of lines of text. It can be very well used to manage other kinds of changing texts, such as the text of this manuscript. In fact, this manuscript was started with `git init;` `git add manuscript.md;` `git commit -m "Added empty manuscript"`, and has been evolving with repeated recording of small changes à la `git add -u; git commit -m "Added sections"`, with descriptive texts in quotation marks, the so-called commit messages.

[^git]: https://git-scm.com open source distributed VCS Git. Note: all URLs in this manuscript have been last visited and checked on May 31, 2024.

With graphical interfaces to Git, such as Sourcetree[^sourcetree], or various integrations in text editors, such as Visual Studio Code [^vscode], it is now easy to follow the step-wise development of code (or text documents), go back to points in time or critical development stages, to open experimental deviations from main development (`git branch`) and combine diverging developments (`git merge`). Did you mess up? Simply retrace your step back `git revert`; it helps you even to find in the recorded history those developments where things might have unnoticingly gone wrong with `git bisect`.

[^sourcetree]: https://www.sourcetreeapp.com free Git client
[^vscode]: https://code.visualstudio.com editor with built-in Git implementation

Git and others are most powerful as distributed VCS, in combination with other locations on your own computer, an intranet or the internet, for saving your work in different places, the _repositories_, while keeping all those versions synchronized. The interaction of two repositories is managed by the unidirectional synchronizations `git pull` and `git push`. These commands can be used to synchronize the managed code also across different SCM services, effectively allowing redundant and distributed backups minimizing the risk of losing the software from technical or human errors or the risk of vendor lock-in [@Nyman2013].

## Source code management service

The most prominent online SCM service is GitHub[^github], but many academic institutions also offer on-premise or cross-institutional dedicated SCM services, such as Lower Saxony's community GitLab[^gitlab] for their students and researchers.

<!-- The platform should be chosen based upon the target group of collaborators. Platforms that are used already within a community are preferred. When there is an organization, a project, or group on this platform already, the developer should aim for adding the source code repository to this organizaiton, in order to increase the visibility of the software within that community. -->

A good reason to choose GitHub is the higher amount of potential contributors on this platform; on-premise GitLabs may be preferred by academic institution, because the code is then hosted in the research center or by a dedicated subcontracted partner and may offer better data protection. <!-- But ultimately, the platform should be chosen based upon the collaborator target group. -->
This online platform serves as the entrypoint for collaborators to contribute, provides a ticketing system and release management, and offers functionalities for continuous integration and continuous deployment of the software.

[^github]: https://github.com Public GitHub
[^gitlab]: https://gitlab.gwdg.de/ Lower Saxony Academic Cloud GitLab

<!--
- PS: as we are Helmholtz, maybe better mention codebase.helmholtz.cloud? gitlab.gwdg.de is also not open to everyone, so maybe it's a rather bad example
- CL: yeah, Academic Cloud seems to allow you to self-register even without institutional access. but we can take helmholtz.cloud
-->

<!--All platforms allow the development to be visible publicly or to be private or accessible only to a small user group  with Git's distributed capabilities it is also straightforward to have both a public and a private version of a repository and synchronize from the private one, where development may be hidden, to a public one.
- PS: why did you remove the note about on-premise gitlabs and the desired requirements? such as getting externals onto the gitlab?
- CL: on-premis is still there. I removed Getting the externals on the gitlab as this is possible in both Gitlabs I've worked on (helmholtz and gwdg) without a problem, so not an issue in this section
-->

### Ticketing system

Often things don't work right away, or an error is detected in the software. For this, SCM services offer ticketing (also called bug tracker or issue tracking) systems, where one records the occurrence of an error, a "bug report", or a wish for future development, a "feature request". This works well for a single person, but even better when collaborators and reviewers of the software record their observations on faulty or missing issues with the software on this ticketing system.
Beyond the ticketing system, the SCM service may also offer communication facilities like discussion forums, wikis, mailing list or service desks, which often provide cross-referencing functionality to Git commits and issues.

<!-- If an on-premise solution is chosen, one should make sure that external collaborators or reviewers can gain access to the source code and participate in discussions. Ideally the on-premise platform allows self-contained account creation. often offer more powerful Continuous Integration systems and may
-->

### Continuous integration and deployment

<!-- Hint to "Fail fast" philosophy?" -->

CI is a development practise where developers integrate code into a shared repository frequently, ideally several times a day, but at least on every `git push` to a repository. Each integration is then verified by an automated build and automated tests to detect errors as quickly as possible; the frequent and automated check reduce the risk of accumulating errors.
SCM services like GitLab or GitHub provide such automated integrations, called "Actions" on GitHub, but there are many CI tools available outside the comprehensive SCM services, such as Circle CI[^circleci].
CD is often triggered after the CI ends with success. In this automation, the products of a modeling software can be provisioned, such as a complete binary package for download, an updated and nicely formatted documentation, or a suite of simulation results and their statistical evalution, for example. CD often interacts with other external services to update web pages, to upload to package repositories, or to submit to an archiving service.

[^circleci]: Circle CI https://circleci.com

### Pull requests

Pull requests (PR) offer an SCM service managed way to accept other people's changes to your software into your development. Collaborators typically duplicate your software in a _fork_, apply changes locally and then file a PR providing a detailed explanation of the modifications and their purpose. The SCM service allows you to review the changes, possibly ask for further explanations or modifications, to have it automatically tested with CI, and finally to `git merge` the collaborator's work. Similarly, a branch-based approach to PRs uses separate feature `git branch` branches and often allows to create a Changelog based on the merging of the feature branch into main.

## Licensing

Model software development is a creative process. It thus constitutes intellectual property and the right to determine how the model software can be used, re-used and shared and modified, i.e. the copyrights.
The exact terms are laid down in what is called a license. Without a license there is no permission, so every model software needs a license, and with it the name of the person or organization holding the copyrights. While some model software may be published under proprietary licenses and without disclosing the source code, the majority of current modelings software is distributed as open source software, as defined by @OSI2024, and under a permissive or copyleft open source license, among them the widely used BSD, MIT, Apache and GPL licenses.

<!-- ref most used licenses -->
<!-- public money public code -->

### Choosing and sorting out different licenses

There are strategic decisions involved in choosing for copyleft versus permissive licenses, also related to the community in your field and dependent on third-party software used in your modeling software paper. There are tools to support choosing a license[^choosealicense], to manage licenses towards better reuse[^reuse], and to assess the compatiblility of different licenses with a project[^fossology]^,^[^ort].

[^choosealicense]: https://choosealicense.com
[^reuse]: https://reuse.software
[^fossology]: https://www.fossology.org
[^ort]: https://github.com/oss-review-toolkit/ort

### Contributions

With collaboration also comes the obligation to sort out the copyrights evolving from different contributors, who are all creators and thus natural copyright holders (or their organization). Your contributors may choose to assign their copyrights to you in what is usually called a copyright transfer agreement (CTA), and is well known from the publication process for scientific papers before the Open Access (OA) movement. Alternatively, your contributors may permit you to exercise copyrights arising from their contribution in a separate agreement, a Contributor License Agreement (CLA) or a Fiduciary License Agreement. Project Harmony[^harmony] or the Contributor Agreements[^contributoragreements] support the drafting of such agreements.

[^harmony]: https://www.harmonyagreements.org Project Harmony
[^contributoragreements]: https://contributoragreements.org Contributor Agreements

### Collaboration

<!-- @Singer2008: “ yet little is known about how software engineers perform their work.”2 -->

Collaborative software engineering is an intensely people-oriented activity [@Singer2008]; to keep both the software as well as the collaboration healthy, many projects adhere to the Contributor Covenant[^covenant]. This provides guidelines for respectful and constructive behavior, it prohibits harassment and discrimination, and overall help maintain a positive and welcoming environment.

[^covenant]: https://www.contributor-covenant.org Contributor Covenant

<!-- git blame does not record individual contributions (they are overwritten), -->

## Versioning and Releasing

<!--
- Keepachangelog (also concerning input/output of the model)
- Distribute pre-compiled binaries?
-->

In contrast to standard journal publications, software is always a work-in-progress (WIP). Even if there are no new features implemented, software needs to receive regular updates because of the rapid technological development -- both in hardware as well as software. Without updates to the software, scientific analysis may become irreproducible because the software cannot be used, known as "code rot" [@Liew2017]; but also heterogeneous and scattered incremental updates of the the software may lead to "code decay", where the global code quality declines despite local improvements [@Eick2001].

This need for continuous maintenance requires tracking the state of software and to record changes to software beyond the capabilities offered by `git log`. The state can be recorded ideally by a _software bill of material_ [SBOM, @Stewart2022]. In an SCM, each state can be marked with an identifier `git tag` that carries a human readable short description as well as version information following a consistent strategy, such as _semantic versioning_[^semver] or _calendar versioning_[^datever].
SCM services in addition allow the creation of _releases_. They are an elaborated version of tags, and can include further resources, such as additional documentation or pre-compiled binaries. They also integrate with archiving services such as Zenodo (see below) upon a new release.

[^semver]: Semantic versioning https://semver.org
[^datever]: Calendar versioning https://calver.org
[^changelog]: Keep a ChangeLog https://keepachangelog.com

While changes to the source code are tracked in the SCM, the reasoning behind those and the user-focused communication of these changes should be kept in a change log[^changelog], a technology since long enforced by the GNU coding standard [@Chen2004].

<!-- GNU coding standard 2002: You can think of the change log as a conceptual ‘‘undo list’’ which explains how earlier versions were different from the current version. People can see the current version; they don’t need the change log to tell them what is in it. What they want from a change log is a clear explanation of how the earlier version differed. -->

## Bundling your application

:::info

- [ ] to be reviewed by Carsten
- [ ] needs citations
- [x] needs to distinguish pre- and post processing routines from real model
- [ ] do some research whether there are models that are distributed as package
- [x] reference versioning section and versioneer
- [x] docker is missing
      :::

Much of research software, and especially climate models, are distributed by giving access to the repository hosted on an SCM, or to an archive file that contains the entire source code. Users are then expected to install the (often numerous) requirements, and eventually compile the code and run the model. To improve usability, more state-of-the art software engineering techniques like packaging and containerization are available. Not only do they standardize and simplify the installation of the code, they also improve its findability via machine- and human-readable metadata, support reusability via versioning and ensure proper citability.

### Packages

Packages are commonly used in programming languages to standardize and simplify the installation of software, and to make the software findable via machine- and human-readable metadata. Technically speaking, packages are files that contain other files, most importantly a _manifest_ that tells the package name and version. We distinguish language-specific package managers, such as they exist for Python, Julia, R, NPM or Fortran, from language-inpendent package managers, such as Debians `dpkg` or Continuums `conda`; those, however, often depend on the operating system or computer architecture.

<!-- Language-independent package managers commonly rely on language-specific ones and build packages for a specific operating system (e.g. Debian Linux) or ecosystem (e.g. `conda`). -->

Packages allow a detailed declaration of dependencies and as such greatly improve the reusability of the code. Tools like versioneer[^versioneer] further provide the possibility to combine the package version with Git tags (see _Version control software_ above).

For the purpose of reproducibility and making software FAIR, any pre- or post-processing routine, model or even small analysis scripts should be distibuted in form of a package (although it almost impossible for some models to be distributed as a package). As packages declare dependencies, authorships, copyright, etc., they findability of the code and ensure attribution to the software developers. These packages should be built and deployed as part of the continuous integration and deployment pipeline to document the software architecture.

<!-- @todo rewrite above paragraph -->

[^versioneer]: https://github.com/python-versioneer/python-versioneer

<!-- Here, talk also about repostiories alon gwith the packages -->

<!-- Allen 2019 http://aspbooks.org/publications/523/593.pdf
Specify how you want your software cited. Be specific in how you want your software cited and make this information easy to find by putting it in your README, on the code’s home page, in a citation file using the citation file format (CFF) standard (Druskat et al. 2018) or a codemeta.json file (Jones et al. 2017). To comply with the Force11 Software Citation Principles and ensure citation tracking in ADS, request ci- tation for the software itself via ASCL ID or a DOI from an archival service, such as Zenodo or Figshare.

Release your code.. Specify how you want your software cited., Assign a license., Register your Code. Archive your code.
-->

### Containers

Apart from packages, containers can simplify the installation. Like packages, containers are distributed as a single file. They do not, however, contain a manifest, but instead they contain an entire operating system where necessary packages have been installed already. Distributing a model as a container improves reusability as everything is compiled and installed already and makes the usage of the model independent of the available infrastructure.

<!-- what about binder/repo2docker ? -->

<!-- I think we need to address Docker (or other containers)
Package - Infrasturkure unabhängig versus Container - Infrastruktur wird mitgeliefert.
podman (redhat) und kubernetes for container orchestration.
-->

## Documentation

:::info

- [ ] to be reviewed by Carsten
- [ ] needs citations
- [x] needs to be rewritten from a user-perspective. Who am I and what is my software, and what do I need?
      :::

Proper documentation often determines a model software's impact and usability. Most developers use inline comments for code, and they are indeed important, but their impact on helping other scientists in contributing or using the software is limited. Above all, proper ReadMe text files (often in Markdown format) are important, even if the author is her sole user. The ReadMe is the first entry point for the user of contributor to the software to understand, what he or she is looking at, as SCM services are rendering an HTML representation to the user. It can provide an overview of the software, its purpose, and its scope. A well-crafted ReadMe can enhance user experience by providing clear, concise, and relevant information about the software. It can also include a brief description of the software's architecture and its main components, as well as installation instructions.

Another essential part of your documentation is the contributing guide. This document fosters a collaborative environment and encourages contributions from other researchers. It provides guidelines on how to contribute to the software, the coding standards to follow, and the process for submitting changes. This ensures that the software continues to evolve and improve, benefitting the entire research community.

For post-processing routines, that shall be used by other researchers as well, automated documentation tools like Sphinx[^sphinx] or MkDocs[^mkdocs] exist that help creating a well-documented and user-friendly software. They automate the process of building documentation, and are invaluable in any long-living software project. They ensure that the documentation, including the API documentation, is always up-to-date. Additionally, they support doctests, which are tests embedded in the documentation. This ensures that the examples in the documentation work as expected, enhancing the reliability of the documentation. Such documentations should at their minimum contain the following sections:

[^sphinx]:
[^mkdocs]:

1. **Installation Instructions**: Detailed and clear installation instructions eliminate guesswork, making the software accessible to a broader audience. These instructions should cover various operating systems and potential issues that might arise during the installation process. They should also specify the prerequisites, such as required libraries or dependencies.

2. **User Manual**: User manuals (or in it's minimal form a _getting started guide_) are essential for enabling other modelers to rerun and use your code. They provide step-by-step guidance on how to use the software, explaining the functionality of different modules, and providing examples of how to use them. This allows users to understand the software's capabilities and apply it effectively to their research.

3. **API Documentation**: API documentation provides a detailed description of how the software's functions work, the parameters they take, and the output they return. This is crucial for users who want to integrate the software into their own code or use it for more complex tasks. Good API documentation enhances the software's usability and encourages its adoption.

4. **Developer Manual**: If you aim for contributions by other researchers, the developer manual is a must-have for the onboarding. It contains more detailed information about the framework that you are developing, that do not have place in the _contributing guide_ or _user manual_.

## Code formatting and linting

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

:::warning

- [ ] needs to be written
      :::

- Clear, consise, well-commented
- Accessible and consistent naming practise (community standards, conventions) PEP8
- Modular, complex tasks in managable functions, API
- error handling
- reuse and recycle, don't reinvent the wheel, use small tools [@Kernighan1976]
- The practise of programming "Simplicity, Generality, clarity" Worst case in scientific models: IO combined with core functionality.
- Encapsulation, OOP

## Maintenance

:::warning

- [ ] needs to be written
      :::

- Regularly updating and maintaining code.
- Keeping dependencies up to date. -> packaging, SBOM

## Code verification

Every time model code changes, it can break technically or produce unreasonable results. Such errors introduced by changes are called regressions. To prevent them, the model can be manually verified, but optimally, this process is automated as Continuous Integration (CI) [@Rosero2016].

<!--
This practice is particularly important in climate modelling, where the codebase is often large and complex. -->

The methods used in the CI ranges simple tests whether the models compile, over unit tests that check individual routines in the model, to reproducibility/regression tests (RT) that ensure the scientific validity and integrity of the model (XXXXX).

<!-- The compilation test is a basic but essential step in the code verification. If the model doesn't compile, it's an immediate indication that there's an issue that needs to be addressed. Unit tests can be challenging to implement in the realm of climate modelling. This is because it's often difficult to extract small, independent parts from the larger codebase for testing. Despite these challenges,  -->

Unit tests are crucial for maintaining code quality, and automate verification, and code should be written having the testing framework in mind. How much of the code is unit tested is reported as the

<!-- We could reference Test Driven Developmenent -->

code coverage. <!-- reports are an invaluable tool in code verification, in particular for post processing software that often contains analysis routines for various scientific questions --> These reports provide a visual representation of what parts of the code are <!-- not covered by the test suite. This helps developers identify areas of the code --> that need more thorough testing.

## Archiving

:::warning

- [x] needs to be written (PS)
  - Unfortunately I am not familiar with OpenABM.org, so I left this out
- [ ] to be reviewed by Carsten
      :::

Archiving the source code for model and post-processing routines is essential
to follow Good Scientific Practices. As modellers change their working
conditions frequently, it is crucial that this archive is publicly available,
and stable for at least ten years.

The most simple solution for open-source projects is using the Software
Heritage Project[^software-heritage]. Many SCMs are already
crawled by this project, so when you upload your repository and make it
publicly available, it will be archived automatically. If your SCM is not
crawled by the Software Heritage Project, you can add it manually.

A more citeable archiving solution is guaranteed by uploading
the source code and generating a Digital Object Identifier (DOI). There are
various institutional platforms that offer this service, the most prominent
one being Zenodo[^zenodo]. Uploading source code on zenodo does not
only archive the source code, it makes it citeable, too. To improve the
findability of the upload on zenodo, one should additionally group the projects
into so-called communities. Either there are already existing communities, or
the modelling community itself decides to create a community.

Most of these platforms additionally offer to create versioned DOIs, meaning
that each upload gets its own DOI, and all versions are shown on the same page.
You should use this framework in combination with releases. That way, each
release gets its own DOI and the contributions to the release are citable.
Various helpers exist to automate this upload, such as Zenodo's
GitHub integration[^zenodo-integration], or the hermes workflow[^hermes] [@Druskat2022].

[^software-heritage]: https://www.softwareheritage.org/
[^zenodo]: https://zenodo.org
[^zenodo-integration]: https://docs.github.com/en/repositories/archiving-a-github-repository/referencing-and-citing-content
[^hermes]: https://github.com/hermes-hmc/hermes

<!-- Add the possibility for a permanent DOI with changing versions on Zenodo -->

<!--
- OpenABM.org
- DOI
 -->

## Governance

:::warning

- [ ] needs to be written
      :::

<!-- See Schneider2022 and DeNoni2014 -->

A benevolent dictator in software development refers to a leadership style where one individual, often the project's creator or lead developer, has significant control over decision-making processes within the project. Despite holding considerable authority, this individual typically exercises their power with the best interests of the project and its community in mind, hence the term "benevolent." This leadership model aims to maintain direction and cohesion within the project while still allowing for contributions and feedback from other team members or contributors.

- merge requests, even for small fixes and for core maintainers
- reviews
- community engagement: mailing lists, chats

## Publish your model

:::warning

- [x] needs to be written (PS)
- [ ] to be reviewed by Carsten
      :::

Many journals nowadays request to publish the source code that has been used
to generate figures alongside to the journal publication. While this is
useful from the reusability perspective, it does not acknowledge the amount of
work that has been put into the software, documentation, etc., nor does it take
into account that the software might be developped further after the paper has
been published.

Therefore we recommend to publish software not only as part of the scientific
publication, but additionally in a software journal, such as the Journal of
Open Source Software [JOSS, @Smith2018].
These journals are meant to be _developer-friendly_, i.e. when following the
above-mentioned tools for your software, then the barriers
to publish in these journals are usually quite low. But you get the benefit
of a peer-reviewed journal publication and acknowledgments of your work on the
code.

Nevertheless, journal publications are not domain-specific, so they do not
generally improve the findability of your software. Therefore the most
important aspect on publish your code (or its metadata) is to list it in a
platform that your colleagues know.
We mentioned the communities on Zenodo[^zenodo-communities]
already, an alternative might be the Research Software Directory[^rsd] [@Spaaks2020]
that allows to groups software into projects.

[^zenodo-communities]: https://zenodo.org/communities/
[^rsd]: https://research-software-directory.org/, https://helmholtz.software

<!--
- Software paper => not part of doc
- Research Software directory => know your community
 -->

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

## DRY - good software development templates

Despite the many benefits of good research software engineering techniques, the above mentioned techniques and tools unarguably put a significant burden on the scientist.

Not only that it requires quite some time to get used to them, the rapid technological development makes it difficult to stay up-to-date. The diverse skill sets of researchers and time constraints further complicates the situation. Consequently, software often becomes obsolete, challenging to maintain, and prone to errors. New projects should therefore be derived from software templates that implement these techniques, such as [@Pirogov2024] or [@Sommer2024]. To maintain the software derived from these packages, one can utilize cruft [^https://cruft.github.io/cruft] such as demonstrated by [@Sommer2024], or cookietemple[^https://github.com/cookiejar/cookietemple/]. Especially the fork- and cruft-based approach by [@Sommer2024] provides a methodology for modelling ecosystems to provide a standardized setup for post-processing routines, plugins, etc., implementing all the techniques and tools from the previous sections.

# Good enough modeling software practise - a use case

Viable North Sea (ViNoS) is a socio-ecological model of the German North Sea coastal fisheries [@Lemmen2023,@Lemmen2024]. It is an agent-based model coded in NetLogo [@Wilensky1999] embedded in a larger software system containing data, and Python/R data pre- and postprocessing scripts. Its source code is managed by Git, with a primary SCM service on an academic Gitlab[^vinos-gitlab] and a secondary one on public Github. On the primary SCM, GitLab issues provide the ticketing system, a CI produces docker images of the software and its dependencies for different versions of the underlying operating system and the NetLogo IDE and then performs unit and replicability testing. As part of the CD, a small production simulation generates model results and pushes them to a static web page on the SCM service; the documents provided with the model (ODD, JOSS, this manuscript, and others) are compiled from their version-controlled sources to pdfs and uploaded. The CD is integrated with Mkdocs and pushes to a public readthedocs instance for the user guide. On the secondary CI, a release management hooks into Zenodo to provide permanent and DOI citable archives for each model release.
Locally, a pre-commit workflow, triggered upon each `git commit` ensures that the copyrights and license catalogs are complete for each file, that all structured documents comply with their respective type definition, and that python codes conform to PEP8 coding standards. The tools used for this are `reuse`, `black`, `flake8`, more general formatters to remove empty line endings, syntax checkers for metadata in `yaml`, `toml`, and `json` structured formats, and the general-purpose code beautifier `prettier`.
In the program root folder, a `CITATION.cff` suggests how to cite the software, a `codemeta.json` provides package metainformation, a `ChangeLog.md` the user-oriented change information. Every directory contains at least a `ReadMe.md`.

[^vinos-gitlab]: https://codebase.helmholtz.cloud/mussel/netlogo-northsea-species

# Conclusion

# References {.unnumbered}

<!-- Comment to this was that instead of bullet lists there should be hands-on. -->

<!-- Rosero et al:
15 Years of Software Regression Testing Techniques — A Survey
RT is usually run manually, based on personal experience or randomly, in the
best-case scenario. Recently, test automation has become popular, especially with
the advent of the agile movement [7, 8] where approaches such as eXtreme Program-
ming (XP), Test Driven Development (TDD), Continuous Integration or Continuous
Delivery are regularly used.
-->

<!--
The Hidden REF: Celebrating everyone that makes research possible
Hettrick, Simon https://zenodo.org/doi/10.5281/zenodo.11266575
-->

<!--
Vast majority of BUS factor is one (from RSE survey)
https://softwaresaved.github.io/international-survey-2022/

RSE Survey Bus Factor across all participants (most UK, Germany) is <=1 for 57%, is 1<x<=2 for 27%
Simon Hettrick, Radovan Bast, Alex Botzki, Jeff Carver, Ian Cosden, Steve Crouch, Florencia D’Andrea, Abhishek Dasgupta, William Godoy, Alejandra Gonzalez-Beltran, Ulf Hamster, Scott Henwood, Patric Holmvall, Stephan Janosch, Thibault Lestang, Nick May, Olivier Philippe, Johan Philips, Nooriyah Poonawala-Lohani, Paul Richmond, Manodeep Sinha, Florian Thiery, Ben van Werkhoven, Claire Wyatt & Qian Zhang. “RSE Survey 2022”, Pre-final release for 2022 results (Version 2022-v0.9.0). Zenodo DOI: https://doi.org/10.5281/zenodo.6884882. Check the repository’s citation file.

-->

<!-- Allen 2019 http://aspbooks.org/publications/523/593.pdf
Specify how you want your software cited. Be specific in how you want your software cited and make this information easy to find by putting it in your README, on the code’s home page, in a citation file using the citation file format (CFF) standard (Druskat et al. 2018) or a codemeta.json file (Jones et al. 2017). To comply with the Force11 Software Citation Principles and ensure citation tracking in ADS, request ci- tation for the software itself via ASCL ID or a DOI from an archival service, such as Zenodo or Figshare.

Release your code.. Specify how you want your software cited., Assign a license., Register your Code. Archive your code.
-->

<!--  Barton2020 https://www.pnas.org/doi/epdf/10.1073/pnas.2202112119
 Articles that report the results of models are frequentlynot sufficient to reproduce the models, even when the articles describe theunderlying concepts and assumptions. 80% do not provide access to the model code. .  met in December 2021 to establish the OpenModeling Foundation (OMF).. Opinon paper. -->
