initialization
initializeSharedGeneralizations
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #MixinClass put: (OntoUMLMixinClass newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NonRigidMixin put: (OntoUMLNonRigidMixin newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #SemiRigidMixin put: (OntoUMLSemiRigidMixin newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Mixin put: self.