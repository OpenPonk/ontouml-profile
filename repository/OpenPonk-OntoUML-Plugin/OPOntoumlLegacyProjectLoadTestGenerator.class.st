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
