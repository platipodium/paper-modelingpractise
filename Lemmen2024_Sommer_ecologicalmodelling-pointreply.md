<!--
SPDX-FileCopyrightText:  2024 Helmholtz-Zentrum hereon GmbH
SPDX-License-Identifier: CC-BY-NC-4.0
-->

# Point-by-point reply to reviewer comments

## Reviewer #1

This overview paper introduces "good modelling software practices" that integrate good modeling practices, good software engineering practices, and good scientific practices in contrast with the increasingly common "good software engineering practices for domain X" or "FAIR software practices for domain X" that often bring good software engineering practices that are well-known and commonly used in industry (e.g., big tech companies like FAANG) to create quality software to academia.

1. This could be an important contribution but the authors go into too much unnecessary detail in some parts and not enough details in others, where they introduce complex concepts like pull requests and git commands without much clear guidance.

- A:

2. Q: Take more time to describe what Continuous Integration and Continuous Delivery are with clear examples of how it works in GitHub or GitLab.

- A:

3. Q: Recommend that model authors learn to use git in a disciplined way, leaving clear and cogent provenance trails via good git commit messages that preserve context, history and provenance of your code e.g., https://www.conventionalcommits.org/en/v1.0.0/

- A:

> Q: Provide clear, actionable guidance to help new model authors and existing model authors.

- A:

> Q: Improve the structure of the paper by removing unnecessary sections

- A: We condensed the introductory sections on single/review/collaborations and joined the scattered parts under these themes.

> Q: divide recommendations into must-haves and would-be-nice guidance at a minimum.

A: We initially tried to refrain from a valuation of a tool recommendation. Following this advice however, we now identified and marked must/should/may after each subsection in a summary sentence.

> Offering an API is useless - it might be around for what, 1-5 years and then get hacked and taken down or stop being able to be built and disappear?) If you think your code has commercial potential, offer a dual license for commercial and open source use or only offer a commercial license.

General guidance for 99% of academics to whom this article is aimed should be: publish your code. give it an appropriate open source license. Put it into a version control system, for yourself, and others. Then provide clear and actionable guidance on how to write good code, refactor and modularize it as you explore the possibility and conceptual space of your computational model. Write tests, and use continuous integration and continuous delivery to make it easy to see if your tests are still passing without having to manually run them.

For example:

