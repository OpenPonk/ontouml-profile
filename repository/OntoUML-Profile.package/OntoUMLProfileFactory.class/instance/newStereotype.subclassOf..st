parts
newStereotype: aName subclassOf: aParent
	| stereotype |
	stereotype := OPUMLStereotype new
		name: aName;
		uuid: aName.
	OPUMLGeneralization new
		general: aParent;
		specific: stereotype.
	^ stereotype