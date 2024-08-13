---
title: Good Modelling Software Practices
journal: Ecological Modelling
keywords:
  - Good Modeling Practice
  - Good Software Practice
  - Good Scientific Practice
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
date: re-submitted to Ecological Modelling, 15 August 2024
license: CC-BY-4.0
bibliography: paper.bib
SPDX-FileCopyrightText: 2024 Helmholtz-Zentrum hereon GmbH
SPDX-License-Identifier: CC-BY-4.0
abstract: "Frequently in socio-environmental sciences, models are used as tools to represent, understand, project and predict the behaviour of these complex systems. Along the modelling chain, Good Modelling Practices have been evolving that ensure -- amongst others -- that models are transparent and reproducible. Whenever such models are represented in software, Good Modelling meet Good Software Practices, such as a tractable  development workflow, good code, collaborative development and governance, continuous integration and deployment, and meet Good Research Practices, such as attribution of copyrights and acknowledgement of intellectual property, publication of a software paper and archiving. Too often in existing socio-environmental model software, these practices have been regarded as an add-on to be considered at a later stage only; in fact, many modellers have shied away from publishing their model as open source out of fear that having to add good practices is too demanding. We here argue for making a habit of following a list of simple and not so simple practices early on in the implementation of the model life cycle. We contextualise cherry-picked and hands-on practices for supporting Good Modelling Practices, and we demonstrate their application in the example context of the Viable North Sea fisheries socio-ecological systems model."
acknowledgement: "This research is funded by the PACES programme Changing Coasts of the Helmholtz Gemeinschaft and an outcome of the Multiple Stressors on North Sea Life (MuSSeL) project funded by the German Ministry of Education and Research (BMBF, grant 03F0862A), and the DataHub Project of the Helmholtz Association [@Castell2023]. This manuscript benefitted from discussions in the context of the Open Modeling Foundation (OMF, https://www.openmodelingfoundation.org). We thank the open source communities that make ours and other modelers' work possible, among them the developers of and contributors to Git, Python, pandoc, and LaTeX."
authorcontributions: "C.L.: Conceptualization, Methodology, Writing – original draft, Writing – review & editing. P.S.: Writing - original draft, Writing - review & editing."
...

# Introduction

Frequently in socio-environmental sciences, models are used as tools to represent, understand, project and predict the behaviour of these complex systems. The degree of a model's formalization ranges from conceptual to mathematical equations to implementation in software [@Romanowska2015], and--by definition--all of these models are purpose-driven simplifications of the system they represent [@Stachowiak1973]. We here concentrate on computational models, i.e. on socio-environmental models implemented in software, and there are many of those out there: Currently the CoMSES Network lists 1117 models [@Comses2024codebase]; @Janssen2015 asked 42 modelers about their inventory of aquatic ecosystem models and came up with a list of 278 different ones, more than a decade after @Benz2001 counted some 1360 ecological model softwares.

So computational models are plenty and omnipresent in our field. But despite their undoubted value, they have been criticised as "unscientific", as they often escape a strict requirement of falsifiability: the code may be verifiable only within certain accuracy ranges but not universally; the model may be validated only in site-specific application but not universally [@Refsgaard2004].
So all we can do is to provide at best verified and validated models, and Good Modelling Practices (GMP) aim at ensuring this.

<!-- Add reference and text for "Fit for purpose" modeling -->

Examples of such practices often named are: a clear purpose, a thorough domain understanding, going from simple to complex, ensuring reproducibility, exploring sensitivities and validation with good quality data [e.g., @Crout2008]. The first reference to this may have been by @Smagorinsky1982, who claimed that "under any cirumstance, good modeling practice demands an awareness of the sensitivity [] to parametrization" (p.16). From here on, GMP were elaborated and became widespread in the field of hydrology, with the first handbook on the topic by @VanWaveren1999; it has since been applied to all areas of socio-environmental sciences and has been adopted in community standards such as the Overview, Design, Detail (ODD) documentation protocol and its derivatives [@Grimm2006;@Grimm2010;@Grimm2020].

Good Modeling Practices appear as five phases in the model life cycle [Table 1 of @Jakeman2024]: (1) Problem scoping and (2) conceptualization, (3) Model formulation and evaluation, (4) application, and (5) perpetuation, and the reiteration of these phases. Good Modelling Software Practices (GMSP) are prominent in phases 3--5, and are thus subsumed under GMP. But where GMP is concerned with the reliability and validity of a model---possibly foremost its purpose, scope and assumptions [@Wang2023]---GMSP is concerned with the quality and reliability of a model's software implementation and beyond: a good quality model software is not restricted to good computer code, but can also aid to support iterations through the model life cycle and help to follow Good Scientific or Research Practice [@DFG2022;@Allea2023].

