Profile: OntarioSDCQuestionnaire
Parent: Questionnaire
Id: sdc-questionnaire
Title: "Ontario SDC Questionnaire profile"
Description: "Defines additional the Questionnaire requirements to align with used capabilities of the legacy Ontario form tool."
* ^status = #active
* . ^short = "Ontario SDC Questionnaire profile"
* . ^definition = "Defines additional the Questionnaire requirements to align with used capabilities of the legacy Ontario form tool."
//* obeys sdc-rend-2
//* modifierExtension contains RenderingCriticalExtension named rendering-criticalExtension 0..* MS
* extension contains
  $versionAlgorithm named versionAlgorithm 1..1 MS and
  $entryMode named entryMode 1..1 MS and
  $assembledFrom named assembledFrom 0..* and
  $launchContext named launchContext 0..1 MS and
  $variable named variable 0..* MS and
  $definitionExtract named definitionExtract 0..* MS and
  $definitionExtractValue named definitionExtractValue 0..* MS and
  $extractAllocateId named extractAllocateId 0..* MS and
  ResponseRenderingLiquid named responseRenderingLiquid 0..1 MS
* extension[versionAlgorithm]
  * valueCoding = $version-algorithm#semver
* extension[entryMode]
  * valueCode = $entry-mode#random
* extension[assembledFrom]
  * ^requirements = "Indicates what common sources the items in this were drawn from.  Used for maintenance purposes, but not relevant in the rendering of the Questionnaire."
* extension[launchContext]
  * ^requirements = "Needed to support population and logic based on patient age, gender, etc."
  * extension[name].valueCoding from ONLaunchContexts
    * insert minimum(ONLaunchContexts)
  * extension[type].valueCode from ONLaunchContextResources
    * insert minimum(ONLaunchContextResources)
* extension[variable]
  * ^requirements = "Allows capturing answers or totals for use in other logic"
  * valueExpression MS
    * language MS  // TODO: Constrain this to exclude CQL?
    * expression 1..1 MS
* extension[definitionExtract]
  * ^requirements = "Enables definition-based extraction of captured data from the Questionnaire"
  * extension[definition] MS
    * valueCanonical MS
  * extension[fullUrl] MS
    * valueString MS
* extension[definitionExtractValue]
  * ^requirements = "Defines fixed values for use in the extraction process (e.g. LOINC codes and categories)"
  * extension[definition] MS
    * valueUri MS
  * extension[expression] MS
    * valueExpression MS
      * language = #text/fhirpath
      * expression 1..1 MS
  * extension[fixed-value] MS
* extension[extractAllocateId]
  * ^requirements = "Generates a random UUID that can be used for cross-linking extracted resources"
  * valueString MS
* extension[responseRenderingLiquid]
  * ^comment = "This may refer to a contained Library or a Library available from a FHIR server"
  * valueReference 1..1 MS
    * reference 1..1 MS
* contained 0..* MS
  * ^requirements = "Used for contained Binary instances for images and Library instances for Liquid rendering templates"
* url 1..1 MS
* version 1..1 MS
* title MS
  * extension contains
      ShortString named short-string 0..1 MS
* status = #active
* experimental 1..1 MS
  * ^requirements = "Used to differentiate Questionnaires defined for 'testing' purposes from those that are intended for actual use with patients"
* subjectType 1..1
* subjectType = #Patient
* date MS
* publisher MS
* description MS
  * extension contains
      ShortString named short-string 0..1 MS
* useContext
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "code"
  * ^slicing.rules = #closed
* useContext contains 
  focus 0..* MS and
  topic 0..* MS
* useContext[focus]
  * code = $context-type#focus
  * value[x] only CodeableConcept
  * valueCodeableConcept MS
  * valueCodeableConcept from ONQuestionnaireTopic (required)
    * insert minimum(ONQuestionnaireTopic)
    * text MS
* useContext[topic]
  * code = $context-type#topic
  * value[x] only CodeableConcept
  * valueCodeableConcept MS
    * text MS
* copyright MS
* approvalDate MS
* effectivePeriod MS
  * start MS
    * ^short = "When to start using form"
  * end MS
    * ^short = "When to stop using form"
* code MS
* item
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "type"
  * ^slicing.rules = #closed
* item contains
    group 0..* MS and
    display 0..* MS and
    question 0..* MS
  * extension contains
      $answerOptionsToggle named answerOptionsToggle 0..* MS and
      $enableWhenExpression named enableWhenExpression 0..1 MS and
      $questionnaire-hidden named hidden 0..1 MS and
      $rendering-style named renderStyle 0..1 MS and
      $definitionExtract named definitionExtract 0..* MS and
      $definitionExtractValue named definitionExtractValue 0..* MS and
      $extractAllocateId named extractAllocateId 0..* MS and
      $itemPopulationContext named itemPopulationContext 0..1 MS and
      $preferredTerminologyServer named preferredTerminologyServer 0..* MS and
      $variable named variable 0..* MS
  * extension[answerOptionsToggle]
    * extension[option] MS
      * value[x] MS
