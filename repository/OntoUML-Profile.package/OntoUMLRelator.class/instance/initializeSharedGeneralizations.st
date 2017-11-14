initialization
initializeSharedGeneralizations
	sharedGeneralizations at: #Moment put: (OntoUMLMoment newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Relator put: self.