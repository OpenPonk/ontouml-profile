initialization
initializeSharedGeneralizations
	sharedGeneralizations at: #Meronymic put: (OntoUMLMeronymic newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #SubCollectionOf put: self.