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
				baseline: 'ClassEditor'
				with: [ spec repository: 'github://openponk/ontouml-profile/repository' ].
			spec
				package: 'OntoUML-Profile'
				with: [ spec requires: #(ClassEditor) ].
			spec group: 'plugin' with: #('OntoUML-Profile').
			spec group: 'default' with: #(ClassEditor plugin) ]
]
