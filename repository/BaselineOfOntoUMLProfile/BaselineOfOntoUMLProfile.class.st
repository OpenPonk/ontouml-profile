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
				with: [ spec repository: 'github://openponk/class-editor:v2.1.x/repository' ].
			spec package: 'OntoUML-Profile'.
			spec group: 'plugin' with: #('OntoUML-Profile').
			spec group: 'default' with: #(ClassEditor plugin) ]
]
