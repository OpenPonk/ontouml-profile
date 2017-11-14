initialization
initializeSharedGeneralizations
	sharedGeneralizations at: #Moment put: (OntoUMLMoment newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #IntrinsicMoment put: (OntoUMLIntrinsicMoment newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Quality put: self.