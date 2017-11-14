support
generalizationSetOn: aCollection
	| generalizationSet |
	generalizationSet := OPUMLGeneralizationSet new.
	aCollection do: [ :each | generalizationSet generalizations add: each ].
	^ generalizationSet