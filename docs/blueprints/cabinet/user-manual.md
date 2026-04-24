# User Manual

This manual describes how the _cabinet_ application can be used for administering student records. It focuses on the user's perspective but is also suitable for technical staff responsible for implementing the application in their university's technological landscape to learn about the user interface and functionalities of _cabinet_.

## User Flows

### Search for documents or persons based on common values
Using various combinations of filters and search strings, users are able to find documents or persons that match the desired criteria. The filters can be configured (by selecting the button _Configuration_) to show only the needed categories. 

!!! tip  
    
    Activating fewer filters makes the search faster than having all filters active.

<figure markdown>
![cabinet_configuration](./img/cabinet_configuration.png){: style="max-width:800px; width: 100%; box-shadow: 0px 0px 5px #888;" }
</figure>

### Search for a specific person
Using the search bar, users can type in any of the following data values of a person into the search bar: name, last name, matriculation number, CAMPUSonline identification number, and birthdate. It is useful to know the following features:

- The search is dynamically applied and adapted after each typed-in character.
- Strings that contain diacritics are even being matched using their non-diacritic equivalents. For example, a search for _Hodzic_ equally matches _Hodžić_ as well.
- For searching the person's name and the document type, the search uses a typo tolerance algorithm when there is no exact search match. In other words, typographical mistakes or minor uncertainty still lead to results.
- When multiple persons match the entered string, users can either limit the search results by selecting filters, or if they identify the desired person in the results, use the button _Focus_, which excludes all other persons from the search results.

<figure markdown>
![cabinet_search](./img/cabinet_search.png){: style="max-width:800px; width: 100%; box-shadow: 0px 0px 5px #888;" }
</figure>

- The search string could match not only persons, but also documents. In this case, users can use the filter _Category_ to select only persons or only documents.

### Apply actions to a person
The source of personal data in _cabinet_ is CAMPUSonline. Therefore, editing a person's data directly in _cabinet_ is not possible. However, the person's view modal contains a direct link to the CAMPUSonline profile (i.e., the button _Edit data in …_), where data can be edited. This data adjustment automatically gets updated in _cabinet_ after closing the CAMPUSonline window.

Personal data gets automatically synchronized with CAMPUSonline on a regular basis every 10 minutes, as well as after editing in CAMPUSonline, when the browser tab of CAMPUSonline gets closed. It can also be triggered manually for a selected person by selecting the _Synchronize data_ button. 

It is also possible to export a person's data as a PDF using the button Download.

<figure markdown>
![cabinet_person-actions](./img/cabinet_person-actions.png){: style="max-width:800px; width: 100%; box-shadow: 0px 0px 5px #888;" }
</figure>

