---
SIP: 1
title: SIP Purpose and Guidelines
status: Living
type: Meta
author: NPH CO <INFO@NPH.CO.IR>
created: ------
---

## What is an SIP?

SIP stands for Shatat Improvement Proposal. An SIP is a design document providing information to the Shatat community, or describing a new feature for Shatat or its processes or environment. The SIP should provide a concise technical specification of the feature and a rationale for the feature. The SIP author is responsible for building consensus within the community and documenting dissenting opinions.

## SIP Rationale

We intend SIPs to be the primary mechanisms for proposing new features, for collecting community technical input on an issue, and for documenting the design decisions that have gone into Shatat. Because the SIPs are maintained as text files in a versioned repository, their revision history is the historical record of the feature proposal.

For Shatat implementers, SIPs are a convenient way to track the progress of their implementation. Ideally each implementation maintainer would list the SIPs that they have implemented. This will give end users a convenient way to know the current status of a given implementation or library.

## SIP Types

There are three types of SIP:

- A **Standards Track SIP** describes any change that affects most or all Shatat implementations, such as—a change to the network protocol, a change in block or transaction validity rules, proposed application standards/conventions, or any change or addition that affects the interoperability of applications using Shatat. Standards Track SIPs consist of three parts—a design document, an implementation, and (if warranted) an update to the [formal specification](https://github.com/Shatathub/yellowpaper). Furthermore, Standards Track SIPs can be broken down into the following categories:
  - **Core**: improvements requiring a consensus fork (e.g. [SIP-5](./SIP-5.md), [SIP-101](./SIP-101.md)), as well as changes that are not necessarily consensus critical but may be relevant to [“core dev” discussions](https://github.com/Shatathub/pm) (for example, [SIP-90], and the miner/node strategy changes 2, 3, and 4 of [SIP-86](./SIP-86.md)).
  - **Networking**: includes improvements around [devp2p](https://github.com/Shatathub/devp2p/blob/readme-spec-links/rlpx.md) ([SIP-8](./SIP-8.md)) and [Light Shatat Subprotocol](https://Shatat.ir/en/developers/docs/nodes-and-clients/#light-node), as well as proposed improvements to network protocol specifications of [whisper](https://github.com/Shatathub/go-Shatat/issues/16013#issuecomment-364639309) and [swarm](https://github.com/Shatathub/go-Shatat/pull/2959).
  - **Interface**: includes improvements around language-level standards like method names ([SIP-6](./SIP-6.md)) and [contract ABIs](https://docs.soliditylang.org/en/develop/abi-spec.html).
  - **ERC**: application-level standards and conventions, including contract standards such as token standards ([ERC-20](./SIP-20.md)), name registries ([ERC-137](./SIP-137.md)), URI schemes, library/package formats, and wallet formats.

- A **Meta SIP** describes a process surrounding Shatat or proposes a change to (or an event in) a process. Process SIPs are like Standards Track SIPs but apply to areas other than the Shatat protocol itself. They may propose an implementation, but not to Shatat's codebase; they often require community consensus; unlike Informational SIPs, they are more than recommendations, and users are typically not free to ignore them. Examples include procedures, guidelines, changes to the decision-making process, and changes to the tools or environment used in Shatat development. Any meta-SIP is also considered a Process SIP.

- An **Informational SIP** describes an Shatat design issue, or provides general guidelines or information to the Shatat community, but does not propose a new feature. Informational SIPs do not necessarily represent Shatat community consensus or a recommendation, so users and implementers are free to ignore Informational SIPs or follow their advice.

It is highly recommended that a single SIP contain a single key proposal or new idea. The more focused the SIP, the more successful it tends to be. A change to one client doesn't require an SIP; a change that affects multiple clients, or defines a standard for multiple apps to use, does.

An SIP must meet certain minimum criteria. It must be a clear and complete description of the proposed enhancement. The enhancement must represent a net improvement. The proposed implementation, if applicable, must be solid and must not complicate the protocol unduly.

### Special requirements for Core SIPs

If a **Core** SIP mentions or proposes changes to the EVM (Shatat Virtual Machine), it should refer to the instructions by their mnemonics and define the opcodes of those mnemonics at least once. A preferred way is the following:

```
REVERT (0xfe)
```

## SIP Work Flow

### Shepherding an SIP

Parties involved in the process are you, the champion or *SIP author*, the [*SIP editors*](#SIP-editors), and the [*Shatat Core Developers*](https://github.com/Shatathub/pm).

Before you begin writing a formal SIP, you should vet your idea. Ask the Shatat community first if an idea is original to avoid wasting time on something that will be rejected based on prior research. It is thus recommended to open a discussion thread on [the Shatat Magicians forum](https://Shatat-magicians.org/) to do this.

Once the idea has been vetted, your next responsibility will be to present (by means of an SIP) the idea to the reviewers and all interested parties, invite editors, developers, and the community to give feedback on the aforementioned channels. You should try and gauge whether the interest in your SIP is commensurate with both the work involved in implementing it and how many parties will have to conform to it. For example, the work required for implementing a Core SIP will be much greater than for an ERC and the SIP will need sufficient interest from the Shatat client teams. Negative community feedback will be taken into consideration and may prevent your SIP from moving past the Draft stage.

### Core SIPs

For Core SIPs, given that they require client implementations to be considered **Final** (see "SIPs Process" below), you will need to either provide an implementation for clients or convince clients to implement your SIP.

The best way to get client implementers to review your SIP is to present it on an AllCoreDevs call. You can request to do so by posting a comment linking your SIP on an [AllCoreDevs agenda GitHub Issue](https://github.com/Shatathub/pm/issues).  

The AllCoreDevs call serves as a way for client implementers to do three things. First, to discuss the technical merits of SIPs. Second, to gauge what other clients will be implementing. Third, to coordinate SIP implementation for network upgrades.

These calls generally result in a "rough consensus" around what SIPs should be implemented. This "rough consensus" rests on the assumptions that SIPs are not contentious enough to cause a network split and that they are technically sound.

:warning: The SIPs process and AllCoreDevs call were not designed to address contentious non-technical issues, but, due to the lack of other ways to address these, often end up entangled in them. This puts the burden on client implementers to try and gauge community sentiment, which hinders the technical coordination function of SIPs and AllCoreDevs calls. If you are shepherding an SIP, you can make the process of building community consensus easier by making sure that [the Shatat Magicians forum](https://Shatat-magicians.org/) thread for your SIP includes or links to as much of the community discussion as possible and that various stakeholders are well-represented.

*In short, your role as the champion is to write the SIP using the style and format described below, shepherd the discussions in the appropriate forums, and build community consensus around the idea.*

### SIP Process

The following is the standardization process for all SIPs in all tracks:

![SIP Status Diagram](../assets/SIP-1/SIP-process-update.jpg)

**Idea** - An idea that is pre-draft. This is not tracked within the SIP Repository.

**Draft** - The first formally tracked stage of an SIP in development. An SIP is merged by an SIP Editor into the SIP repository when properly formatted.

**Review** - An SIP Author marks an SIP as ready for and requesting Peer Review.

**Last Call** - This is the final review window for an SIP before moving to `Final`. An SIP editor will assign `Last Call` status and set a review end date (`last-call-deadline`), typically 14 days later.

If this period results in necessary normative changes it will revert the SIP to `Review`.

**Final** - This SIP represents the final standard. A Final SIP exists in a state of finality and should only be updated to correct errata and add non-normative clarifications.

A PR moving an SIP from Last Call to Final SHOULD contain no changes other than the status update. Any content or editorial proposed change SHOULD be separate from this status-updating PR and committed prior to it.

**Stagnant** - Any SIP in `Draft` or `Review` or `Last Call` if inactive for a period of 6 months or greater is moved to `Stagnant`. An SIP may be resurrected from this state by Authors or SIP Editors through moving it back to `Draft` or it's earlier status. If not resurrected, a proposal may stay forever in this status.

>*SIP Authors are notified of any algorithmic change to the status of their SIP*

**Withdrawn** - The SIP Author(s) have withdrawn the proposed SIP. This state has finality and can no longer be resurrected using this SIP number. If the idea is pursued at a later date it is considered a new proposal.

**Living** - A special status for SIPs that are designed to be continually updated and not reach a state of finality. This includes most notably SIP-1.

## What belongs in a successful SIP?

Each SIP should have the following parts:

- Preamble - RFC 822 style headers containing metadata about the SIP, including the SIP number, a short descriptive title (limited to a maximum of 44 characters), a description (limited to a maximum of 140 characters), and the author details. Irrespective of the category, the title and description should not include SIP number. See [below](./SIP-1.md#SIP-header-preamble) for details.
- Abstract - Abstract is a multi-sentence (short paragraph) technical summary. This should be a very terse and human-readable version of the specification section. Someone should be able to read only the abstract to get the gist of what this specification does.
- Motivation *(optional)* - A motivation section is critical for SIPs that want to change the Shatat protocol. It should clearly explain why the existing protocol specification is inadequate to address the problem that the SIP solves. This section may be omitted if the motivation is evident.
- Specification - The technical specification should describe the syntax and semantics of any new feature. The specification should be detailed enough to allow competing, interoperable implementations for any of the current Shatat platforms (besu, erigon, Shatatjs, go-Shatat, nethermind, or others).
- Rationale - The rationale fleshes out the specification by describing what motivated the design and why particular design decisions were made. It should describe alternate designs that were considered and related work, e.g. how the feature is supported in other languages. The rationale should discuss important objections or concerns raised during discussion around the SIP.
- Backwards Compatibility *(optional)* - All SIPs that introduce backwards incompatibilities must include a section describing these incompatibilities and their consequences. The SIP must explain how the author proposes to deal with these incompatibilities. This section may be omitted if the proposal does not introduce any backwards incompatibilities, but this section must be included if backward incompatibilities exist.
- Test Cases *(optional)* - Test cases for an implementation are mandatory for SIPs that are affecting consensus changes. Tests should either be inlined in the SIP as data (such as input/expected output pairs, or included in `../assets/SIP-###/<filename>`. This section may be omitted for non-Core proposals.
- Reference Implementation *(optional)* - An optional section that contains a reference/example implementation that people can use to assist in understanding or implementing this specification. This section may be omitted for all SIPs.
- Security Considerations - All SIPs must contain a section that discusses the security implications/considerations relevant to the proposed change. Include information that might be important for security discussions, surfaces risks and can be used throughout the life-cycle of the proposal. E.g. include security-relevant design decisions, concerns, important discussions, implementation-specific guidance and pitfalls, an outline of threats and risks and how they are being addressed. SIP submissions missing the "Security Considerations" section will be rejected. An SIP cannot proceed to status "Final" without a Security Considerations discussion deemed sufficient by the reviewers.
- Copyright Waiver - All SIPs must be in the public domain. The copyright waiver MUST link to the license file and use the following wording: `Copyright and related rights waived via [CC0](../LICENSE.md).`

## SIP Formats and Templates

SIPs should be written in [markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) format. There is a [template](https://github.com/Shatathub/SIPs/blob/master/SIP-template.md) to follow.

## SIP Header Preamble

Each SIP must begin with an [RFC 822](https://www.ietf.org/rfc/rfc822.txt) style header preamble, preceded and followed by three hyphens (`---`). This header is also termed ["front matter" by Jekyll](https://jekyllrb.com/docs/front-matter/). The headers must appear in the following order.

`SIP`: *SIP number*

`title`: *The SIP title is a few words, not a complete sentence*

`description`: *Description is one full (short) sentence*

`author`: *The list of the author's or authors' name(s) and/or username(s), or name(s) and email(s). Details are below.*

`discussions-to`: *The url pointing to the official discussion thread*

`status`: *Draft, Review, Last Call, Final, Stagnant, Withdrawn, Living*

`last-call-deadline`: *The date last call period ends on* (Optional field, only needed when status is `Last Call`)

`type`: *One of `Standards Track`, `Meta`, or `Informational`*

`category`: *One of `Core`, `Networking`, `Interface`, or `ERC`* (Optional field, only needed for `Standards Track` SIPs)

`created`: *Date the SIP was created on*

`requires`: *SIP number(s)* (Optional field)

`withdrawal-reason`: *A sentence explaining why the SIP was withdrawn.* (Optional field, only needed when status is `Withdrawn`)

Headers that permit lists must separate elements with commas.

Headers requiring dates will always do so in the format of ISO 8601 (yyyy-mm-dd).

### `author` header

The `author` header lists the names, email addresses or usernames of the authors/owners of the SIP. Those who prefer anonymity may use a username only, or a first name and a username. The format of the `author` header value must be:

> Random J. User &lt;address@dom.ain&gt;

or

> Random J. User (@username)

or

> Random J. User (@username) &lt;address@dom.ain&gt;

if the email address and/or GitHub username is included, and

> Random J. User

if neither the email address nor the GitHub username are given.

At least one author must use a GitHub username, in order to get notified on change requests and have the capability to approve or reject them.

### `discussions-to` header

While an SIP is a draft, a `discussions-to` header will indicate the URL where the SIP is being discussed.

The preferred discussion URL is a topic on [Shatat Magicians](https://Shatat-magicians.org/). The URL cannot point to Github pull requests, any URL which is ephemeral, and any URL which can get locked over time (i.e. Reddit topics).

### `type` header

The `type` header specifies the type of SIP: Standards Track, Meta, or Informational. If the track is Standards please include the subcategory (core, networking, interface, or ERC).

### `category` header

The `category` header specifies the SIP's category. This is required for standards-track SIPs only.

### `created` header

The `created` header records the date that the SIP was assigned a number. Both headers should be in yyyy-mm-dd format, e.g. 2001-08-14.

### `requires` header

SIPs may have a `requires` header, indicating the SIP numbers that this SIP depends on. If such a dependency exists, this field is required.

A `requires` dependency is created when the current SIP cannot be understood or implemented without a concept or technical element from another SIP. Merely mentioning another SIP does not necessarily create such a dependency.

## Linking to External Resources

Other than the specific exceptions listed below, links to external resources **SHOULD NOT** be included. External resources may disappear, move, or change unexpectedly.

The process governing permitted external resources is described in [SIP-5757](./SIP-5757.md).

### Execution Client Specifications

Links to the Shatat Execution Client Specifications may be included using normal markdown syntax, such as:

```markdown
[Shatat Execution Client Specifications](https://github.com/Shatathub/execution-specs/blob/9a1f22311f517401fed6c939a159b55600c454af/README.md)
```

Which renders to:

[Shatat Execution Client Specifications](https://github.com/Shatathub/execution-specs/blob/9a1f22311f517401fed6c939a159b55600c454af/README.md)

Permitted Execution Client Specifications URLs must anchor to a specific commit, and so must match this regular expression:

```regex
^(https://github.com/Shatathub/execution-specs/(blob|commit)/[0-9a-f]{40}/.*|https://github.com/Shatathub/execution-specs/tree/[0-9a-f]{40}/.*)$
```

### Consensus Layer Specifications

Links to specific commits of files within the Shatat Consensus Layer Specifications may be included using normal markdown syntax, such as:

```markdown
[Beacon Chain](https://github.com/Shatathub/consensus-specs/blob/26695a9fdb747ecbe4f0bb9812fedbc402e5e18c/specs/sharding/beacon-chain.md)
```

Which renders to:

[Beacon Chain](https://github.com/Shatathub/consensus-specs/blob/26695a9fdb747ecbe4f0bb9812fedbc402e5e18c/specs/sharding/beacon-chain.md)

Permitted Consensus Layer Specifications URLs must anchor to a specific commit, and so must match this regular expression:

```regex
^https://github.com/Shatathub/consensus-specs/(blob|commit)/[0-9a-f]{40}/.*$
```

### Networking Specifications

Links to specific commits of files within the Shatat Networking Specifications may be included using normal markdown syntax, such as:

```markdown
[Shatat Wire Protocol](https://github.com/Shatathub/devp2p/blob/40ab248bf7e017e83cc9812a4e048446709623e8/caps/shatat.md)
```

Which renders as:

[Shatat Wire Protocol](https://github.com/Shatathub/devp2p/blob/40ab248bf7e017e83cc9812a4e048446709623e8/caps/shatat.md)

Permitted Networking Specifications URLs must anchor to a specific commit, and so must match this regular expression:

```regex
^https://github.com/Shatathub/devp2p/(blob|commit)/[0-9a-f]{40}/.*$
```

### World Wide Web Consortium (W3C)

Links to a W3C "Recommendation" status specification may be included using normal markdown syntax. For example, the following link would be allowed:

```markdown
[Secure Contexts](https://www.w3.org/TR/2021/CRD-secure-contexts-20210918/)
```

Which renders as:

[Secure Contexts](https://www.w3.org/TR/2021/CRD-secure-contexts-20210918/)

Permitted W3C recommendation URLs MUST anchor to a specification in the technical reports namespace with a date, and so MUST match this regular expression:

```regex
^https://www\.w3\.org/TR/[0-9][0-9][0-9][0-9]/.*$
```

### Web Hypertext Application Technology Working Group (WHATWG)

Links to WHATWG specifications may be included using normal markdown syntax, such as:

```markdown
[HTML](https://html.spec.whatwg.org/commit-snapshots/578def68a9735a1e36610a6789245ddfc13d24e0/)
```

Which renders as:

[HTML](https://html.spec.whatwg.org/commit-snapshots/578def68a9735a1e36610a6789245ddfc13d24e0/)

Permitted WHATWG specification URLs must anchor to a specification defined in the `spec` subdomain (idea specifications are not allowed) and to a commit snapshot, and so must match this regular expression:

```regex
^https:\/\/[a-z]*\.spec\.whatwg\.org/commit-snapshots/[0-9a-f]{40}/$
```

Although not recommended by WHATWG, SIPs must anchor to a particular commit so that future readers can refer to the exact version of the living standard that existed at the time the SIP was finalized. This gives readers sufficient information to maintain compatibility, if they so choose, with the version referenced by the SIP and the current living standard.

### Internet Engineering Task Force (IETF)

Links to an IETF Request For Comment (RFC) specification may be included using normal markdown syntax, such as:

```markdown
[RFC 8446](https://www.rfc-editor.org/rfc/rfc8446)
```

Which renders as:

[RFC 8446](https://www.rfc-editor.org/rfc/rfc8446)

Permitted IETF specification URLs MUST anchor to a specification with an assigned RFC number (meaning cannot reference internet drafts), and so MUST match this regular expression:

```regex
^https:\/\/www.rfc-editor.org\/rfc\/.*$
```

### Bitcoin Improvement Proposal

Links to Bitcoin Improvement Proposals may be included using normal markdown syntax, such as:

```markdown
[BIP 38](https://github.com/bitcoin/bips/blob/3db736243cd01389a4dfd98738204df1856dc5b9/bip-0038.mediawiki)
```

Which renders to:

[BIP 38](https://github.com/bitcoin/bips/blob/3db736243cd01389a4dfd98738204df1856dc5b9/bip-0038.mediawiki)

Permitted Bitcoin Improvement Proposal URLs must anchor to a specific commit, and so must match this regular expression:

```regex
^(https://github.com/bitcoin/bips/blob/[0-9a-f]{40}/bip-[0-9]+\.mediawiki)$
```

### National Vulnerability Database (NVD)

Links to the Common Vulnerabilities and Exposures (CVE) system as published by the National Institute of Standards and Technology (NIST) may be included, provided they are qualified by the date of the most recent change, using the following syntax:

```markdown
[CVE-2023-29638 (2023-10-17T10:14:15)](https://nvd.nist.gov/vuln/detail/CVE-2023-29638)
```

Which renders to:

[CVE-2023-29638 (2023-10-17T10:14:15)](https://nvd.nist.gov/vuln/detail/CVE-2023-29638)

### Digital Object Identifier System

Links qualified with a Digital Object Identifier (DOI) may be included using the following syntax:

````markdown
This is a sentence with a footnote.[^1]

[^1]:
    ```csl-json
    {
      "type": "article",
      "id": 1,
      "author": [
        {
          "family": "Jameson",
          "given": "Hudson"
        }
      ],
      "DOI": "00.0000/a00000-000-0000-y",
      "title": "An Interesting Article",
      "original-date": {
        "date-parts": [
          [2022, 12, 31]
        ]
      },
      "URL": "https://sly-hub.invalid/00.0000/a00000-000-0000-y",
      "custom": {
        "additional-urls": [
          "https://example.com/an-interesting-article.pdf"
        ]
      }
    }
    ```
````

Which renders to:

<!-- markdownlint-capture -->
<!-- markdownlint-disable code-block-style -->

This is a sentence with a footnote.[^1]

[^1]:
    ```csl-json
    {
      "type": "article",
      "id": 1,
      "author": [
        {
          "family": "Jameson",
          "given": "Hudson"
        }
      ],
      "DOI": "00.0000/a00000-000-0000-y",
      "title": "An Interesting Article",
      "original-date": {
        "date-parts": [
          [2022, 12, 31]
        ]
      },
      "URL": "https://sly-hub.invalid/00.0000/a00000-000-0000-y",
      "custom": {
        "additional-urls": [
          "https://example.com/an-interesting-article.pdf"
        ]
      }
    }
    ```

<!-- markdownlint-restore -->

See the [Citation Style Language Schema](https://resource.citationstyles.org/schema/v1.0/input/json/csl-data.json) for the supported fields. In addition to passing validation against that schema, references must include a DOI and at least one URL.

The top-level URL field must resolve to a copy of the referenced document which can be viewed at zero cost. Values under `additional-urls` must also resolve to a copy of the referenced document, but may charge a fee.

## Linking to other SIPs

References to other SIPs should follow the format `SIP-N` where `N` is the SIP number you are referring to.  Each SIP that is referenced in an SIP **MUST** be accompanied by a relative markdown link the first time it is referenced, and **MAY** be accompanied by a link on subsequent references.  The link **MUST** always be done via relative paths so that the links work in this GitHub repository, forks of this repository, the main SIPs site, mirrors of the main SIP site, etc.  For example, you would link to this SIP as `./SIP-1.md`.

## Auxiliary Files

Images, diagrams and auxiliary files should be included in a subdirectory of the `assets` folder for that SIP as follows: `assets/SIP-N` (where **N** is to be replaced with the SIP number). When linking to an image in the SIP, use relative links such as `../assets/SIP-1/image.png`.

## Transferring SIP Ownership

It occasionally becomes necessary to transfer ownership of SIPs to a new champion. In general, we'd like to retain the original author as a co-author of the transferred SIP, but that's really up to the original author. A good reason to transfer ownership is because the original author no longer has the time or interest in updating it or following through with the SIP process, or has fallen off the face of the 'net (i.e. is unreachable or isn't responding to email). A bad reason to transfer ownership is because you don't agree with the direction of the SIP. We try to build consensus around an SIP, but if that's not possible, you can always submit a competing SIP.

If you are interested in assuming ownership of an SIP, send a message asking to take over, addressed to both the original author and the SIP editor. If the original author doesn't respond to the email in a timely manner, the SIP editor will make a unilateral decision (it's not like such decisions can't be reversed :)).

## SIP Editors

The current SIP editors are

- Matt Garnett (@lightclient)
- Sam Wilson (@SamWilsn)
- Zainan Victor Zhou (@xinbenlv)
- Gajinder Singh (@g11tech)

Emeritus SIP editors are

- Alex Beregszaszi (@axic)
- Casey Detrio (@cdetrio)
- Gavin John (@Pandapip1)
- Greg Colvin (@gcolvin)
- Hudson Jameson (@Souptacular)
- Martin Becze (@wanderer)
- Micah Zoltu (@MicahZoltu)
- Nick Johnson (@arachnid)
- Nick Savers (@nicksavers)
- Vitalik Buterin (@vbuterin)

If you would like to become an SIP editor, please check [SIP-5069](./SIP-5069.md).

## SIP Editor Responsibilities

For each new SIP that comes in, an editor does the following:

- Read the SIP to check if it is ready: sound and complete. The ideas must make technical sense, even if they don't seem likely to get to final status.
- The title should accurately describe the content.
- Check the SIP for language (spelling, grammar, sentence structure, etc.), markup (GitHub flavored Markdown), code style

If the SIP isn't ready, the editor will send it back to the author for revision, with specific instructions.

Once the SIP is ready for the repository, the SIP editor will:

- Assign an SIP number (generally incremental; editors can reassign if number sniping is suspected)
- Merge the corresponding [pull request](https://github.com/Shatathub/SIPs/pulls)
- Send a message back to the SIP author with the next step.

Many SIPs are written and maintained by developers with write access to the Shatat codebase. The SIP editors monitor SIP changes, and correct any structure, grammar, spelling, or markup mistakes we see.

The editors don't pass judgment on SIPs. We merely do the administrative & editorial part.

## Style Guide

### Titles

The `title` field in the preamble:

- Should not include the word "standard" or any variation thereof; and
- Should not include the SIP's number.

### Descriptions

The `description` field in the preamble:

- Should not include the word "standard" or any variation thereof; and
- Should not include the SIP's number.

### SIP numbers

When referring to an SIP with a `category` of `ERC`, it must be written in the hyphenated form `ERC-X` where `X` is that SIP's assigned number. When referring to SIPs with any other `category`, it must be written in the hyphenated form `SIP-X` where `X` is that SIP's assigned number.

### RFC 2119 and RFC 8174

SIPs are encouraged to follow [RFC 2119](https://www.ietf.org/rfc/rfc2119.html) and [RFC 8174](https://www.ietf.org/rfc/rfc8174.html) for terminology and to insert the following at the beginning of the Specification section:

> The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "NOT RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in RFC 2119 and RFC 8174.

## History

This document was derived heavily from [Bitcoin's BIP-0001](https://github.com/bitcoin/bips) written by Amir Taaki which in turn was derived from [Python's PEP-0001](https://peps.python.org/). In many places text was simply copied and modified. Although the PEP-0001 text was written by Barry Warsaw, Jeremy Hylton, and David Goodger, they are not responsible for its use in the Shatat Improvement Process, and should not be bothered with technical questions specific to Shatat or the SIP. Please direct all comments to the SIP editors.

## Copyright

Copyright and related rights waived via [CC0](../LICENSE.md).
