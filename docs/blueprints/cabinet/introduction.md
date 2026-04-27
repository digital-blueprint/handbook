# Introduction

The student records management application _cabinet_ is developed to assist registrar's offices or other university units responsible for the handling of students' data and documents. As one of our digital blueprint bundles, _cabinet_ interacts with other components to enable a set of useful functionalities in electronic student records:

- Manual document upload from the personal computer or directly from the cloud
- PDF/A validation via the [verity bundle](../../components/api/verity/overview.md)
- Automatic transfer of externally created documents via the [CAMPUSonline DMS connector](../../components/api/cabinet-connector-campusonline.md)
- automatic transfer of persons’ data from CAMPUSonline via the [Relay API Gateway](../../frameworks/relay/api-clients.md)
- Manual metadata enrichment for documents
- Document and data storage via [blob](../../components/api/blob/overview.md) 
- presentation of documents and data in the user interface
- Combinable text search and faceted search across personal and document data
- Signing documents electronically via [eSign](../esign.md)
- Hybrid postal delivery of documents via [dispatch](../../components/api/dispatch.md)
- Document and data download
- Document and data deletion
- Multi-actions (download of data for persons and documents, deletion of documents)
- Document and data archiving (currently in development)
- Document and data exchange via _portfolio_ (currently in development) 

The following chapters give more detailed information about the application, its components, and the implementation into your own system landscape.

If you are a technician interested in implementing _cabinet_ into your system, it's best to read all chapters starting from here, as well as the ones that will be referenced in the texts.

If you are employed in a students administration department and would like to know how to use the _cabinet_ application in your work, you can skip to the chapter [User manual](./user-manual.md).

For more assistance and feedback, feel free to contact us at hello@digital-blueprint.org.

