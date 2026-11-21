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
OntoUMLProfileFactoryTest >> testCreateProfileCachesPerFactoryInstance [

	| factory firstProfile secondProfile |
	factory := OntoUMLProfileFactory new.
	firstProfile := factory createProfile.
	secondProfile := factory createProfile.
	self assert: firstProfile identicalTo: secondProfile.
	self assert: firstProfile name equals: 'OntoUML'
]

{ #category : 'tests' }
OntoUMLProfileFactoryTest >> testIsAppliedTo [

	| editor diagramController umlPackage umlProfile otherProfile |
	self deny: (OntoUMLProfileFactory isAppliedTo: nil) description: 'Nil editor must not have OntoUML profile applied'.

	editor := Mock new.
	editor stub plugin willReturn: Object new.
	self
		deny: (OntoUMLProfileFactory isAppliedTo: editor)
		description: 'Editor with non-UML plugin must not have OntoUML profile applied'.

	editor := Mock new.
	editor stub plugin willReturn: OPUmlClassEditorPlugin new.
	editor stub diagramController willReturn: nil.
	self
		deny: (OntoUMLProfileFactory isAppliedTo: editor)
		description: 'Editor without diagram controller must not have OntoUML profile applied'.

	diagramController := Mock new.
	diagramController stub model willReturn: nil.
	editor := Mock new.
	editor stub plugin willReturn: OPUmlClassEditorPlugin new.
	editor stub diagramController willReturn: diagramController.
	self deny: (OntoUMLProfileFactory isAppliedTo: editor) description: 'Editor with nil model must not have OntoUML profile applied'.

	diagramController := Mock new.
	diagramController stub model willReturn: OPUMLClass new.
	editor := Mock new.
	editor stub plugin willReturn: OPUmlClassEditorPlugin new.
	editor stub diagramController willReturn: diagramController.
	self
		deny: (OntoUMLProfileFactory isAppliedTo: editor)
		description: 'Non-package UML element must not have OntoUML profile applied'.

	umlPackage := OPUMLPackage new name: 'PlainPackage'.
	otherProfile := OPUMLProfile new name: 'OtherProfile'.
	umlPackage profileApplications add: (OPUMLProfileApplication new appliedProfile: nil).
	umlPackage profileApplications add: (OPUMLProfileApplication new appliedProfile: otherProfile).
	diagramController := Mock new.
	diagramController stub model willReturn: umlPackage.
	editor := Mock new.
	editor stub plugin willReturn: OPUmlClassEditorPlugin new.
	editor stub diagramController willReturn: diagramController.
	self deny: (OntoUMLProfileFactory isAppliedTo: editor) description: 'UML package without OntoUML profile must return false'.

	umlPackage profileApplications add: (OPUMLProfileApplication new appliedProfile: OntoUMLProfileFactory profile).
	self assert: (OntoUMLProfileFactory isAppliedTo: editor) description: 'UML package with OntoUML profile must return true'.

	umlProfile := OPUMLProfile new name: 'DerivedProfile'.
	umlProfile profileApplications add: (OPUMLProfileApplication new appliedProfile: OntoUMLProfileFactory profile).
	diagramController := Mock new.
	diagramController stub model willReturn: umlProfile.
	editor := Mock new.
	editor stub plugin willReturn: OPUmlClassEditorPlugin new.
	editor stub diagramController willReturn: diagramController.
	self assert: (OntoUMLProfileFactory isAppliedTo: editor) description: 'UML profile with OntoUML profile applied must return true'
]

{ #category : 'tests' }
OntoUMLProfileFactoryTest >> testProfilePackageMatchesOwningPackage [

	| profile |
	profile := OntoUMLProfileFactory new profilePackage.
	self assert: profile implementationPackage equals: OntoUMLProfileFactory packageName asString.
	self assert: profile implementationPrefix equals: 'OntoUML'
]
