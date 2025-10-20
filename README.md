# AsciiDocDITA

**AsciiDocDITA** is a style package for [Vale](https://vale.sh/) that allows you to validate your AsciiDoc content and identify markup that does not have a direct equivalent in DITA 1.3.

## Installation

1.  Install the latest available version of Vale as described in [the official documentation](https://vale.sh/docs/install).
2.  Create a `.vale.ini` file in the main directory of your AsciiDoc project:

    ```ini
    StylesPath = .vale/styles
    MinAlertLevel = warning
    Packages = https://github.com/jhradilek/asciidoctor-dita-vale/releases/latest/download/AsciiDocDITA.zip

    [*.adoc]
    BasedOnStyles = AsciiDocDITA
    ```
3.  Download and install the `AsciiDocDITA` package:

    ```console
    vale sync
    ```

## Usage

*   Validate a single AsciiDoc file:

    ```console
    vale source_file.adoc
    ```
*   Validate all AsciiDoc files in the current directory:

    ```console
    vale *.adoc
    ```
*   Generate a report with each message on an individual line:

    ```console
    vale --output line *.adoc
    ```

    To import this report to a spreadsheet, make sure suggestions are disabled and select a colon (`:`) as a separator.

*   Validate all AsciiDoc files in the current directory and all of its subdirectories:

    ```console
    vale .
    ```

    Note that on larger documentation projects, running `vale` like this may be slow or even fail with an error if your project uses symbolic links to other directories. To work around this problem, run `vale` in multiple parallel processes simultaneously, for example: 

    ```console
    find . -type f -name '*.adoc' | xargs -n 1 -P 14 vale --output line
    ```
*   List suggestions that are normally disabled by setting the `MinAlertLevel` option to `warning` in the configuration:

    ```console
    vale --filter '.Level=="suggestion"' .
    ```
*   Read [the official documentation](https://vale.sh/docs/install) to learn how to use Vale in an editor such as VSCode, Neovim, or Emacs, or run it as a GitHub action.

## Available rules

### Errors

The following rules have their severity set to `error`. The AsciiDoc markup reported by these rules causes the conversion tooling to produce invalid DITA output.

| Vale rule | Explanation |
| --- | --- |
| EntityReference | DITA 1.3 supports five character entity references defined in the XML standard: `&amp;`, `&lt;`, `&gt;`, `&apos;`, and `&quot;`. Replace any other character entity references with an appropriate [built-in AsciiDoc attribute](https://docs.asciidoctor.org/asciidoc/latest/attributes/character-replacement-ref/). |
| ExampleBlock | DITA 1.3 allows the `<example>` element to appear only within the main body of the topic. Do not use [example blocks](https://docs.asciidoctor.org/asciidoc/latest/blocks/example-blocks/) in sections, within other blocks, or as part of lists. |
| NestedSection | DITA 1.3 allows the `<section>` element to appear only within the main body of the topic. If [a level 2 section](https://docs.asciidoctor.org/asciidoc/latest/sections/titles-and-levels/) is needed, move it to a separate file. |
| TaskExample | DITA 1.3 allows only one `<example>` element in a task topic. If multiple examples are needed, combine them in a single [example block](https://docs.asciidoctor.org/asciidoc/latest/blocks/example-blocks/). |
| TaskSection | DITA 1.3 does not allow [sections](https://docs.asciidoctor.org/asciidoc/latest/sections/titles-and-levels/) in a task topic. If a section is needed, move it to a separate file. |

### Warnings

The following rules have their severity set to `warning`. The AsciiDoc markup reported by these rules causes the conversion tooling to issue a warning, but does not produce invalid DITA output.

| Vale rule | Explanation |
| --- | --- |
| AdmonitionTitle | In DITA 1.3, the `<note>` element cannot have a title. Do not assign block titles to [admonitions](https://docs.asciidoctor.org/asciidoc/latest/blocks/admonitions/). |
| AuthorLine | AsciiDoc interprets the first line that directly follows the document title as an author line. Add an empty line after the document title. |
| BlockTitle | In DITA 1.3, only the `<example>`, `<fig>`, and `<table>` elements can have a title. Do not assign [block titles](https://docs.asciidoctor.org/asciidoc/latest/blocks/add-title/) to other blocks such as paragraphs or lists. |
| CalloutList | DITA 1.3 does not support [callouts](https://docs.asciidoctor.org/asciidoc/latest/verbatim/callouts/). Rewrite your content to avoid the need for callout numbers and replace the explanation with simple sentences, [an unordered list](https://docs.asciidoctor.org/asciidoc/latest/lists/unordered/), or [a description list](https://docs.asciidoctor.org/asciidoc/latest/lists/description/) as appropriate. |
| ContentType | Without a clear content type definition, the Vale style cannot reliably report problems related to procedure modules such as `TaskSection` or `TaskExample`. Add the correct `:_mod-docs-content-type:` definition at the top of the file. |
| DiscreteHeading | DITA 1.3 does not support discrete headings. Depending on your use case, use [a description list](https://docs.asciidoctor.org/asciidoc/latest/lists/description/), [a level 1 section](https://docs.asciidoctor.org/asciidoc/latest/sections/titles-and-levels/), or move the content to a separate file. |
| EquationFormula | The conversion tooling does not implement [LaTeX and AsciiMath](https://docs.asciidoctor.org/asciidoc/latest/stem/) formulas. |
| LineBreak | DITA 1.3 does not support [hard line breaks](https://docs.asciidoctor.org/asciidoc/latest/blocks/hard-line-breaks/). Split the text in multiple [paragraphs](https://docs.asciidoctor.org/asciidoc/latest/blocks/paragraphs/) and add [the `a` operator](https://docs.asciidoctor.org/asciidoc/latest/tables/format-cell-content/#a-operator) inside of tables. |
| PageBreak | DITA 1.3 does not support page breaks. If visual separation of the text is needed, rewrite your content without using a [page break](https://docs.asciidoctor.org/asciidoc/latest/blocks/breaks/#page-breaks). |
| RelatedLinks | In DITA 1.3, the `<related-links>` element can only contain links. Format additional resources as [an unordered list](https://docs.asciidoctor.org/asciidoc/latest/lists/unordered/), remove lines that do not contain [a link](https://docs.asciidoctor.org/asciidoc/latest/macros/links/) or [a cross reference](https://docs.asciidoctor.org/asciidoc/latest/macros/xref/), and remove any text that precedes or follows a link or a cross reference. |
| ShortDescription | DITA 1.3 supports the `<shortdesc>` element to provide a short description of the topic. Assigning `[role="_abstract"]` to a paragraph you want to convert to the `<shortdesc>` element. |
| SidebarBlock | DITA 1.3 does not support sidebar content. If visual separation of the text is needed, rewrite your content without using [a sidebar block](https://docs.asciidoctor.org/asciidoc/latest/blocks/sidebars/). |
| TableFooter | DITA 1.3 does not support table footers. Rewrite your content without using [a table footer](https://docs.asciidoctor.org/asciidoc/latest/tables/add-footer-row/#assign-footer-to-the-last-row). |
| TaskDuplicate | DITA 1.3 expects task topics to be composed of the following optional elements: `<prereq>`, `<context>`, `<steps>` or `<steps-unordered>`, `<result>`, `<tasktroubleshooting>`, `<example>`, and `<postreq>`. These elements directly correspond to the following [block titles](https://docs.asciidoctor.org/asciidoc/latest/blocks/add-title/) in AsciiDoc: *Prerequisite*/*Prerequisites*, *Procedure*, *Verification*/*Result*/*Results*, *Troubleshooting*/*Troubleshooting step*/*Troubleshooting steps*, and *Next step*/*Next steps*. Because each element can appear only once in a DITA task, duplicate titles are not allowed. Remove any duplicate titles or combine them into one. |
| TaskStep | DITA 1.3 allows only one `<steps>` or `<steps-unordered>` element in a task topic. Verify that any content that follows the *Procedure* block title is part of a single [ordered](https://docs.asciidoctor.org/asciidoc/latest/lists/ordered/) or [unordered list](https://docs.asciidoctor.org/asciidoc/latest/lists/unordered/). If any content precedes the steps, move it above the *Procedure* and *Prerequisites* block titles. If any content immediately follows the steps, either append it to the last step by using [a list continuation](https://docs.asciidoctor.org/asciidoc/latest/lists/continuation/#list-continuation), or add the *Result* or *Next steps* block title above it.  |
| TaskTitle | DITA 1.3 expects task topics to be composed of the following optional elements: `<prereq>`, `<context>`, `<steps>` or `<steps-unordered>`, `<result>`, `<tasktroubleshooting>`, `<example>`, and `<postreq>`. These elements directly correspond to the following [block titles](https://docs.asciidoctor.org/asciidoc/latest/blocks/add-title/) in AsciiDoc: *Prerequisite*/*Prerequisites*, *Procedure*, *Verification*/*Result*/*Results*, *Troubleshooting*/*Troubleshooting step*/*Troubleshooting steps*, and *Next step*/*Next steps*. In addition, the *Additional resources* block title directly maps to the `<related-links>` element. Do not use any other block titles. |
| ThematicBreak | DITA 1.3 does not support thematic breaks. If visual separation  of the text is needed, rewrite your content without using [a thematic break](https://docs.asciidoctor.org/asciidoc/latest/blocks/breaks/#thematic-breaks). |

### Suggestions

The following rules have their severity set to `suggestion`. These are convenience rules and do not report problems with the AsciiDoc markup.

| Vale rule | Explanation |
| --- | --- |
| AttributeReference | Lists all [attribute references](https://docs.asciidoctor.org/asciidoc/latest/attributes/reference-attributes/) in the file. Use this information to decide which attribute definitions to supply during conversion. |
| ConditionalCode | Lists all `ifdef`, `ifndef`, and `ifeval` [conditional statements](https://docs.asciidoctor.org/asciidoc/latest/directives/conditionals/) in the file. Use this information to decide which attribute definitions to supply during conversion. |
| IncludeDirective | Lists all [include directives](https://docs.asciidoctor.org/asciidoc/latest/directives/include/) in the file. Use this information to decide if include directives should be processed during conversion. |
| TagDirective | Lists all [tag directives](https://docs.asciidoctor.org/asciidoc/latest/directives/include-tagged-regions/) in the file. Use this information to decide how to approach conditional content after conversion. |

## Copyright

Copyright © 2025 Jaromir Hradilek

This program is free software, released under the terms of the MIT license. It is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
