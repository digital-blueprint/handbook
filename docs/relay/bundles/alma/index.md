# Overview

```mermaid
graph TD
    style api fill:#d0d0ff,stroke:#333,stroke-width:4px
    style alma_bundle fill:#606096,color:#fff

    subgraph API Gateway
        api(("API"))
        core_bundle("Core Bundle")
        alma_bundle("ALMA Bundle")
        base_bundle("Base Bundle")
    end

    subgraph Ex Libris
        alma_analytics("ALMA Analytics")
        alma_api("ALMA API")
    end

    api --> core_bundle
    api --> alma_bundle
    api --> base_bundle
    base_bundle --> core_bundle
    alma_bundle --> core_bundle
    alma_bundle --> base_bundle
    alma_analytics --> alma_api
    alma_bundle --> alma_api
    alma_bundle --> alma_analytics

    click alma_api "./#alma-api"
    click alma_analytics "./#alma-analytics"
```

### ALMA API

Library information is fetched and stored via the [ALMA API](https://developers.exlibrisgroup.com/alma/apis/bibs)
provided by [ExLibris](https://www.exlibrisgroup.com/).

### ALMA Analytics

Additional library information, that can't be accessed by the public [ALMA API](#alma-api) is
fetched from [ALMA Analytics](https://developers.exlibrisgroup.com/alma/apis/analytics)
by [ExLibris](https://www.exlibrisgroup.com/).