Another important feature is to add documents to persons, which is described in the user flow [Add a document to a person](#add-a-document-to-a-person).

### Export data of multiple persons at once

The _cabinet_ user interface allows exporting the data of multiple persons at once.

For this, one first needs to open the _Multi-selection tool_ and use it to select the needed persons. The best way to do this is in combination with the search bar and filters.

<figure markdown>
![cabinet_multiselect](./img/cabinet_multiselect.png){: style="max-width:800px; width: 100%; box-shadow: 0px 0px 5px #888;" }
</figure>

The _Open dialogue_ button then opens the multi-actions tool for persons and for documents. In the tab _Persons_, one can configure which data should be shown and use the _Export_ functionality to export the configured data table as CSV or Excel or to download PDFs of the persons' data of all selected persons.

<figure markdown>
![cabinet_multiactions-persons](./img/cabinet_multiactions-persons.png){: style="max-width:800px; width: 100%; box-shadow: 0px 0px 5px #888;" }
</figure>

### Add a document to a person
To manually add a document to a person, users first need to search for that person, as described above. Using the button _Add document_, a document can be added by uploading it from the personal computer, from the cloud, or from the application clipboard.

<figure markdown>
![cabinet_add-document](./img/cabinet_add-document.png){: style="max-width:800px; width: 100%; box-shadow: 0px 0px 5px #888;" }
</figure>

!!! important
    
    It is important to note that PDF/A (conformance level 2b, 1b, 1a, 2u, and 2a) is the only acceptable file upload format. 
    
The system validates the conformity on upload and rejects non-PDF/A formats in order to ensure long-term preservation. Documents in other formats need to be converted to PDF/A first. This is possible using Adobe Acrobat, even with multiple files at once. For detailed instructions, please visit [Adobe Acrobat](https://www.adobe.com/acrobat/hub/how-to-convert-pdf-to-pdfa.html) or read our chapter [How to create and validate PDF/A files]((#how-to-create-and-validate-pdfa-files).

After uploading the file, the user needs to assign a document type (for example, _Personal licence_). Depending on the selected type, there are a number of data fields, of which some are required, and others optional. Additionally, the system automatically saves the upload and update time, as well as the name of the person who last modified it.

Unlike documents that need uploading, documents generated in CAMPUSonline are being sent to _cabinet_ automatically upon creation and assigned to the corresponding person. Distinguishing them from manually uploaded documents is possible using the filter Digital document source.

### Search for a specific document
The best way to find a document file in _cabinet_ would be to search for a person first and then use the button _Focus_, which excludes all other persons and their documents from the search results. The listed documents can be further limited by applying filters of either the _Person properties_ or the _Document properties_, or both in combination.

Documents can also be found using the search bar. This can especially be practical if the data field _Registry number_ is filled out consistently, which makes it possible to quickly see all documents that belong to a certain registry case. Other data fields that match the entered search bar string are the person's name, last name, matriculation number, CAMPUSonline identifier, and birthdate, as well as the document type.

<figure markdown>
![cabinet_document-search](./img/cabinet_document-search.png){: style="max-width:800px; width: 100%; box-shadow: 0px 0px 5px #888;" }
</figure>

### Apply actions to a document
Once uploaded, documents can be edited, deleted, downloaded, or exchanged between integrated applications. 

<figure markdown>
![cabinet_document-actions](./img/cabinet_document-actions.png){: style="max-width:800px; width: 100%; box-shadow: 0px 0px 5px #888;" }
</figure>

#### Editing

Using the action _Edit_ in the document view, it is possible to edit document data without re-uploading the file itself, but also to re-upload a file without having to re-enter the data.

Editing of data for automatically added documents from CAMPUSonline is only possible for specific data fields, like Registry number and Comment. 

#### Adding a new version

_cabinet_ has a flexible concept of versions that can be fully controlled by the user. If a document is added to _cabinet_ in this way instead of using the button _Add document_ in the person's hitbox, that uploaded document will be grouped with the already existing document. To read more about this concept, see the chapter [How the grouping of documents works](#how-the-grouping-of-documents-works).

!!! note
    
    Grouping documents manually is only necessary and possible for manually uploaded documents. Automatically added documents from CAMPUSonline get grouped automatically depending on the agreed-upon criteria (for example, a mutual document type). 

#### Deleting

If documents are selected for deletion, they stay in the database for an additional agreed-on time and can be found by selecting the radio button _Recycle bin_ in the facets. Only after the expired time will they get irrevocably removed. 

To read more about the retention periods and deletion, see the chapters [How to treat retention periods](#how-to-treat-retention-periods) and [How deletion works](#how-deletion-works). 

#### Downloading

For downloading the document, users can decide if they want to apply the action to the uploaded file, the added metadata in JSON format, or both in a ZIP directory.

Using the same _Download_ button, it is possible to transfer documents between _cabinet_ and other digital blueprint applications, if they are integrated in _cabinet_ as activities (i.e., if you can find them under the _Menu_). This can be done by choosing _Clipboard_ as the targeted download location. After this is applied, users can open the desired activity (for example, [eSign](../esign.md) for electronically signing documents) and continue by uploading the same file from the _Clipboard_.

<figure markdown>
![cabinet_downloading](./img/cabinet_downloading.png){: style="max-width:800px; width: 100%; box-shadow: 0px 0px 5px #888;" }
</figure>

### Apply actions to multiple documents

The _cabinet_ user interface allows exporting and deleting multiple documents at once. 

For this, one first needs to open the _Multi-selection_ tool and use it to select the needed documents. The best way to do this is in combination with the search bar and filters. 

!!! tip
    
    To select some obsolete document versions, one should make sure to check the _Include obsolete versions_ box in the filters. To select some deleted documents, one can switch the filter from _All active documents_ to _Recycle bin_.  

The _Open dialogue_ button then opens the multi-actions tool for persons and for documents. In the tab _Documents_, one can configure which data should be shown and use the _Export_ functionality to export the configured data table as CSV or Excel or to download PDF files of the documents with or without the JSON metadata. 

<figure markdown>
![cabinet_multiactions-documents](./img/cabinet_multiactions-documents.png){: style="max-width:800px; width: 100%; box-shadow: 0px 0px 5px #888;" }
</figure>

To remove selected documents individually, the _X_ button can be used. The complete selection can be cleared using the _Empty selection_ button. 

To instead delete the selected documents, the _Delete documents_ button can be used. Deleted documents will be displayed in a separate section of the multi-actions dialogue.

## FAQ

### How to create and validate PDF/A files


### How the data synchronization with CAMPUSonline works


### Which formats and data standards are used


### Which formats and data standards are used


### How the search works


### How the grouping of documents works


### How to treat retention periods


### How deletion works



### Why not everything is translated to English
