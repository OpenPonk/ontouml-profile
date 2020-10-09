"
Baseline for https://github.com/OpenPonk/ontouml-profile
"
Class {
	#name : #BaselineOfOntoUMLProfile,
	#superclass : #BaselineOf,
	#category : #BaselineOfOntoUMLProfile
}

{ #category : #baselines }
BaselineOfOntoUMLProfile >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'UMLProfiles'
				with: [ spec repository: 'github://openponk/uml-profiles:v2.0.0/repository' ].
			spec package: 'OntoUML-Profile' with: [ spec requires: #('UMLProfiles') ].
			spec group: 'default' with: #('OntoUML-Profile') ]
]
