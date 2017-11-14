initialization
initializeSharedGeneralizations
	sharedGeneralizations at: #Object put: (OntoUMLObject newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Sortal put: (OntoUMLSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #AntiRigidSortal put: (OntoUMLAntiRigidSortal newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Role put: self.