"
Baseline for https://github.com/OpenPonk/ontouml-profile
"
Class {
	#name : 'BaselineOfOpenPonkOntoUMLProfile',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfOpenPonkOntoUMLProfile',
	#package : 'BaselineOfOpenPonkOntoUMLProfile'
}

{ #category : 'baselines' }
BaselineOfOpenPonkOntoUMLProfile >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			baseline: 'OpenPonkClassEditor'
			with: [ spec repository: 'github://OpenPonk/class-editor' ].
		spec package: 'OpenPonk-OntoUML-Profile'.
		spec
			package: 'OpenPonk-OntoUML-Profile-Tests'
			with: [ spec requires: #( 'OpenPonk-OntoUML-Profile' ) ].
		spec
			package: 'OpenPonk-OntoUML-Plugin'
			with: [ spec requires: #( 'OpenPonk-OntoUML-Profile' ) ].
		spec
			package: 'OpenPonk-OntoUML-Plugin-Tests'
			with: [ spec requires: #( 'OpenPonk-OntoUML-Plugin' ) ].
		spec group: 'plugin' with: #( 'OpenPonk-OntoUML-Plugin' 'OpenPonk-OntoUML-Profile-Tests' 'OpenPonk-OntoUML-Plugin-Tests' ).
		spec group: 'default' with: #( OpenPonkClassEditor plugin ) ]
]