//      * value[x] only date or dateTime or decimal or integer or string or time or uri or Coding
    * extension[expression] MS
//      * valueExpression MS
//        * language = #text/fhirpath
//        * expression 1..1 MS
  * extension[hidden].valueBoolean MS
  * extension[renderStyle]
    * valueString MS
    * valueString from ONItemStyles
      * insert minimum(ONItemStyles)
  * extension[enableWhenExpression]
    * value[x] 1..1
    * value[x] only Expression
    * valueExpression MS
//      * language = #text/fhirpath
//      * expression 1..1 MS
  * extension[definitionExtract]
    * ^requirements = "Enables definition-based extraction of captured data from the Questionnaire"
    * extension[definition] MS
      * valueCanonical MS
    * extension[fullUrl] MS
      * valueString MS
  * extension[definitionExtractValue]
    * ^requirements = "Defines fixed values for use in the extraction process (e.g. LOINC codes and categories)"
    * extension[definition] MS
      * valueUri MS
    * extension[expression] MS
      * value[x] 1..1
      * value[x] only Expression
      * valueExpression MS
//        * language = #text/fhirpath
//        * expression 1..1 MS
    * extension[fixed-value] MS
  * extension[extractAllocateId]
    * ^requirements = "Generates a random UUID that can be used for cross-linking extracted resources"
    * valueString MS
  * extension[itemPopulationContext]
    * valueExpression MS
//        * language MS // TODO: Constrain to x-fhir-query or FHIRPath
//        * expression 1..1 MS
  * extension[preferredTerminologyServer]
    * valueUrl MS
  * extension[variable]
    * ^requirements = "Allows capturing answers or totals for use in other logic"
    * valueExpression MS
//      * language MS  // TODO: Constrain this to exclude CQL?
//      * expression 1..1 MS
  * linkId MS
  * definition MS
    * ^requirements = "Used to support definition-based extraction"
  * text 1..1 MS
    * extension contains
      $translation named translation 0..* MS and
      $rendering-style named renderStyle 0..1 MS and
      $rendering-xhtml named xhtml 0..1 MS
    * extension[translation] 0..* MS
      * extension[lang] MS
      * extension[content] MS
      * extension[content].value[x] only string
    * extension[renderStyle].valueString MS
    * extension[xhtml].valueString MS
  * enableWhen MS
    * question MS
    * operator MS
    * answer[x] MS
    * answer[x] only boolean or decimal or integer or date or dateTime or time or string or Coding
* item[display]
  * type = #display
* item[group]
  * extension contains
      $collapsible named collapsible 0..1 MS and
      $questionnaire-itemControl named itemControl 0..1 MS and
      $targetConstraint named targetConstraint 0..* MS and
      GroupNoteInfo named noteInfo 0..1
  * extension[collapsible].valueCode 1..1 MS
  * extension[itemControl].valueCodeableConcept from ONGroupItemControls (required)
    * insert minimum(ONGroupItemControls)
  * extension[targetConstraint]
    * extension[key] MS
    * extension[severity] MS
      * valueCode = #error
    * extension[expression] MS
    * extension[human] MS
  * extension[noteInfo]
    * insert CommonNoteDeclaration
    * extension[groupItems] MS
      * valueBoolean MS
  * type = #group
  * required MS
  * repeats MS
  * text 1..1 MS
    * extension[$translation] 0..* MS
      * extension[lang] MS
      * extension[content] MS
      * extension[content].value[x] only string
  * item MS
