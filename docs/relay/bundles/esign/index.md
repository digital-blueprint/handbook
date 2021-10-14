# Overview

```mermaid
graph TD
    style esign_bundle fill:#606096,color:#fff

    a_trust("A-Trust")
    pdf_as("PDF-AS")
    moa_spss("MOA-SPSS")

    subgraph API Gateway
        api(("API"))
        core_bundle("Core Bundle")
        esign_bundle("ESign Bundle")
    end

    pdf_as --> a_trust
    moa_spss --> a_trust

    api --> core_bundle
    api --> esign_bundle
    esign_bundle --> core_bundle
    esign_bundle --> pdf_as
    esign_bundle --> moa_spss

    click a_trust "https://www.a-trust.at/"
    click pdf_as "./#pdf-as" "by EGIZ"
```

The electronic signature bundle provides an API for interacting with multiple [pdf-as](https://www.egiz.gv.at/en/schwerpunkte/16-pdf-as) and [moa-ssp](https://www.egiz.gv.at/en/schwerpunkte/13-moaspssid) servers and allows singing and signature verification of PDF files using [PAdES](https://en.wikipedia.org/wiki/PAdES).

Compared to using PDF-AS/MOA-SPSS directly it adds authentication/authorization
and a simplified REST API for the following three flows:

* Advanced signature flow: Synchronously sign PDF file using certificates on the pdf-as server
* Qualified signature flow: Asynchronously sign a PDF using [handy-signatur.at](https://www.handy-signatur.at)
* (work in progress) Signature verification flow: Verify the integrity and trust chain of a PDF using moa-spss

The following diagram shows the systems involved in signature creation and verification for all provided flows:

```mermaid
graph TD
    User --> |uses|APP
    APP --> |talks to|DBP-API
    DBP-API --> |sign|PDF-AS
    DBP-API --> |verify|MOA-SPSS
    PDF-AS --> |sign|HANDY[handy-signatur.at]
    User --> |tan|HANDY
    APP --> |embeds|HANDY
```

### PDF-AS

[PDF-AS](https://www.egiz.gv.at/en/schwerpunkte/16-pdf-as) by [EGIZ](https://www.egiz.gv.at/en/)
is used to sign documents.