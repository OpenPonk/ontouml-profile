initialization
initializeSharedGeneralizations
	sharedGeneralizations at: #Meronymic put: (OntoUMLMeronymic newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ComponentOf put: self.