* item[question]
  * obeys onq-1 and onq-2 and onq-3 and onq-4 and onq-5 and onq-6 and onq-7
  * extension contains
      $calculatedExpression named calculatedExpression 0..1 MS and
      $initialExpression named initialExpression 0..1 MS and
      $minLength named minLength 0..1 MS and
      $maxSize named maxSize 0..1 MS and
      $mimeType named mimeType 0..* MS and
      $minValue named minValue 0..1 MS and
      $maxValue named maxValue 0..1 MS and
      $questionnaire-choiceOrientation named choiceOrientation 0..1 MS and
      $questionnaire-itemControl named itemControl 0..1 MS and
      $questionnaire-maxOccurs named maxOccurs 0..1 MS and
      $questionnaire-minOccurs named minOccurs 0..1 MS and
      $questionnaire-supportLink named supportLink 0..1 MS and
      $targetConstraint named targetConstraint 0..* MS and
      SameLine named sameLine 0..1 MS and
      QuestionNoteInfo named noteInfo 0..1 and
      ChoiceDiagram named choiceDiagram 0..1
  * extension[calculatedExpression].valueExpression MS
    * language = #text/fhirpath
    * expression 1..1 MS
  * extension[initialExpression].valueExpression MS
    * language = #text/fhirpath
    * expression 1..1 MS
  * extension[minLength]
    * ^condition = onq-1
  * extension[maxSize]
    * ^condition[+] = onq-2
    * ^condition[+] = onq-3
  * extension[mimeType]
    * ^condition[+] = onq-2
    * ^condition[+] = onq-3
    * valueCode from ONQuestionnaireMimeTypes
      * insert minimum(ONQuestionnaireMimeTypes)
  * extension[minValue]
    * ^condition[+] = onq-4
    * ^condition[+] = onq-5
    * value[x] only date or dateTime or decimal or integer or time
  * extension[maxValue]
    * ^condition[+] = onq-4
    * ^condition[+] = onq-5
    * value[x] only date or dateTime or decimal or integer or time
  * extension[choiceOrientation].valueCode MS
    * ^condition[+] = onq-6
  * extension[itemControl].valueCodeableConcept from ONQuestionItemControls (required)
    * insert minimum(ONQuestionItemControls)
    * ^condition[+] = onq-6
  * extension[maxOccurs]
    * ^condition[+] = onq-7
    * valueInteger MS
  * extension[minOccurs]
    * valueInteger MS
  * extension[supportLink].valueUri MS
    * extension contains UriLabel named uriLabel 0..1 MS
    * extension[uriLabel].valueString MS
  * extension[targetConstraint]
    * extension[key] MS
    * extension[severity] MS
      * valueCode = #error
    * extension[expression] MS
    * extension[human] MS
  * extension[sameLine].valueBoolean MS
  * extension[noteInfo]
    * insert CommonNoteDeclaration
    * extension[ownLine] MS
      * valueBoolean MS
    * extension[quoteAnswer] MS
      * valueBoolean MS
    * extension[negativeText] MS
      * valueString MS
    * extension[positiveText] MS
      * valueString MS
    * extension[negativeStyle] MS
      * valueString MS
//    * extension[studyColumnHeader] MS
//      * valueString MS
  * extension[choiceDiagram].valueUrl MS
  * type MS
  * type from ONGroupQuestionType (required)
    * insert minimum(ONGroupQuestionType)
  * repeats MS
  * required MS
  * readOnly MS
  * maxLength MS
  * answerValueSet MS
  * definition MS
  * answerOption MS
    * extension contains OptionNoteInfo named noteInfo 0..1 MS
    * extension[noteInfo]
      ^comment = "This information is used internally to generate the FHIR Liquid template.  It can be ignored by Form Fillers."
      * extension[text] MS
        * valueString MS
      * extension[style] MS
        * valueString MS
    * value[x] MS
    * value[x] only integer or date or time or string or Coding
    * valueCoding MS
      * extension contains $itemWeight named weight 0..1 MS
      * extension[weight].valueDecimal MS
      * system 1..1 MS
      * code 1..1 MS
      * display 1..1 MS
  * initial MS
    * value[x] MS
    * value[x] only boolean or decimal or integer or date or dateTime or time or string or uri or Coding

    * ^condition = onq-1 
    * ^condition[+] = onq-2 
    * ^condition[+] = onq-3 
    * ^condition[+] = onq-4 
    * ^condition[+] = onq-5 
    * ^condition[+] = onq-6 
    * ^condition[+] = onq-7 

Invariant: onq-1
Description: "minLength and maxLength are only allowed when type is string or text"
Severity: #error
Expression: "extension('http://hl7.org/fhir/StructureDefinition/minLength').exists() or maxLength.exists() implies type='string' or type='text'"

Invariant: onq-2
Description: "maxSize and mimeType are only permitted when type is 'attachment'"
Severity: #error
Expression: "extension('http://hl7.org/fhir/StructureDefinition/maxSize').exists() or extension('http://hl7.org/fhir/StructureDefinition/maxSize').exists() implies type='attachment'"

Invariant: onq-3
Description: "maxSize and mimeType SHOULD both be declared when type is 'attachment'"
Severity: #warning
Expression: "type='attachment' implies extension('http://hl7.org/fhir/StructureDefinition/maxSize').exists() and extension('http://hl7.org/fhir/StructureDefinition/maxSize').exists()"

Invariant: onq-4
Description: "minValue and maxValue are only permitted when type is date, dateTime, decimal, integer, or time"
Severity: #error
Expression: "extension('http://hl7.org/fhir/StructureDefinition/minValue').exists() or extension('http://hl7.org/fhir/StructureDefinition/maxValue').exists() implies type='date' or type='dateTime' or type='decimal' or type='integer' or type='time'"

