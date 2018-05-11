support
applyProfileTo: aModel
	aModel profileApplications
		add:
			(OPUMLProfileApplication new
				uuid: self profile uuid asString , '-_profileApplication.0';
				appliedProfile: self profile)