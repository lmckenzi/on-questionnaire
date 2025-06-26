This implementation guide sets expectations for EMRs and other systems that need to be able to render and capture data using Ontario Health FHIR Questionnaires.  

At present, the IG focuses primarily on requirements for forms used for e-referrals.  In the future, it may be updated to include requirements for additional types of forms.

All in-scope forms produced by Ontario Health will comply with the [Questionnaire profile](StructureDefinition-sdc-questionnaire.html) defined in this guide.  
Changes to rules for forms will be published in future versions of this guide.  Timing expectations for systems
to migrate to handle newer versions of this guide will be established by Ontario Health in consultation with implementers.
This includes expectations for full support of the initial release of this guide.

### Structured Data Capture
This guide relies on the HL7 International [Structured Data Capture (SDC)]({{site.data.fhir.ver.sdc}}) implementation guide.  Implementers must
familiarize themselves with the content of that guide.  Definitions and explanations found in that guide apply for all elements supported by this guide.

### Must Support
The [Questionnaire profile](StructureDefinition-sdc-questionnaire.html) makes use of the 'mustSupport' flag.  
For purposes of this IG, mustSupport means the following:

* Compliant forms **SHALL* only make use of elements marked as mustSupport
* Compliant form fillers **SHOULD** tolerate the presence of elements and extensions that are not mustSupport, but **MAY** ignore
all non-mustSupport elements
* For elements that are marked as mustSupport, compliant form fillers **SHALL** render, enforce data entry and validation rules, and perform 
calculations or logic as defined by the definition of that element.  Ignoring or failing to behave as a mustSupport element requires is non-conformant.

### Expressions
The [Questionnaire profile](StructureDefinition-sdc-questionnaire.html) profile includes several mustSupport extensions with a data type of `Expression`.
For the purposes of this guide, expressions **SHALL* be expressed in FHIRPath.  Form fillers **SHALL** support any valid FHIRPath 2.0.0 expression.

### QuestionnaireResponse narrative
When a QuestionnaireResponse is completed, form fillers **SHALL** generate the narrative using any provided FHIR Liquid template pointed to by the []()

### Additional rendering expectations
The following rendering rules apply to conformant Form Filler systems:

#### Radio Buttons
Radio buttons **SHALL* be rendered as individual buttons, where the 'selected' button is highlighted as depressed.

TODO: Show images of what rendering is acceptable.

TODO: Add additional rendering expectations