Invariant: onq-5
Description: "minValue and maxValue SHOULD be specified when type is date, dateTime, decimal, or integer"
Severity: #warning
Expression: "type='date' or type='dateTime' or type='decimal' or type='integer' or type='time' implies extension('http://hl7.org/fhir/StructureDefinition/minValue').exists() and extension('http://hl7.org/fhir/StructureDefinition/maxValue').exists()"

Invariant: onq-6
Description: "choice orientation and item control are only permitted when there are options or a value set"
Severity: #error
Expression: "(extension('http://hl7.org/fhir/StructureDefinition/questionnaire-choiceOrientation').exists() or extension('http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl').exists()) implies (answerOption.exists() or answerValueSet.exists())"

Invariant: onq-7
Description: "minOccurs and maxOccurs are only permitted when repeats=true"
Severity: #error
Expression: "(extension('http://hl7.org/fhir/StructureDefinition/questionnaire-minOccurs').exists() or extension('http://hl7.org/fhir/StructureDefinition/questionnaire-maxOccurs').exists()) implies repeats"


Extension: ShortString
Id: core-short-string
Title: "Short Form String"
Description: "A shorter version of a string, typically intended for use on mobile displays."
* ^status = #active
* ^context.type = #element
* ^context.expression = "string"
* . 0..1
* . ^short = "Short-form of string"
* . ^definition = "A shorter version of a string, typically intended for use on mobile displays."
* url only uri
* value[x] only string

Extension: UriLabel
Id: core-uri-label
Title: "URI Label"
Description: "A human-readable label for a URI."
* ^status = #active
* ^context.type = #element
* ^context.expression = "uri"
* . 0..1
* . ^short = "URI Label"
* . ^definition = "A human-readable label for a URI."
* url only uri
* value[x] only string

Extension: SameLine
Id: sdc-same-line
Title: "Answer on Same Line"
Description: "If true, requires that the answer be on the same line as the question."
* ^status = #active
* ^context.type = #element
* ^context.expression = "Questionnaire.item"
* . 0..1
* . ^short = "Answer on same line?"
* . ^definition = "If true, requires that the answer be on the same line as the question."
* url only uri
* value[x] only boolean

Extension: ChoiceDiagram
Id: sdc-choice-diagram
Title: "Image for Choice Diagram"
Description: "A link to the SVG diagram that is used to render the choice options."
* ^status = #active
* ^context.type = #element
* ^context.expression = "Questionnaire.item"
* ^contextInvariant[+] = "extension('http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl').value.coding.exists(code='graphic-choice')"
* . 0..1
* . ^short = "Image for Choice Diagram?"
* . ^definition = "A link to the SVG diagram that is used to render the choice options."
* url only uri
* value[x] only url

Extension: ResponseRenderingLiquid
Id: sdc-responseRenderingLiquid
Title: "Response Rendering Liquid Template"
Description: "Points to a Library containing [FHIR Liquid](https://confluence.hl7.org/spaces/FHIR/pages/66938964/FHIR+Liquid+Profile) template that defines how the narrative for QuestionnaireResponses created for this Questionnaire should be generated. "
* ^status = #active
* ^context.type = #element
* ^context.expression = "Questionnaire"
* . 0..1
* . ^short = "Rendering library for responses"
* . ^definition = "Points to a Library containing [FHIR Liquid](https://confluence.hl7.org/spaces/FHIR/pages/66938964/FHIR+Liquid+Profile) template that defines how the narrative for QuestionnaireResponses created for this Questionnaire should be generated. "
* url only uri
* value[x] only Reference(Library)

Extension: OptionNoteInfo
Id: option-note-info
Title: "Option Note Info"
Description: "Parameters that will determine how notes generated from this QuestionnaireResponse will be generated"
* ^status = #active
* ^context.type = #element
* ^context.expression = "Questionnaire.item.answerOption"
* value[x] 0..0
* extension contains
  text 0..1 MS and
  style 0..1 MS
* extension[text]
  * ^short = "Note option text"
  * ^definition = "The text to display as the label for the option (if it's selected as an answer) in the 'note' produced from the completed QuestionnaireResponse"
  * value[x] 1..1
  * value[x] only string
* extension[style]
  * ^short = "Note option style/color"
  * ^definition = "Style (color) for this answer option when rendered in the 'note' produced from the completed QuestionnaireResponse"
  * value[x] 1..1
  * value[x] only string

