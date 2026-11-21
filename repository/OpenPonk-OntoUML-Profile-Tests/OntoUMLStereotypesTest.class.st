"
Verifies instantiation, metaclass resolution, base element accessors, and modal property roundtrips across OntoUML stereotypes.
"
Class {
	#name : 'OntoUMLStereotypesTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-OntoUML-Profile-Tests-Model',
	#package : 'OpenPonk-OntoUML-Profile-Tests',
	#tag : 'Model'
}

{ #category : 'tests' }
OntoUMLStereotypesTest >> testAllStereotypesInstantiateAndResolveMetaClass [

	| stereotypeClasses |
	stereotypeClasses := OntoUMLElement allSubclasses sorted: [ :first :second | first name <= second name ].
	self denyEmpty: stereotypeClasses.
	stereotypeClasses do: [ :stereotypeClass |
			| stereotype metaClass |
			stereotype := stereotypeClass new.
			metaClass := stereotype umlMetaClass.
			self assert: metaClass name equals: stereotype umlClassName.
			((stereotype oclIsKindOf: #Object) or: [ stereotype oclIsKindOf: #Moment ])
				ifTrue: [
						| umlClass |
						umlClass := OPUMLClass new name: stereotype umlClassName.
						stereotype base_Class: umlClass.
						self assert: stereotype base_Class identicalTo: umlClass ]
				ifFalse: [
						| umlAssociation |
						umlAssociation := OPUMLAssociation new name: stereotype umlClassName.
						stereotype base_Association: umlAssociation.
						self assert: stereotype base_Association identicalTo: umlAssociation ] ]
]

{ #category : 'tests' }
OntoUMLStereotypesTest >> testMeronymicStereotypesModalPropertiesRoundtrip [

	| meronymicClasses |
	meronymicClasses := {
		                    OntoUMLComponentOf.
		                    OntoUMLMemberOf.
		                    OntoUMLSubCollectionOf.
		                    OntoUMLSubQuantityOf }.
	meronymicClasses do: [ :stereotypeClass |
			| stereotype |
			stereotype := stereotypeClass new.
			self deny: stereotype essential description: 'Default essential must be false'.
			self deny: stereotype inseparable description: 'Default inseparable must be false'.
			self deny: stereotype immutablePart description: 'Default immutablePart must be false'.
			self deny: stereotype immutableWhole description: 'Default immutableWhole must be false'.

			stereotype essential: true.
			stereotype inseparable: true.
			stereotype immutablePart: true.
			stereotype immutableWhole: true.
			self assert: stereotype essential description: 'essential must be true after setting'.
			self assert: stereotype inseparable description: 'inseparable must be true after setting'.
			self assert: stereotype immutablePart description: 'immutablePart must be true after setting'.
			self assert: stereotype immutableWhole description: 'immutableWhole must be true after setting'.

			stereotype essential: false.
			stereotype inseparable: false.
			stereotype immutablePart: false.
			stereotype immutableWhole: false.
			self deny: stereotype essential description: 'essential must return to false'.
			self deny: stereotype inseparable description: 'inseparable must return to false'.
			self deny: stereotype immutablePart description: 'immutablePart must return to false'.
			self deny: stereotype immutableWhole description: 'immutableWhole must return to false' ]
]
