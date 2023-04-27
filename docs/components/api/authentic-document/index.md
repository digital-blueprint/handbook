# Overview

```mermaid
graph TD
    style authentic_document_bundle fill:#606096,color:#fff

    e_id_doc("E-ID Document Frontend")
    e_id_idp("E-ID IdP")

    subgraph API Gateway
        api(("API"))
        core_bundle("Core Bundle")
        authentic_document_bundle("Authentic Document Bundle")
    end

    api --> core_bundle
    api --> authentic_document_bundle
    authentic_document_bundle --> core_bundle
    authentic_document_bundle --> e_id_doc
    e_id_doc --> e_id_idp
    authentic_document_bundle --> e_id_idp

    click e_id_doc "./#e-id-document-frontend" "by EGIZ"
    click e_id_idp "./#e-id-idp" "by EGIZ"
```

### E-ID IdP

The E-ID Identity Provider

### E-ID Document Frontend

The E-ID Document Frontend by [EGIZ](https://www.egiz.gv.at/en/) is accessed to
request and receive authentic documents from the government.