Extension: GroupNoteInfo
Id: group-note-info
Title: "Group Note Info"
Description: "Parameters that will determine how notes generated from this QuestionnaireResponse will be generated"
* ^status = #active
* ^context.type = #element
* ^context.expression = "Questionnaire.item"
* value[x] 0..0
* insert CommonNoteInfo
* extension contains
  groupItems 0..1
* extension[groupItems]
  * ^short = "Group questions by answer"
  * ^definition = "Indicates that when rendering a group of questions with answers in the 'note' produced from the completed QuestionnaireResponse, all of the 'yes' answers will be listed before all of the 'no' answers"
  * value[x] 1..1
  * value[x] only boolean

Extension: QuestionNoteInfo
Id: question-note-info
Title: "Question Note Info"
Description: "Parameters that will determine how notes produced from this group in the QuestionnaireResponse will be generated"
* ^status = #active
* ^context.type = #element
* ^context.expression = "Questionnaire.item"
* value[x] 0..0
* insert CommonNoteInfo
* extension contains
  flagStyle 0..1 MS and
  ownLine 0..1 MS and
  quoteAnswer 0..1 MS and
  negativeText 0..1 and
  positiveText 0..1 and
  negativeStyle 0..1
//  studyColumnHeader 0..1 and
* extension[flagStyle]
  * ^short = "Flagged note item style/color"
  * ^definition = "Style (color) for this item when evaluated as 'flagged' and rendered in the 'note' produced from the completed QuestionnaireResponse"
  * value[x] 1..1
  * value[x] only string
  * value[x] from ONNoteFlagStyles
* extension[ownLine]
  * ^short = "Heading and response on same line?"
  * ^definition = "When rendering this item, if 'true', indicates that the answer(s) should appear on the same line as the heading/question, otherwise they'll appear on the following line"
  * value[x] 1..1
  * value[x] only boolean
* extension[quoteAnswer]
  * ^short = "Put quotes around answers?"
  * ^definition = "If true, will surround the answer(s) for the item when rendering them in the 'note' produced from the completed QuestionnaireResponse"
  * value[x] 1..1
  * value[x] only boolean
* extension[negativeText]
  * ^short = "Text for negative points"
  * ^definition = "When rendering the question in the 'note' produced from the completed QuestionnaireResponse, indicates the text to display for 'false', negative-point, or omitted answers"
  * value[x] 1..1
  * value[x] only string
* extension[positiveText]
  * ^short = "Text for negative points"
  * ^definition = "When rendering the question in the 'note' produced from the completed QuestionnaireResponse, indicates the text to display for 'true' or positive-point answers"
  * value[x] 1..1
  * value[x] only string
* extension[negativeStyle]
  * ^short = "Negative note item style/color"
  * ^definition = "When rendering the question in the 'note' produced from the completed QuestionnaireResponse, indicates the text to display for 'false', negative-point, or omitted answers"
  * value[x] 1..1
  * value[x] only string
//* extension[studyColumnHeader]
//  * ^short = "???"
//  * ^definition = "TODO: What is this for??"
//  * value[x] 1..1
//  * value[x] only string

RuleSet: minimum(valueset) 
* ^binding.extension.url = $additional-binding
* ^binding.extension.extension[0].url = "key"
* ^binding.extension.extension[=].valueId = "min"
* ^binding.extension.extension[+].url = "purpose"
* ^binding.extension.extension[=].valueCode = #minimum
* ^binding.extension.extension[+].url = "valueSet"
* ^binding.extension.extension[=].valueCanonical = Canonical({valueset})

RuleSet: CommonNoteDeclaration
* ^comment = "This information is used internally to generate the FHIR Liquid template.  It can be ignored by Form Fillers."
* extension[enableWhenExpression] MS
  * value[x] 1..1
  * value[x] only Expression
  * valueExpression MS
    * language MS  // TODO: What should this be?
    * expression 1..1 MS
* extension[sortIndex] MS
  * valuePositiveInt MS
* extension[text] MS
  * valueString MS
* extension[style] MS
  * valueString MS

RuleSet: CommonNoteInfo
* extension contains
  enableWhenExpression 0..1 MS and
  sortIndex 0..1 and
  text 0..1 MS and
  listSeparator 0..1 and
  lastSeparator 0..1 and
  style 0..1 MS
* extension[enableWhenExpression]
  * ^short = "Conditions for displaying in note"
  * ^definition = "Script content that controls whether this item should appear in the 'note' produced from the completed QuestionnaireResponse"
  * value[x] 1..1
  * value[x] only Expression
* extension[sortIndex]
  * ^short = "Order to appear in note"
  * ^definition = "A sequence number indicating the relative order this item should be rendered within the containing item when creating the 'note' produced from the completed QuestionnaireResponse"
  * value[x] 1..1
  * value[x] only positiveInt
