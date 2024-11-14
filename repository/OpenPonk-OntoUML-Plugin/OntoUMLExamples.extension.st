Extension { #name : 'OntoUMLExamples' }

{ #category : '*OpenPonk-OntoUML-Plugin' }
OntoUMLExamples class >> openExample: aModel [

	| project |
	project := OPProject named: 'OntoUML Example'.
	project addModel: aModel.
	^ (OPWorkbench openProject: project) showAllElementsInAllDiagrams
]

{ #category : '*OpenPonk-OntoUML-Plugin' }
OntoUMLExamples class >> openExampleEmptyModel [

	<example>
	^ OPProject openOnModel: self emptyModel
]

{ #category : '*OpenPonk-OntoUML-Plugin' }
OntoUMLExamples class >> openExampleRoleMixinPattern1 [

	<example>
	^ self openExample: self new roleMixinPattern1
]

{ #category : '*OpenPonk-OntoUML-Plugin' }
OntoUMLExamples class >> openExampleSubQuantityContainment [

	<example>
	^ self openExample: self exampleSubQuantityContainment
]
