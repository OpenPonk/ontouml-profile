"
I am a testing utility responsible for generating backward-compatibility test payloads specifically for legacy OntoUML projects.
"
Class {
	#name : 'OPOntoumlLegacyProjectLoadTestGenerator',
	#superclass : 'OPLegacyProjectLoadTestGenerator',
	#category : 'OpenPonk-OntoUML-Plugin-Tests',
	#package : 'OpenPonk-OntoUML-Plugin',
	#tag : 'Tests'
}

{ #category : 'hooks' }
OPOntoumlLegacyProjectLoadTestGenerator >> model [

	^ OntoUMLExamples exampleSubQuantityContainment
]
