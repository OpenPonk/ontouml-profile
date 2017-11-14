initialization
initializeSharedGeneralizations
	sharedGeneralizations at: #Formal put: (OntoUMLFormal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #DomainFormal put: self.