* extension[text]
  * ^short = "Note item text"
  * ^definition = "The text to display as the label for the item in the 'note' produced from the completed QuestionnaireResponse"
  * ^comment = "The text MAY have a $$ present in it.  If so, the answer is substituted for the $$.  Otherwise, the answer will appear following the specified text."
  * value[x] 1..1
  * value[x] only string
* extension[listSeparator]
  * ^short = "Separator between answers"
  * ^definition = "Indicates the text to place between answers if there are more than one (e.g. '; ', ', ' etc.) in the 'note' produced from the completed QuestionnaireResponse"
  * value[x] 1..1
  * value[x] only string
* extension[lastSeparator]
  * ^short = "Separator before final answer"
  * ^definition = "Indicates the text to place before the final answer in a list of answers if there is more than one (e.g. '; or ',  ', and ' etc.) in the 'note' produced from the completed QuestionnaireResponse"
  * value[x] 1..1
  * value[x] only string
* extension[style]
  * ^short = "Note item style"
  * ^definition = "Style for this item when rendered in the 'note' produced from the completed QuestionnaireResponse"
  * value[x] 1..1
  * value[x] only string
  * value[x] from ONNoteStyles

ValueSet: ONLaunchContexts
Id: launch-contexts
Title: "Launch Contexts for Ontario Questionnaires"
Description: "Launch context codes allowed for use in Ontario e-referral and other Questionnaires"
* ^status = #active
* ^immutable = false
* ^experimental = false
* $launchContextCodes#patient
* $launchContextCodes#user

ValueSet: ONLaunchContextResources
Id: launch-context-resources
Title: "Launch Context Resources for Ontario Questionnaires"
Description: "Resources allowed to be passed as launch contexts allowed for use in Ontario e-referral and other Questionnaires"
* ^status = #active
* ^immutable = false
* ^experimental = false
* $resource-types#Patient
* $resource-types#PractitionerRole

ValueSet: ONQuestionnaireTopic
Id: topic-codes
Title: "Topic Codes for Ontario Questionnaires"
Description: "Codes used to categorize the focal topic(s) for Ontario e-referral and other Questionnaires"
* ^status = #active
* ^immutable = false
* ^experimental = false
* $snomed#3457005 "Referral"
* $snomed#419192003 "Internal medicine"
* $snomed#394805004 "Clinical immunology/allergy"
* $snomed#419772000 "Family medicine"
* $snomed#394589003 "Nephrology"
* $snomed#394537008 "Pediatrics"
* $snomed#394587001 "Psychiatry"

ValueSet: ONQuestionnaireMimeTypes
Id: mime-types
Title: "Mime Types of Ontario Questionnaires"
Description: "Codes allowed for attachments in Ontario e-referral and other Questionnaires"
* ^status = #active
* ^immutable = false
* ^experimental = false
/*
 * Original code list was from Ontario sample form
 * Non-commented codes are those that were supported by at least one of the three MRS vendors
 */
//* $mimeCodes#application/dicom
* $mimeCodes#application/msword
//* $mimeCodes#application/octet-stream
* $mimeCodes#application/pdf
//* $mimeCodes#application/rtf
//* $mimeCodes#application/vnd.lotus-1-2-3
* $mimeCodes#application/vnd.ms-excel
//* $mimeCodes#application/vnd.ms-powerpoint
//* $mimeCodes#application/vnd.ms-works
//* $mimeCodes#application/vnd.ms-xpsdocument
//* $mimeCodes#application/vnd.openxmlformats-officedocument.presentationml.presentation
//* $mimeCodes#application/vnd.openxmlformats-officedocument.presentationml.slideshow
* $mimeCodes#application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
* $mimeCodes#application/vnd.openxmlformats-officedocument.wordprocessingml.document
//* $mimeCodes#application/vnd.wordperfect
* $mimeCodes#audio/mp4
* $mimeCodes#audio/mpeg
//* $mimeCodes#audio/ogg
//* $mimeCodes#audio/wav
//* $mimeCodes#audio/x-ms-wma
* $mimeCodes#image/bmp
* $mimeCodes#image/gif
* $mimeCodes#image/jpeg
* $mimeCodes#image/pjpeg
* $mimeCodes#image/png
* $mimeCodes#image/svg+xml
* $mimeCodes#image/tiff
//* $mimeCodes#image/x-adobe-dng
* $mimeCodes#text/csv
* $mimeCodes#text/plain
//* $mimeCodes#video/3gpp
//* $mimeCodes#video/3gpp2
* $mimeCodes#video/mp4
//* $mimeCodes#video/mpeg
//* $mimeCodes#video/ogg
//* $mimeCodes#video/quicktime
//* $mimeCodes#video/x-flv
//* $mimeCodes#video/x-ms-wmv
//* $mimeCodes#video/x-msvideo


