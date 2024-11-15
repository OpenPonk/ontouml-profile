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
			with: [ spec repository: 'github://openponk/class-editor:v4.1.x' ].
		spec package: 'OpenPonk-OntoUML-Profile'.
		spec
			package: 'OpenPonk-OntoUML-Plugin'
			with: [ spec requires: #( 'OpenPonk-OntoUML-Profile' ) ].
		spec group: 'plugin' with: #( 'OpenPonk-OntoUML-Plugin' ).
		spec group: 'default' with: #( OpenPonkClassEditor plugin ) ]
]
