baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'UMLProfiles'
				with: [ spec repository: 'github://openponk/uml-profiles/repository' ].
			spec package: 'OntoUML-Profile' with: [ spec requires: #('UMLProfiles') ].
			spec group: 'default' with: #('OntoUML-Profile') ]