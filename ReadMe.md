<!--
SPDX-FileCopyrightText:  2024 Helmholtz-Zentrum hereon GmbH
SPDX-FileContributor: Carsten Lemmen <carsten.lemmenhereon.de>
SPDX-License-Identifier: CC-BY-NC-4.0
-->

<!-- Badges -->

[![Project Status: Concept – Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](./code_of_conduct.md)
[![REUSE status](https://api.reuse.software/badge/github.com/fsfe/reuse-tool)](https://api.reuse.software/info/codebase.helmholtz.cloud/mussel/paper-modelingpractise)
[![Prettier style](https://img.shields.io/badge/code_style-prettier-ff69b4.svg?style=flat-square)](https://github.com/prettier/prettier)

In this folder, the Good Modeling Practise joint special issue paper is compiled.


# Good modeling software practises

In Socio-Environmental Systems sciences, models are frequently used as tools to represent, understand, project and predict the behaviour of these complex systems.  Along the modeling chain, Good Modeling Practices (GMP) have been evolving that ensure -- amongst others -- that models are transparent and replicable.   Whenever such models are represented in software, GMP meet good software practises, such as a tractable software development workflow, good code, collaborative development and governance, attribution of copyrights and acknowledgement of intellectual property, continuous integration and deployment, and archiving. Too often in existing SES model software, these practices have been regarded as an add-on to be considered at a later stage only; in fact, many modelers have shied away from publishing their model as open source out of fear that having to add good software practise is too demanding.  We here argue for making a habit of following a list of simple practices early on in the implementation modeling chain.  We contextualize cherry-picked and hands-on practices for the support the goals of GMP, and we demonstrate their application in the example context of the Viable North Sea fisheries SES model."
acknowledgements: "This research is funded by the program Changing Coasts of the Helmholtz-Gemeinschaft der Forschungszentren and an outcome of the Multiple Stressors on North Sea Life (MuSSeL) project funded by BMBF."
conflictsofinterests: "The authors declare that no conflict of interest has arisen from this work.

## Joint Special Issue on Good Modelling Practice - Ecological Modelling

Collaborating Journals: Socio-Environmental Systems Modelling (SESMO), Environmental Modelling and Software (EMS), and Ecological Modelling (ECOMOD)

Modelling, computational, conceptual or otherwise, has become an indispensable tool for dealing with complex socio-environmental systems (SES), whether the purpose be system understanding, prediction or social learning. It is crucial therefore that any modelling undertaken be adequate in its practices for the purposes. But despite early advances this century, guidance and protocols for good modelling practice (GMP) in different settings have been lacking.

This joint special issue intends to provide a platform for visible and ongoing attention to what ought to be the current standard(s) for an appropriate modelling protocol that considers uncertainty in all its facets and promotes transparency in the quest for robust and reliable results. It aims to bring together and highlight work that develops, applies, or evaluates procedures for a trustworthy modelling workflow or that investigates good modelling practices for particular aspects of the workflow. We invite research that aims to improve the scientific basis of the entire modelling chain and places good modelling practice in focus. Particular aspects of GMP might include (but are not limited to) contributions on:

- Developing modelling conceptual maps, protocols and workflows
- Benchmarking model results
- Developing robust parameterization, calibration and evaluation frameworks
- Going beyond common metrics in assessing model performance and realism, including qualitative methods
- Conducting controlled model comparison studies
- Investigating subjectivity and reflexivity along the modelling chain, and addressing model fitness for purpose
- Identifying and prioritising sources of uncertainty and/or investigating uncertainty propagation along the modelling chain, and data acquisition planning for reducing uncertainty
- Communicating model results and their uncertainty to end users of model results
- Evaluating implications of model limitations and identifying priorities for future model development
- Examples of developing FAIR principles for digital assets in the modelling chain (Findable, Accessible, Interoperable and Reusable – see https://www.comses.net/education/responsible-practices/)

Note that interpretation of what is an SES is considered widely. Systems for example may include ecological, hydrological, energy, policy, health and social sectors, often a combination of these or others. An aim is to share experiences of GMP across sectors and disciplines.

### Which journal to publish in?

Authors can submit to one of the three journals but only one must be chosen. It is envisaged that manuscripts will be reviewed and assessed by the relevant journal selected by the author(s) and Guest Editors will be across all manuscript processes.

### Guest editors:

Dr. Hsiao-Hsuan (Rose) Wang, ECOMOD
Organization: Ecological Systems Laboratory, Department of Ecology and Conservation Biology, Texas A&M University. College Station, Texas, USA.Email: Hsiaohsuan.Wang@ag.tamu.edu Area(s) of Expertise: System ecology; Ecological modelling; Environmental management

Dr. Sondoss Elsawah, EMS
Organization: University of New South Wales Canberra, AustraliaEmail: s.elsawah@unsw.edu.au Area(s) of Expertise: Complex systems modelling, participatory modelling, interdisciplinary science

Dr. Tony Jakeman, SESMO
Organization: Australian National University, Canberra, AustraliaEmail: tony.jakeman@anu.edu.au
Area(s) of Expertise: Modelling practice, uncertainty analysis, system identification, hydrology

### Manuscript submission information:

Deadlines for submission

Submission deadline: May 31, 2024.

For any queries in submitting your manuscript to Ecological Modelling, please kindly contact Dr. Hsuan (Rose) Wang <Hsiaohsuan.Wang@ag.tamu.edu>. Please reach out to Dr. Sondoss Elsawah for EMS and Dr. Tony Jakeman for SESMO respectively.

When submitting your manuscript please select the article type “VSI: Good Modelling Practice”. Please submit your manuscript before the submission deadline.

All submissions deemed suitable to be sent for peer review will be reviewed by at least two independent reviewers. Once your manuscript is accepted, it will go into production, and will be simultaneously published in the current regular issue and pulled into the online Special Issue. Articles from this Special Issue will appear in different regular issues of the journal, though they will be clearly marked and branded as Special Issue articles.

Keywords:
Modelling practices; Integrated assessment and modelling; Socio-ecological systems; Decision support; uncertainty; scaling

## Viable North Sea (ViNoS): A NetLogo Agent-based Model of German Small-scale Fisheries

Viable North Sea (ViNoS) is an Agent-based Model (ABM) of the German Small-scale Fisheries. As a Social-Ecological Systems (SES) model it focusses on the adaptive behaviour of fishers facing regulatory, economic, and resource changes. Small-scale fisheries are an important part both of the cultural perception of the German North Sea coast and of its fishing industry. These fisheries are typically family-run operations that use smaller boats and traditional fishing methods to catch a variety of bottom-dwelling species, including plaice, sole, and brown shrimp.

Fishers in the North Sea face area competition with other uses of the sea---long practiced ones like shipping, gas exploration and sand extractions, and currently increasing ones like marine protection and offshore wind farming (OWF). German authorities have just released a new maritime spatial plan implementing the need for 30% of protection areas (of these 30% as no-use zones) demanded by the United Nations High Seas Treaty and aiming at up to 70 GW of offshore wind power generation by 2045. Fisheries in the North Sea also have to adjust to the northward migration of their established resources following the climate heating of the water. And they have to re-evaluate their economic balance by figuring in the foreseeable rise in oil price and the need for re-investing into their aged fleet.