1. Learn to use version control, it is an investment in yourself. Use GitHub or GitLab if your institution offers a private GitLab instance for IP.
2. Choose a license: pick between permissive (MIT), viral (GPLv3), or dual licensed if your research code has potential commercial applications and explain the difference with a caveat of "maybe use whatever your community of scientists is releasing their software under"
3. include other good software engineering practices checklists that have already appeared in the literature which already discuss version control, continuous integration, etc as well as reproducibility checklists like https://aaai.org/aaai-conference/reproducibility-checklist/
4. Make sure it is clear how one can run your computational model with a full description of how to actually use your model. Cover acceptable inputs and expected outputs, assumptions
5. Make sure it is clear what your computational model's purpose is, it's scope, and assumptions (which is covered in the Purpose section but then half-heartedly described in 2.6 Documentation as "can provide an". Clear and cogent narrative documentation is a must for any computational model.

### Miscellaneous comments:

> Q: Software bill of materials seems to be mostly industry vaporware

> Q: discussion of benevolent dictator model of development is probably unnecessary and out of scope

A:

> Q: authors may want also want to include a reference to 'ruff' which does all of what black and flake8 do: https://docs.astral.sh/ruff/

> authors should replace the discussion of "code rot" with the notion of Software Collapse which captures the issues of shifting dependencies more accurately https://doi.org/10.1109/MCSE.2019.2900945

> authors should consider referencing the "Containerization for creating reusable model code" paper at https://doi.org/10.18174/sesmo.18074 for an overview of containerization and how it can be used for building computational models. References to Singularity should be updated to use Apptainer for HPC / HTC environments.

> Consider publishing your code in a domain-relevant scientific software registry or repository for maximal discoverability. For example, https://scicodes.net/participants/

> Section on packaging should be dependent on the programming language where the model was developed. For Python, conda and PyPi should be the primary options if that's a requirement.

> Replace references to OpenABM with the CoMSES Computational Model Library

> self-assessed software badges from shields.io are generally self-created and may not be worth much since they are dependent on the quality and rigor of the badge issuer (and anyone can create a badge asserting anything via shields.io). More useful would be a discussion of badges from CI/CD pipelines that automatically display test coverage, whether the latest build passed, howfairis compliance (https://github.com/fair-software/howfairis) etc.

> Regarding badges, ACM offers an artifact evaluation rubric that may be worth greater community adoption https://sigsim.acm.org/conf/pads/2022/blog/artifact-evaluation/ and NISO reproducibility badging definitions should also be included https://doi.org/10.3789/niso-rp-31-2021

> Fitting in a reference to https://doi.org/10.7554/eLife.49547 may also be useful, though this targets computational modeling in psychology and neuroscience and behavioral models many of the same principles apply.

> The final section that discusses how the authors' computational model meets the rubric is useful and should be given more space to explain how and why they help make the model better.

## Reviewer #2

I commend you on the comprehensiveness of this paper!

1. Q: The introduction bleeds into the content of the paper without any discernible break - this makes it hard for the reader to mentally file away what they are reading.

- A: we streamlined the different section on individual/reviewer/collaboration topics creating a clearer separation. We also restructured the paper into 1. Introduction the new section 2. Tool addresses 3. Tools for GMSP and 4. Example

> The Paper sets out .. to empower the reader to apply Good Modelling Software Practices to their work. It does a very good job in motivating this ... However, you do not provide any sort of overview for the reader to refer back to when taking in so much densely compiled information. Whilst I do not feel this should be a requirement for publication, I do feel that the accessibility and thereby value of the work would be greatly enhanced by providing some type of overview and referring back to it in the text. I have no opinion on which form this should take - examples would be: a graph, a table, a metaphor, a map, etc.

### Little remarks, comments and suggestions:

All suggestions (reproducible, captialisation, truck, bus) have been adopted.

#### Introduction:

- "So all we can do is to provide at best verified and validated models, and Good Modelling Practices (GMP) aim at ensuring this." This sentence bears a lot of weight since it is the transition from 'domain issues' (the sentence before) to 'solutions through practices' (the rest of the paper) - this is purely a matter of style, but 'so all we can do' feels a little defeatist. My suggestion would be to elaborate a little more (a sentence or two) on the relationship between 'domain issues' and 'solutions through practices', and give it a more positive spin while you're there...

- the historic context given is great! (This paper might amuse you: VERIFICATION, VALIDATION AND ACCREDITATION OF SIMULATION MODELS, Osman Balci, 1997)
- I suggest ending the Introduction before point 1.1 !!!!
- spelling: " That has since long bin the number one Good Modelling Practice advice put forward." bin - been
- grammar: " Good Scientific Practice demands that primary data are available for a minimum of 10 years after when a scientific publications relies on them, and so should models " delete the 'when'
- "...can take it along." I am fine with this, but it is very informal
- "While most reviewers may only need passive (read) access to the software..." as far as I know 'passive' access is not a common term, while 'read' is. Perhaps it would be nice to further distinguish between read, execute and write, since 'execute' is something a reviewer probably would want to do

#### Tools for Good Modelling Software Practice:

- grammar: "This need for continuous maintenance requires tracking the state of software and to record changes to software beyond the capabilities offered by git log." perhaps use the gerund for both cases: tracking the state of software and recording changes...
- spelling: "The building and deployment of packages is usuallyintegrated " space missing...
- grammar: " in the CI and CI workflow, and regularly is scheduled with a release." - ..and is regularly scheduled...
- repetition: "Flesch (1950) once stated that "Code should be written to minimize the time it would take for someone else to understand it". " - the repetition (you already use this quote earlier in the text) without acknowledgement feels a bit off - perhaps rather go with something along the lines of 'As already quoted earlier' or something like that...
- spelling: "But even if all units of a code are correct, their interaction may not be, and a model might be dyfunctional or produce unreasonable results." add an s to dyfunctional...
- grammar? "Many SCMs are already crawled by this project, so when you upload your repository and make it publicly available, it will be archived automatically." this sentence feels weird, but I'm afraid I don't know why...
- grammar " put into the software, documentation" perhaps rather and 'and' than a comma?

#### Good enough modelling software practice - a use case

- spelling "title: Ggent-based model coded in NetLogo " .. i guess that should be an 'A'
- I really like the addition of the 'context-example' and like that it comes at the end

#### Conclusion

- replicability? see comment for abstract...
