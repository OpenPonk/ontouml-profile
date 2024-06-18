"
Baseline for https://github.com/OpenPonk/ontouml-profile
"
Class {
	#name : 'BaselineOfOntoUMLProfile',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfOntoUMLProfile',
	#package : 'BaselineOfOntoUMLProfile'
}

{ #category : 'baselines' }
BaselineOfOntoUMLProfile >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			baseline: 'ClassEditor'
			with: [ spec repository: 'github://openponk/class-editor' ].
		spec package: 'OntoUML-Profile'.
		spec
			package: 'OntoUML-OpenPonk'
			with: [ spec requires: #( 'OntoUML-Profile' ) ].
		spec group: 'plugin' with: #( 'OntoUML-OpenPonk' ).
		spec group: 'default' with: #( ClassEditor plugin ) ]
]