Other scientific and technical fields where software plays a major role developed the concept of Good Software Practice; it can be traced back to the origins of the Unix system, which has at its core not a monolithic but highly granular structure of many little programs that "do one thing only, and do it well" [@Ritchie1974]. These little tools should allow to develop new software in a better way, argued @Kernighan1976, for example by following the DRY principle: "Do not repeat yourself", and to KISS --- "keep it simple, stupid!" [@Stroop1960;@Raymond2003].
Cotemporaneously the Free Software movement emerged to emancipate software from the ownership of companies and consider it a public good, to be (1) run for any purpose, (2) studied and modified, (3) distributed, and (4) modified and distributed [@Stallman1983;@Stallman1996], and with it the practices to ensure these freedoms in Open Source software. Educating about good practices became central in projects such as the Software Carpentry [@Wilson2016], highlighting the utility of live coding, pair programming and "open everything".

<!-- This paragraph needs better flow -->

“Better software, better research” is a slogan by the Software Sustainability Institute (SSI), promoting planning, development, reliability, performance and collaboration in research software, and advocationg for the recognition of the work of the people that develop such software but are often not acknowledged in publications as the major form of scientific output -- the research software engineers (RSE) [@Katz2019;@Hettrick2022]. International agreements require that research data must be Findable, Accessible, Interoperable, and Reusable [@Wilkinson2016]. Consequently, also research software should be FAIR: (F) easy to find; (A) retrievable via standardised protols; (I) interoperable with other software by data exchange or an application programming interfaces (API), and (R) understandable, modifiable, and to be built upon, or incorporated into other software [@Barker2022]. Research organizations like @Comses2024fair educate about FAIR research software, including rich metadata, code management, archiving, documentation, and licensing. And it has been argued that some good practices around data managment, software organization, collaboration, project organization, change tracking, and manuscripts may be good enough [@Wilson2017].
Together, good practices in modelling, software development, and research form a triangle with GMSP at its center ([Figure 1](#fig:triangle)).

<div id="fig:triangle">

![The triangle formed by good practices in modelling, software and research \label{fig:triangle}](Figure_1.pdf)

</div>

Despite these published best practice guidelines, however, much of the model source code corpus, roughly 80% [@Barton2022] is not published at all along with the scientific publication, and for a trivial reason:
@Barnes2010's survey stated that "the code is a little raw" was named as the main reason for not publishing the model.
Here we aim to address this fear and help build confidence that the model code is good enough in line with @Wilson2016 and @Barnes2010;
beyond those, we break principles down to concrete recipes on how to implement those good practices during the modelling software creation process.
We start off by motivating each of the good practices and contextualizing them towards the goal of publishing a model software or a scientific result arising from model software.
We describe the tools that can be used in a non-exhaustive way covering the entire range of good practices.
You may deviate from the tools we selected, or disagree with them, and you may add others or leave some out that we suggested.

# Good practices for whom?

All models start with a purpose [@Edmonds2019]; and the purpose must be stated. That has since long been the number one Good Modeling Practise advice put forward. It doesn't hurt to know about your domain, either, and most often a scientific software is developed by a domain expert [@Wilson2016]. Speak to other experts, develop a conceptual model, only then start formalizing your model in math and in software [@Wang2023;@Romanowska2015;@Grimm2006] to arrive at your computational model -- a purpose-driven and simplified representation of your system in software. This model is by and for yourself, it is for readers and reviewers, and it is by and for your collaborators, constituting three tiers of user groups that are targeted by tools addressing Good Modeling Software Practice.

## Single authors -- yourself

Socio-environmental modelling software can be created by a _single person_; in fact, it often is in student or postdoc projects or individual programming sprints [@Hettrick2022]. Unfortunately from a software development perspective, the necessity of having to be a domain expert at the same time means that 90% of scientists are self-taught developers without formal training in software engineering [@Wilson2016].
That one person will have to read her own code and to apply it for simulations, she will have to align the software development with her research, will have to understand what she did in the past, she will have to retrace the steps that led her to the current state. All of this necessitates to some degree that the work is stored redundantly in backups, and that changes are documented. She would like to ensure that code changes do not break previous work, and does that by testing the model after every update [@Rosero2016].

Authors of scientific models eventually become authors or co-authors of scientific publications arising from or with the help of a model. As scientific authors, they are bound by ethical considerations such as the Guidelines for Safeguarding Good Scientific Practice, among them the unambiguous declaration of own and third-party intellectual property to the work and ensuring availability of the model for a prolonged period of time [@DFG2022;@Allea2023]. The declaration of intellectual property carries with it the proper acknowledgement of software the model is built on, and respecting the copyrights and permissions pertaining to the sources used. The archiving requirement carries with it the obligation to ensure that technical failures or changes in the circumstances of the model author do not lead to the loss of the model: decentralized backups or public repositories help.

For many scientific model authors, getting stuff done may be more important than documenting it thoroughly, usefulness is more valued than red tape, spontaneous ideas are implemented preferably over those layed down in a management plan; individual agency supersedes organizational processes. In this way, scientific model software development reflects the ideas formulated in agile development: "Individuals and interactions over processes and tools. Working software over comprehensive documentation. Customer collaboration over contract negotiation. Responding to change over following a plan" [@Beck2001]. And while the items on the left are valued more, the items on the right are still important.<!-- this could go to discussion -->

There are many tools available to structure and ameliorate the work for the less preferred actions. Some that help with clarifying legal constraints and documentation, and others that help with structuring the development process, among them source code management services.

## Reviewers and readers

If the model is to be used to produce scientific results subject to _peer review_, the single person will have to ensure reproducibility of results. She will have to subject it to an editor or a reviewer, thus make it readable and understandable, and document it. And sometimes, she might be asked to support the reviewers in executing the model somewhere outside her own computer infrastructure. When feedback comes, there should be a platform to file the individual concerns and address them.

To be published in a scientific journal, reviewers need to be able to access and understand the model. Various documentation principles can help to ensure this accessibility, including automatically generated application programming interface (API) references, in-code documentation and the generation of metadata through packaging. Advice on how to write the code is old and simple: "Write code that minimizes the time it would take someone else to understand it---even if that someone else is you." [@Flesch1950].

But even before a reviewer invests her time in evaluating a model software, much can be done in advance by the author herself. In fact, where a reviewer might concentrate on model validation, the author could ensure model verification [@Sargent1994]. Verification answers the questions: Does the code do what the author intends it to do? To ensure this, it has become good software practice to employ unit testing and try to reach a good coverage of the test framework over your entire code base [@Ellims2006], and to integrate automated verification with the source code management service as Continuous Integration [CI,@Shahin2017].

How does an author deal with the feedback she receives during a friendly or journal-led review? Often, this comes as an itemized list of points to address; as such it is in an ideal form to be converted to _tickets_ or _issues_ in the SCM service, or a dedicated issue tracker system linked to the model software. Improvements to the model code can then be tied to the issue tracker, transparently documenting the resolution of those issues, and helping to formulate the rebuttal to reviewer critique.

## Collaborators

If at least one _other person_ is using the model, the permission issue --- also known as the license -- becomes pertinent. This other user needs a way to communicate with the developer, for feature requests or for reporting bugs. If that person intents to improve on your work, the permissions become more important, needing contributor agreements and codes of conduct. How are decisions made about the now joint modelling software -- some form of governance model needs to be established. With the growth of a community, even a community management system might be required, with granular access, distributed roles, and fine-grained permissions.

Regardless of the size of the collaboration, structured reviews, pre-commit hooks, and common coding standards can be used to maintain high code quality.
Software needs to be sustainable as you aim for establishing a larger user base, use it in other scientific software, but most importantly, use the model to support scientific conclusions:
Good Scientific Practice demands that primary data are available for a minimum of 10 years after when a scientific publications relies on them, and so should models [@DFG2022].

Regarding sustainability, the "truck factor" ask: "How many people can get hit by a truck (or bus), before the project becomes unmaintainable?"; the OpenSSF gold standard requires that is truck factor is $>= 3$ [@OpenSSF2024]. But not only in the author's personal circumstances lies a sustainability problem but also in technological and organizational ones: when externally funded projects expire, when hardware and software environments change, or where mobility requirements demand for relocations of staff and frequent change of jobs. Mobility is a good argument in such circumstances for releasing your model as Free and Open Source Software (FOSS) so that the developer herself (you) can take it along.

While most reviewers may only need passive (read) access to the software, it is often desirable to collaboratively develop the software, i.e. involve another person or persons in improving the software. With this collaboration come legal and governance decisions, as well as technical requirements. The legal once concerns copyrights of the different contributors, and often of the employers (research organizations): Many academic institutions do not have yet clear guidelines on the legal aspects of how to contribute to collaborative software or how to accept contributions by other institutions. These can be established in contributor agreements.

For collaborative development with a smaller group, a governance system known as the benevolent dictator is frequently encountered. A benevolent dictator in software development refers to a leadership style where one individual, often the project's creator or lead developer, has significant control over decision-making processes within the project. Despite holding considerable authority, this individual typically exercises their power with the best interests of the project and its community in mind, hence the term "benevolent." This leadership model aims to maintain direction and cohesion within the project while still allowing for contributions and feedback from other team members or contributors [@Schneider2022]. In scientific projects, the governance and licensing terms for a collaboration can be formulated as part of a Memorandum of Understanding or consortium contract.

# Tools for Good Modelling Software Practice

The tools described here can roughly be categorized as version control, source code management system, licensing, documentation, packaging, good code, archiving and maintenance, and publication.

## Version control software

A transparent and reproducible distributed source code management (SCM, a modern term for version control system, VCS) is the basis for good software and has been termed "possibly the biggest advance in software development technology" [@Spolsky2010]. The dominant SCM software is Git[^git], originally invented by Linus Torvalds, the creator of Linux. As source code is text, the SCM tracks changes in lines or parts of lines of text. It can be very well used to manage other kinds of changing texts, such as the text of this manuscript. In fact, this manuscript was started with `git` `init;` `git` `add manuscript.md;` `git` `commit` `-m` `"feat: Created manuscript"`, and has been evolving with repeated recording of small changes à la `git` `add` `-u;` `git` `commit` `-m` `"feat: Added section"`, with descriptive texts in quotation marks, the so-called commit messages; these may follow simple conventional commit[^conventionalcommits] recommendations such that they are both human- as well as machine readable.

[^conventionalcommits] https://www.conventionalcommits.org How to add human and machine readable commit meaning. Note: all Uniform Resource Locators (URL) in this manuscript have been last visited and checked on August 15, 2024
[^git]: https://git-scm.com open source distributed VCS

With graphical interfaces to Git, such as Sourcetree[^sourcetree], or various integrations in text editors, such as Visual Studio Code[^vscode], it is now easy to visually follow the step-wise development of code (or text documents), go back to points in time or critical development stages, to open experimental deviations from main development (`git` `branch`) and combine diverging developments (`git` `merge`). Did you mess up? Simply retrace your step back `git` `revert`; it helps you even to find in the recorded history those developments where things might have unnoticingly gone wrong with `git` `bisect`.

[^sourcetree]: https://www.sourcetreeapp.com free Git client
[^vscode]: https://code.visualstudio.com editor with built-in Git

Git and others are most powerful as distributed VCS, in combination with other locations on your own computer, an intranet or the internet, for saving your work in different places, the _repositories_, while keeping all those versions synchronized. The interaction of two repositories is managed by the unidirectional synchronizations `git` `pull` and `git` `push`. These commands can be used to synchronize the managed code also across different SCM services, effectively allowing redundant and distributed backups minimizing the risk of losing the software from technical or human errors or the risk of vendor lock-in [@Nyman2013].

> You **_must_** have version control and you **_must_** have distributed redundancy.

## Source code management service

<!-- With subsections Ticketing, CI/CD, PR -->

The most prominent online SCM service is GitHub[^github], but many academic institutions also offer on-premise or cross-institutional dedicated SCM services, such as the community GitLab of the German Helmholtz Association[^gitlab] for their students and researchers.
A good reason to choose GitHub is the higher amount of potential contributors on this platform; on-premise GitLabs may be preferred by academic institution, because the code is then hosted in the research center or by a dedicated subcontracted partner and may offer better data protection, or because of dedicated CI resources.
This online platform serves as the entrypoint for collaborators to contribute, provides a ticketing system and release management, and offers functionalities for continuous integration and continuous deployment of the software.

[^github]: https://github.com Public GitHub
[^gitlab]: https://codebase.helmholtz.cloud.de Community Gitlab of the German Helmholtz Association

### Ticketing system

Often things don't work right away, or an error is detected in the software. For this, SCM services offer ticketing (also called bug tracker or issue tracking) systems, where one records the occurrence of an error, a _bug report_, or a wish for future development, a _feature request_. This works well for a single person, but even better when collaborators and reviewers of the software record their observations on faulty or missing issues with the software on this ticketing system.
Beyond the ticketing system, the SCM service may also offer communication facilities like discussion forums, wikis, mailing list or service desks, which often provide cross-referencing functionality to Git commits and issues.

### Continuous integration and deployment

<!-- Hint to "Fail fast" philosophy?" -->

CI is a development practice where developers integrate code into a shared repository frequently, ideally several times a day, but at least on every `git` `push` to a repository. Each integration is then verified by an automated build and automated tests to detect errors as quickly as possible; the frequent and automated check reduce the risk of accumulating errors.
SCM services like GitLab or GitHub provide such automated integrations, called "Actions" on GitHub, but there are many CI tools available outside the comprehensive SCM services, such as Circle CI[^circleci].
CD is often triggered after the CI ends with success. In this automation, the products of a modelling software can be provisioned, such as a complete binary package for download, an updated and nicely formatted documentation, or a suite of simulation results and their statistical evalution, for example. CD often interacts with other external services to update web pages, to upload to package repositories, or to submit to an archiving service.

[^circleci]: Circle CI https://circleci.com

### Pull requests

Pull requests (PR) offer an SCM service managed way to accept other people's changes to your software into your development. Collaborators typically duplicate your software in a _fork_, apply changes locally and then file a PR providing a detailed explanation of the modifications and their purpose. The SCM service allows you to review the changes, possibly ask for further explanations or modifications, to have it automatically tested with CI, and finally to `git` `merge` the collaborator's work. Similarly, a branch-based approach to PRs uses separate feature `git` `branch` branches and often allows to create a Changelog based on the merging of the feature branch into main.

> You **_must_** use a collaboration platform, you **_should_** use CI.

## Licensing

<!-- With subsections choosing, contribution and collaboration -->

Model software development is a creative process. It thus constitutes intellectual property and the right to determine how the model software can be used, re-used and shared and modified, i.e. the copyrights.
The exact terms are laid down in what is called a license. Without a license there is no permission, so every model software needs a license, and with it the name of the person or organization holding the copyrights. While some model software may be published under proprietary licenses and without disclosing the source code, the majority of current modellings software is distributed as open source software, as defined by @OSI2024, and under a permissive or copyleft open source license, among them the widely used BSD, MIT, Apache and GPL licenses.

There are strategic decisions involved in choosing for copyleft versus permissive licenses, also related to the community in your field and dependent on third-party software used in your modelling software paper. There are tools to support choosing a license[^choosealicense], to manage licenses towards better reuse[^reuse], and to assess the compatiblility of different licenses with a project[^fossology]^,^[^ort].

[^choosealicense]: https://choosealicense.com
[^reuse]: https://reuse.software
[^fossology]: https://www.fossology.org
[^ort]: https://github.com/oss-review-toolkit/ort

### Contributions

With collaboration also comes the obligation to sort out the copyrights evolving from different contributors, who are all creators and thus natural copyright holders (or their organization). Your contributors may choose to assign their copyrights to you in what is usually called a copyright transfer agreement (CTA), and is well known from the publication process for scientific papers before the Open Access (OA) movement. Alternatively, your contributors may permit you to exercise copyrights arising from their contribution in a separate agreement, a Contributor License Agreement (CLA) or a Fiduciary License Agreement. Project Harmony[^harmony] or the Contributor Agreements[^contributoragreements] support the drafting of such agreements.

[^harmony]: https://www.harmonyagreements.org Project Harmony
[^contributoragreements]: https://contributoragreements.org Contributor Agreements

### Collaboration

Collaborative software engineering is an intensely people-oriented activity [@Singer2008]; to keep both the software as well as the collaboration healthy, many projects adhere to the Contributor Covenant[^covenant]. This provides guidelines for respectful and constructive behavior, it prohibits harassment and discrimination, and overall help maintain a positive and welcoming environment.

[^covenant]: https://www.contributor-covenant.org Contributor Covenant

Traditionally in science, mostly the authors of scientific publications are acknowledged and cited. But for scientific software, there are more roles that do not qualify for authorship: foremost those of the research software engineers, but also, e.g., data managers, administrators, friendly reviewers, HPC support staff. The All Contributors[^allcontributors] bot integrates with the GitHub SCM service and facilitates proper acknowledgement of those and other non-author groups.

[^allcontributors]: https://allcontributors.org/#

> You **_must_** have a license for yourself and contributions and you **_should_** have guidelines for collaboration.

## Versioning and Releasing

<!-- With no subsections -->

In contrast to standard journal publications, software is always a work-in-progress (WIP). Even if there are no new features implemented, software needs to receive regular updates because of the rapid technological development -- both in hardware as well as software. Without updates to the software, scientific analysis may become irreproducible because the software cannot be used, known as "code rot" [@Liew2017]; but also heterogeneous and scattered incremental updates of the the software may lead to "code decay", where the global code quality declines despite local improvements [@Eick2001].

This need for continuous maintenance requires tracking the state of software and to record changes to software beyond the capabilities offered by `git` `log`. The state can be recorded ideally by a _software bill of material_ [SBOM, @Stewart2022]. In an SCM, each state can be marked with an identifier `git` `tag` that carries a human readable short description as well as version information following a consistent strategy, such as _semantic versioning_[^semver] or _calendar versioning_[^datever].
SCM services in addition allow the creation of _releases_. They are an elaborated version of tags, and can include further resources, such as additional documentation or pre-compiled binaries. They also integrate with archiving services such as Zenodo (see below) upon a new release.

[^semver]: Semantic versioning https://semver.org
[^datever]: Calendar versioning https://calver.org
[^changelog]: Keep a ChangeLog https://keepachangelog.com

While changes to the source code are tracked in the SCM, the reasoning behind those and the user-focused communication of these changes should be kept in a change log[^changelog], a technology since long enforced by the GNU coding standard [@Chen2004].

> You **_should_** have versioning.

## Bundling your application

Much of research software, and especially climate models with a long history, are distributed by giving access to the repository hosted on an online SCM service, or to an archive file that contains the entire source code. Users are then expected to install the (often numerous) requirements, and eventually compile the code and run the model. To improve usability, more state-of-the art software engineering techniques like packaging and containerization are available. Not only do they standardize and simplify the installation of the code, they also improve its findability via machine- and human-readable metadata, support reusability via versioning and ensure proper citability. We refer to this as bundling your application. This bundling can be nicely integrated in the CD by deploying the bundle in the associated registries of the online SCM services[^github-packages]^,^[^gitlab-packages].
We distinguish two types of bundle, one is the distribution as a _package_, the other one is the distribution as a _container image_.

### Packages

Packages are commonly used in programming languages to standardize and simplify the installation of software, and to make the software findable via machine- and human-readable metadata. Technically speaking, packages are files that contain other files, most importantly a _manifest_ that tells the package name and version. We distinguish language-specific package managers, such as they exist for Python, Julia, R, NPM or Fortran, from language-inpendent package managers, such as Debians `dpkg` or Continuums `conda`; the latter, however, often depend on the operating system or computer architecture.
Packages allow a detailed declaration of dependencies and as such greatly improve the reusability and portability of the code. Tools like versioneer[^versioneer] further provide the possibility to combine the package version with Git tags.

For the purpose of making software FAIR, any pre- or post-processing routine, model or even small analysis scripts can be distibuted in form of a package (arguably, some models can really be hard or impossible to package). The building and deployment of packages is usuallyintegrated in the CI and CI workflow, and regularly is scheduled with a release.
Packages can be distributed via package registries to increase visibility and availability of the software [@Allen2019]. The metadata contained in the package is consumed by the registries and made available as a catalog, such as the Python Package Index[^pypi].

[^pypi]: Prominent python package registry https://pypi.org
[^versioneer]: https://github.com/python-versioneer/python-versioneer

### Container images

Apart from packages, installation can further be simplified by distributing the software as a container image. Like packages, containers are distributed as a single file. They do not, however, contain a manifest, but instead they contain an entire operating system layer where the necessary software and its dependencies have been installed already. These images can then be published in container registries to make them reusable. A prominent tool to build containers is docker[^docker], a prominent registry the Docker Hub[^dockerhub], or the built-in container registries of the online SCM services GitHub and GitLab[^github-packages]^,^[^gitlab-packages]. Distributing a model as a container improves reusability as everything is compiled and installed already and makes the usage of the model independent of the available infrastructure.

[^docker]: https://www.docker.com/ tool to build containers
[^dockerhub]: https://hub.docker.com/ free to use container image registry
[^github-packages]: https://docs.github.com/en/packages
[^gitlab-packages]: https://docs.gitlab.com/ee/user/packages/

> You **_may_** provide packages or containers.

## Documentation

<!-- With subsection ReadMe, contributing guide , automated documentaiton, badges -->

Proper documentation often determines a model software's impact and usability. Most developers use inline comments for code, and they are indeed important, but their impact on helping other scientists in contributing or using the software is limited. Above all, proper ReadMe text files (often in Markdown format as `ReadMe.md`) are important, even if the author is its sole user. The ReadMe is the first entry point for the user to the software to understand what he or she is looking at, as SCM services are rendering an HTML representation.
A ReadMe can provide an overview of the software, its purpose, and its scope. A well-crafted ReadMe can enhance user experience by providing clear, concise, and relevant information about the software. It can also include a brief description of the software's architecture and its main components, as well as installation instructions. Furthermore it should contain a section about how you want your software to be cited, or where to find the citation instructions [@Allen2019].

A contributing guide fosters a collaborative environment and encourages contributions from other researchers. It often appears as a `Contributing.md` file or as part of the ReadMe; and provides guidelines on how to contribute to the software, the coding standards to follow, and the process for submitting changes. This ensures that the software continues to evolve and improve, benefitting the entire research community.

For post-processing routines, that shall be used by other researchers as well, automated documentation tools like Sphinx[^sphinx] or MkDocs[^mkdocs] help creating a well-documented and user-friendly software. They automate the process of building documentation.

<!--, and are invaluable in any long-living software project. --> By including  inline code comments, they support an up-to-date API documentation; additionally, they support *doctests*, which ensures that the examples in the documentation work as expected, enhancing the reliability of the documentation.

[^sphinx]: https://www.sphinx-doc.org
[^mkdocs]: https://www.mkdocs.org

Important sections in any documentation are

1. **Installation Instructions**: Detailed and clear installation instructions eliminate guesswork, making the software accessible to a broader audience. These instructions should cover various operating systems and potential issues that might arise during the installation process. They should also specify the prerequisites, such as required libraries or dependencies.

2. **User Manual**: User manuals (or in it's minimal form a _getting started guide_) are essential for enabling other modelers to rerun and use your code. They provide step-by-step guidance on how to use the software, explaining the functionality of different modules, and providing examples of how to use them. This allows users to understand the software's capabilities and apply it effectively to their research.

3. **API Documentation**: API documentation provides a detailed description of how the software's functions work, the parameters they take, and the output they return. This is crucial for users who want to integrate the software into their own code or use it for more complex tasks. Good API documentation enhances the software's usability and encourages its adoption.

4. **Developer Manual**: If you aim for contributions by other researchers, the developer manual is a must-have for the onboarding. It contains more detailed information about the framework that you are developing, that do not have place in the _contributing guide_ or _user manual_.

### Self-checks and badges

Part of the documentation may also be devoted to promotion, self-checking, and community building. For these, software badges have become widespread. They are little visual indicators put atop your ReadMe that inform readers and yourself at first glance about diverse aspects of your model and modeling process [@Lee2018]. Things to show are the activity of your development, the status of passing the CI, the percentage of code covered by tests; information about portability and software security, the status of self-assessments, or the publication status and doi, amongst many others. If needed, you can create badges yourself with the Shields.io service[^shields], and motivating yourself to keep to good practices may be the most important factor in badge awarding.
Particularly devoted to an entire array of Good Practices is the Open Source Security Foundation's OpenSSF badge program[^bestpractices]. It consists of many self-assessment questions, and at the end reports the practices in your project at a basic, silver, or gold level. Of course, you can show off this badge in your project's ReadMe!

[^shields]: https:/shields.io
[^bestpractices]: https://www.bestpractices.dev

> You **_must_** have documentation, you **_should_** elaborate documentation.

## Clean and correct code

@Flesch1950 once stated that "Code should be written to minimize the time it would take for someone else to understand it". This principle underscores the importance of code readability and maintainability, which can be significantly enhanced through automated code formatting and linting.
Adherence to community conventions is a key aspect of this process. For instance, the PEP8 conventions for Python ensure consistency across different parts of the codebase. This makes the code easier to read and understand, thereby reducing the time it takes for someone else to comprehend it.

### Code formatting and linting

Following such conventions can be facilitated by using automated formatters. They play a crucial role in maintaining these conventions. Tools like Black[^black] or isort[^isrot] adjust (python) code to meet specific formatting guidelines, eliminating the need for manual formatting and ensuring consistency across the codebase.
Language-specific linters, such as ESLint[^eslint], flake8 or linter-formatters such as Ruff[^ruff], go a step further by running also checks against coding quality rules[^flake]. They all provide feedback that can help developers improve their code quality and adhere to best practices. A general-purpose tool for many file formats and languages is Prettier[^prettier].

Linters and formatters can be combined in pre-commit hooks[^precommit]. Pre-commit hooks facilitate the formatting and linting process by automatically running a list of tools before each commit. This ensures that all committed code adheres to the defined standards, further enhancing code quality and readability.

[^eslint]: https://eslint.org Javascript linter
[^flake]: https://www.flake8rules.com List of Python coding standards for automated verification
[^black]: https://black.readthedocs.io Python formatter
[^isort]: https://pycqa.github.io/isort/ Python import sorter
[^ruff]: https://docs.astral.sh/ruff Python linter and formatter
[^prettier]: https://prettier.io General purpose code prettifier
[^precommit]: https://pre-commit.com Triggers checks before `git` `commit`

### Code Structure

Good code is probably the oldest of all good practices, going back to the single-purpose unix tools [@Kernighan1999]. This philosophy has found its way into larger programs, which are broken down into manageable and readable building blocks, often functions or modules, that have a clear and documented way to interact with the rest of the code, the Application Programming Interface (API). Better yet, encapsulate functionalities and allow interaction only via dedicated accessors.

Separate concerns, don't mix functionality with visual appearance, avoid mixing input and output with processing. Try to implement error handling and try to break your own code. Often, there is no need to code a functionality yourself, better re-use someone else's working solution from an existing library or piece of code, "be ruthless about eliminating duplication" [@Wilson2017]. Together with human-readable and consistent naming practise, which may follow community conventions, following this advice should provide simplicity, generality, clarity, the "bedrock[s] of good software" [@Kernighan1999].

### Code verification

As code gets more complex, it is important to be able to ensure that the smaller units of the code function as expected. For this, the concept of _unit tests_ has been developed, where in principle every code unit has a mirrored part either within the code or separate from it in a testing framework. So every time you write a new function, think about (and implement) how its functionality can be tested. How much of a code is covered with test is called the _coverage_, and the coverage can help you identify parts of the code that are not well tested.
But even if all units of a code are correct, their interaction may not be, and a model might be dyfunctional or produce unreasonable results. To catch these, regression and reproducibility tests (RT) are regularly run [@Rosero2016].

> You **_must_** provide readable code and you **_should_** use automated tools for formatting, linting, and verification.

## Archiving

Archiving the source code for model and post-processing routines is essential
to follow Good Scientific Practices. As modellers change their working
conditions frequently, it is crucial that this archive is publicly available,
and stable for at least ten years [@DFG2022].

The most simple solution for open-source projects is using the Software
Heritage Project[^software-heritage]. Many SCM services are already
crawled by this project, so when you upload your repository and make it
publicly available, it will be archived automatically. If your SCM service is not
crawled by the Software Heritage Project, you can add it manually.

A more citeable archiving solution is guaranteed by uploading
the source code and generating a Digital Object Identifier (DOI). There are
various institutional platforms that offer this service, the most prominent
one is likely Zenodo[^zenodo].
Most of these platforms additionally offer to create versioned DOIs, meaning
that each upload gets its own DOI, and there is one single DOI that represents all versions of the model software.
Used in combination with releases, each release gets its own DOI and the contributions to the release are citeable separately.
Various helpers exist to automate this upload, such as Zenodo's
GitHub integration[^zenodo-integration], or the hermes workflow[^hermes] [@Druskat2022].

[^software-heritage]: https://www.softwareheritage.org/
[^zenodo]: https://zenodo.org
[^zenodo-integration]: https://docs.github.com/en/repositories/archiving-a-github-repository/referencing-and-citing-content
[^hermes]: https://github.com/hermes-hmc/hermes

Less integrated with SCM services are community portals. On CoMSES.net, e.g.,
the code can be archived along with a documentation and metadata. It is optionally reviewed and
assigned a DOI for citeability [@Janssen2008].

> You **_must_** archive and you **_should_** do this on a community platform.

## Publish your model

Many scientifc journals nowadays request to publish the source code that has been used
to generate figures alongside the journal publication. While this is
useful from a reusability perspective, it does not acknowledge the amount of
work that has been put into the software or its documentation [@Hettrick2024]; nor does it take
into account that the software might be developed further after the paper has
been published.

Consequently, software may be published separate from the scientific
publication in a dedicated software journal, often allowing to track the development across multiple versions.
Such software journals, e.g. the Journal of
Open Source Software [JOSS, @Smith2018] are meant to be developer-friendly, i.e. they integrate with
the development workflow and tools used to follow Good Software Practices.

<!-- add JORS -->

Such software journal publications are not domain-specific, so they do not
generally improve the findability of your software. Therefore the most
important aspect on publish your code (or its metadata) is to list it in a
platform that your colleagues know, such as the communities on Zenodo[^zenodo-communities].
An alternative might be the Research Software Directory[^rsd] [@Spaaks2020]
that also allows to group software into projects and interests.

[^zenodo-communities]: https://zenodo.org/communities/
[^rsd]: https://research-software-directory.org/, https://helmholtz.software

> You **_must_** publish your model software.

## Software development templates

Despite the many benefits of good research software engineering techniques, the multitude and the complexity of some of the techniques and tools put a burden on the modeller.
Not only does it require acquiring new knowledge, the rapid technological development makes it also difficult to stay up-to-date. The diverse skill sets of researchers and time constraints further complicates the situation [@Wilson2016].

<!--Consequently, software often becomes obsolete, challenging to maintain, and prone to errors. -->

New modelling software projects can be derived from templates that already provision these techniques from the start of a project [@Pirogov2024]. Cruft[^cruft] and cookietemple[^cookietemple] keep things up to date behind the scene. @Sommer2024, e.g., provide a fork- and cruft-based methodology for modelling ecosystems: they provide a standardized setup for post-processing routines, plugins, etc., implementing many of the techniques and tools mentionend in this manuscript.

[^cruft]: https://cruft.github.io/cruft
[^cookietemple]: https://github.com/cookiejar/cookietemple

> You **_can_** use templates.

# Good enough modelling software practice - a use case

Viable North Sea (ViNoS) is a socio-ecological model of the German North Sea coastal fisheries [@Lemmen2023;@Lemmen2024] coded in NetLogo [@Wilensky1999] and embedded in a larger software system containing data, and Python/R data pre- and postprocessing scripts. Its source code is managed by Git, with a primary SCM service on an academic Gitlab[^vinos-gitlab] and a secondary one on public Github. On the primary SCM, GitLab issues provide the ticketing system, a CI produces docker images of the software and its dependencies for different versions of the underlying operating system and the NetLogo IDE and then performs unit and replicability testing. As part of the CD, a small production simulation generates model results and pushes them to a static web page on the SCM service; the documents provided with the model (ODD, JOSS, this manuscript, and others) are compiled from their version-controlled sources to pdfs and uploaded. The CD is integrated with Mkdocs and pushes to a public readthedocs instance for the user guide. On the secondary CI, a release management hooks into Zenodo to provide permanent and DOI citable archives for each model release.
Locally, a pre-commit workflow, triggered upon each `git` `commit` ensures that the copyrights and license catalogs are complete for each file, that all structured documents comply with their respective type definition, and that python codes conform to PEP8 coding standards. The tools used for this are `reuse`, `black`, `flake8`, more general formatters to remove empty line endings, syntax checkers for metadata in `yaml`, `toml`, and `json` structured formats, and the general-purpose code beautifier `prettier`.

In the program root folder, a `CITATION.cff` suggests how to cite the software, a `codemeta.json` provides package metainformation, a `ChangeLog.md` the user-oriented change information. Every directory contains at least a `ReadMe.md`. The model has been archived on Zenodo, and on CoMSES.net together with its ODD [@Lemmen2023]. A software paper has been published in JOSS [@Lemmen2024].

<!-- Add research directory, add harmony, add transparent review process, add conda -->

[^vinos-gitlab]: https://codebase.helmholtz.cloud/mussel/netlogo-northsea-species

# Conclusion

Good Practices have been maturing in the areas of software, modelling, and research. Adopting all of them for socio-environmental modelling establishes Good Modelling Software Practices: Reproducibility and citability meet automated verification, rights management and collaboration meet purpose-driven simplification and validation.

For this, you **must**

- have version control and distributed redundancy,
- use a collaboration platform
- have a license and documentation
- provide readable code
- archive and publish your model software

You **should**

- use CI
- have guidelines for collaboration.
- elaborate documentation.
- use automated tools for formatting, linting, and verification.
- should target a community platform.

Good Modelling Software Practice also means that you don't have to do it all at once. The supporting tools are numerous, and most follow a philosophy to do one thing only and to do it well: they can be learned and employed one by one. Publish your modelling software -- it's good enough [@Allen2019;@Barnes2010]! By learning and applying one tool at a time, everyone can acquire a corpus of practices that eventually lead to better modelling software---and better research [@Katz2019].

The recent surge in Artificial Intelligence (AI) applications, has created an array of emerging good practices in the areas of security [@Polemi2023], data treatment [@Makarov2021], and in supporting software development [@Pudari2023], amongst others. They will need to be negotiated by society but eventually also find their place in supporting Good Modelling Software Practices.

# References {.unnumbered}
