accessing
profile
	<gtExample>
	| profile hierarchy |
	profile := self profilePackage.
	profile packagedElements addAll: self formalPair.
	profile packagedElements addAll: self materialPair.
	profile packagedElements addAll: self meronymicPair.
	profile packagedElements addAll: self momentPair.
	profile packagedElements addAll: self objectPair.
	hierarchy := {#Object -> #(Sortal MixinClass).
	#Sortal -> #(RigidSortal AntiRigidSortal).
	#RigidSortal -> #(SubstanceSortal SubKind).
	#SubstanceSortal -> #(Kind Quantity Collective).
	#AntiRigidSortal -> #(Phase Role).
	#MixinClass -> #(NonRigidMixin RigidMixin).
	#NonRigidMixin -> #(AntiRigidMixin SemiRigidMixin).
	#AntiRigidMixin -> #(RoleMixin).
	#SemiRigidMixin -> #(Mixin).
	#RigidMixin -> #(Category).
	#Moment -> #(Relator IntrinsicMoment).
	#IntrinsicMoment -> #(Mode Quality)}
		,
			{#Formal -> #(BasicInternal DomainFormal).
			#BasicInternal -> #(Characterization Mediation Derivation Containment).
			#Meronymic -> #(ComponentOf MemberOf SubCollectionOf SubQuantityOf)}.
	hierarchy
		do: [ :pair | 
			| parent |
			parent := profile packagedElements detect: [ :each | each name = pair key ].
			parent isAbstract: true.
			pair value do: [ :each | profile packagedElements add: (self newStereotype: each subclassOf: parent) ] ].
	profile ownedStereotype do: [ :each | each profile: profile ].
	^ profile