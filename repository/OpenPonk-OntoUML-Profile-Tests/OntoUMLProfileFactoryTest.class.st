"
Unit tests verifying OntoUML profile factory metadata and package registration consistency.
"
Class {
	#name : 'OntoUMLProfileFactoryTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-OntoUML-Profile-Tests-Model',
	#package : 'OpenPonk-OntoUML-Profile-Tests',
	#tag : 'Model'
}

{ #category : 'tests' }
OntoUMLProfileFactoryTest >> testCachedProfileMatchesOwningPackage [

	| profile |
	OntoUMLProfileFactory reset.
	[
		profile := OntoUMLProfileFactory profile.
		self assert: profile implementationPackage equals: OntoUMLProfileFactory packageName asString.
		self assert: profile implementationPrefix equals: 'OntoUML'.
		self denyEmpty: profile ownedStereotype ] ensure: [ OntoUMLProfileFactory reset ]
]

{ #category : 'tests' }
OntoUMLProfileFactoryTest >> testProfilePackageMatchesOwningPackage [

	| profile |
	profile := OntoUMLProfileFactory new profilePackage.
	self assert: profile implementationPackage equals: OntoUMLProfileFactory packageName asString.
	self assert: profile implementationPrefix equals: 'OntoUML'
]