ValueSet: ONGroupItemControls
Id: group-item-control
Title: "Ontario Group Item Control Codes"
Description: "Item control codes used in group items within Ontario questionnaires"
* ^status = #active
* ^immutable = false
* ^experimental = false
* $questionnaire-item-control#list
* $questionnaire-item-control#page
* $questionnaire-item-control#footer

ValueSet: ONQuestionItemControls
Id: question-item-control
Title: "Ontario Question Item Control Codes"
Description: "Item control codes used in question items within Ontario questionnaires"
* ^status = #active
* ^immutable = false
* ^experimental = false
* $questionnaire-item-control#check-box
* $questionnaire-item-control#drop-down
* $questionnaire-item-control#radio-button
* ONItemControls#graphic-choice

ValueSet: ONGroupQuestionType
Id: question-item-type
Title: "Ontario Question Item Type Codes"
Description: "Item types allowed for use in question items in Ontario e-referral and other Questionnaires"
* ^status = #active
* ^immutable = false
* ^experimental = false
* $item-type#attachment
* $item-type#boolean
* $item-type#choice
* $item-type#date
* $item-type#dateTime
* $item-type#decimal
* $item-type#integer
* $item-type#string
* $item-type#time
* $item-type#text
* $item-type#url

CodeSystem: ONItemControls
Id: on-item-controls
Title: "Ontario Item Control Codes"
Description: "Additional Questionnaire item control codes above and beyond those defined in the core extension"
* ^status = #active
* ^experimental = false
* ^caseSensitive = false
* #graphic-choice "Graphic Choice" "Indicates that the options for a choice question are presented as a clickable SVG diagram where clicking on diagram regions with an id that corresponds to a code within the choice"

CodeSystem: ONCssStyles
Id: on-css-styles
Title: "Ontario Questionnaire CSS Styles"
Description: "CSS styles used in various elements within the Questionnaire"
* ^status = #active
* ^experimental = false
* ^caseSensitive = false
* #color:red;text-decoration:underline; "Red, Underline"
* #color:red; "Red"
* #color:orange; "Orange"
* #color:yellow; "Yellow"
* #color:green; "Green"
* #color:blue; "Blue"
* #color:purple; "Purple"
* #font-weight:bold; "Bold"
* #font-decoration:underline; "Underline"
* #font-weight:bold;font-decoration:underline; "Bold, Underline"
* #font-style:italic; "Italic"
* #background-color:grey; "Grey background"
* #background-color:white; "White background"
* #border-style:solid; "Black border"
* #background-color:grey;border-style:solid; "Grey background, black border"
* #background-color:white;border-style:solid; "White background, black border"


ValueSet: ONNoteFlagStyles
Id: note-flag-styles
Title: "Ontario Note Flag Styles"
Description: "Styles when rendering note content that is 'flagged'"
* ^status = #active
* ^immutable = false
* ^experimental = false
* ONCssStyles#color:red;text-decoration:underline;
* ONCssStyles#color:red;
* ONCssStyles#color:orange;
* ONCssStyles#color:yellow;
* ONCssStyles#color:green;
* ONCssStyles#color:blue;
* ONCssStyles#color:purple;

ValueSet: ONNoteStyles
Id: note-styles
Title: "Ontario Note Text Styles"
Description: "Styles when rendering note content"
* ^status = #active
* ^immutable = false
* ^experimental = false
* ONCssStyles#font-weight:bold;
* ONCssStyles#font-decoration:underline;
* ONCssStyles#font-weight:bold;font-decoration:underline;
* ONCssStyles#font-style:italic;

ValueSet: ONItemStyles
Id: item-styles
Title: "Ontario Questionnaire Item Styles"
Description: "Styles when rendering groups or questions"
* ^status = #active
* ^immutable = false
* ^experimental = false
* ONCssStyles#background-color:grey;
* ONCssStyles#background-color:white;
* ONCssStyles#border-style:solid;
* ONCssStyles#background-color:grey;border-style:solid;
* ONCssStyles#background-color:white;border-style:solid;

