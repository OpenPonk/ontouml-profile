"
I am a testing utility responsible for generating backward-compatibility test payloads specifically for legacy OntoUML projects.
"
Class {
	#name : 'OPOntoumlLegacyProjectLoadTestGenerator',
	#superclass : 'OPLegacyProjectLoadTestGenerator',
	#category : 'OpenPonk-OntoUML-Plugin-Tests-Plugin',
	#package : 'OpenPonk-OntoUML-Plugin-Tests',
	#tag : 'Plugin'
}

{ #category : 'hooks' }
OPOntoumlLegacyProjectLoadTestGenerator >> model [

	^ OntoUMLExamples exampleAlcohol
]
