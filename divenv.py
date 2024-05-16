#!/usr/bin/env python

"""
Pandoc filter for replacing divs with LaTeX environments
Based  from https://github.com/01mf02/pandocfilters
Modified to take care of hedgedoc :::info and :::warning blocks
converted to minipage
SPDX-FileContributor: Carsten Lemmen
SPDX-FileContributor: Michael Färber
SPDX-LicenseIdentifier: GPL-3.0-or-later
SPDX-FileCopyright: Michael Färber
SPDX-FileCopyright: 2024 Helmholtz-Zentrum hereon GmbH
"""

from pandocfilters import toJSONFilter, RawInline, Para


def has_inlines(block):
    return (block["t"] == "Para") | (block["t"] == "Plain")


# Put inline lists `front` and `back` around `blocks`,
# avoiding the creation of new blocks if possible.
def encaps_blocks(front, blocks, back):
    if has_inlines(blocks[0]):
        blocks[0]["c"][:0] = front
    else:
        blocks.insert(0, Para(front))

    if has_inlines(blocks[-1]):
        blocks[-1]["c"].extend(back)
    else:
        blocks.append(Para(back))


def latex(x):
    return RawInline("latex", x)


def divenv(key, value, format, meta):
    if key == "Div":
        [[id, classes, properties], content] = value

        for env in classes:
            label = [] if id == "" else [latex(r"\label{" + id + "}")]

            if env in ("warning", "info"):
                env = "minipage"
                front = (
                    [latex("\\begin{figure}[h])")]
                    + [latex("\n")]
                    + [latex("\\centering\\colorbox{yellow}{%")]
                    + [latex("\n")]
                    + [latex("\\begin{" + env + "}{\\columnwidth}")]
                    + label
                    + [latex("\n")]
                )
                back = [latex("\n\\end{" + env + "}}\\end{figure}")]
                encaps_blocks(front, content, back)
                return content


if __name__ == "__main__":
    toJSONFilter(divenv)