Mapping:  SDCToLegacy
Source:   OntarioSDCQuestionnaire
Target:   "https:ontariohealth.ca/legacy-forms-library"
Id:       ontario-fhir-legacy
Title:    "Ontario Legacy Forms"
* -> "eform"
* url -> "eform/@ref" "Will need to place a URI root on the front of the ref to make it a proper URI"
* version -> "eform/@revision"
* title -> "eform/@title"
* title.extension[short-string] -> "eform/@shortForm"
* description -> "eform/description"
* description.extension[short-string] -> "eform/tagline"
* useContext[focus].valueCodeableConcept.text -> "eform/keywords" "Each keyword will be a separate useContext repetition"
* useContext[focus].valueCodeableConcept.coding.code -> "eform/tags/tag"
* item -> "eform/mainSection, section, item" "Will often not be mapped.  Only needed if root section has a title or rendering expectations"
  * extension[renderStyle] -> "hints" "for color and border-based hints ('GREY_BG', 'WHITE_BG', 'BORDER')"
    * valueString -> "hint" "Converted to styles and concatenated together"
  * extension[enableWhenExpression].valueExpression -> "@showIf" "For complex expressions that can't be expressed with enableWhen repetitions or hidden"
  * extension[hidden].valueBoolean -> "@showIf, @showIf" "If fixed to 'false'"
  * linkId -> "@ref"
  * text -> "c"
    * extension[translation] -> "/eform/stringTranslations/str[current().contains(@ref)]"
      * extension[lang].valueCode -> "@locale"
      * extension[content].valueString -> "text()"
    * extension[renderStyle].valueString -> "eFormSection/@headerStyle"
    * extension[xhtml].valueString -> "items/picture, refs/ref" "For picture: <img src='@fileRef' height='@height' width='@width'/>.  For ref: text followed by <a href=''></a> for ref (must be in 'footer' group)"
  * enableWhen -> "@showIf" "For simple expressions (comparisons with answer values or answer exists, separated by all && or all ||)"
* item[group]
  * extension[targetConstraint] -> "validator" "If not handled with required or other element/extension"
    * extension[expression] -> "@validIf" "Convert to FHIRPath (or CQL?)"
    * extension[human] -> "@message"
  * extension[noteInfo]
    * extension[enableWhenExpression].valueExpression.expression -> "@makeNoteIf"
    * extension[sortIndex].valuePositiveInt -> "@noteIndex"
    * extension[text].valueString -> "cNote"
    * extension[style].valueString -> "@flag"
    * extension[groupItems].valueBoolean -> "groupItems"
    * extension[listSeparator].valueString -> "listSep"
    * extension[lastSeparator].valueString -> "lastSep"
  * item -> "items/*"
  * required -> "validator/@allowEmpty=false, or validator/@type='MANDATORY'"
* item[question]
  * extension[itemControl].valueCodeableConcept -> "hints/hint[.='USE_BUTTONS_FOR_MENU']" "Maps to radio-button"
  * extension[sameLine].valueBoolean -> "hints/hint[.='SAME_LINE']"
  * extension[choiceOrientation].valueCode -> "hints/hint[.='VERTICAL_STACKING']" "When code is 'vertical'"
  * extension[supportLink] -> "hyperlink"
    * valueUri -> "hyperlink/@url"
      * extension[uriLabel].valueString -> "hyperlink/@text"
  * extension[calculatedExpression].valueExpression.expression -> "@formula" "Will need to convert to FHIRPath"
  * extension[initialExpression].valueExpression.expression -> "text" "When an expression with @ or ="
  * extension[targetConstraint] -> "validator" "If not handled with required or other element/extension"
    * extension[expression] -> "@validIf" "Convert to FHIRPath (or CQL?)"
    * extension[human] -> "@message"
  * extension[noteInfo]
    * extension[text].valueString -> "@cNote"
    * extension[style].valueString -> "@flag"
    * extension[enableWhenExpression].valueExpression.expression -> "@makeNoteIf"
    * extension[ownLine].valueBoolean -> "@ownLine"
    * extension[quoteAnswer].valueBoolean -> "@quoteAnswer"
    * extension[negativeText].valueString -> "negNote"
    * extension[positiveText].valueString -> "posNote"
    * extension[negativeStyle].valueString -> "@negFlag"
//    * extension[studyColumnHeader].valueString -> "studyColumnHeader"
    * extension[listSeparator].valueString -> "listSep"
    * extension[lastSeparator].valueString -> "lastSep"
  * type -> "@type" "See mapping spreadsheet"
  * definition -> "@emrField" "These will need to be turned into data element URIs or mapped to standard FHIR element URIs"
  * repeats -> "@type" "True if CHECKBOX or MENU_MULTI_SELECT"
  * required -> "validator/@allowEmpty=false, or validator/@type='MANDATORY'"
  * readOnly -> "@type" "True if LABEL or FORMULA"
  * maxLength -> "validatior/@validIf" "For foo.r.length <= NUM patterns"
  * answerOption -> "choices/choice"
    * extension[noteInfo]
      * extension[text].valueString -> "note"
      * extension[style].valueString -> "@flag"
    * valueCoding
      * extension[weight].valueDecimal -> "@points"
      * code -> "@val"
      * display -> "display"
  * initial.value[x] -> "text" "When just a constant"