support
applyProfileTo: aModel
	aModel profileApplications
		add:
			(OPUMLProfileApplication new
				uuid: aModel uuid , '-_profileApplication.0';
				appliedProfile: self profile)