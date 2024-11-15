Extension { #name : 'OntoUMLProfileFactory' }

{ #category : '*OpenPonk-OntoUML-Plugin' }
OntoUMLProfileFactory class >> openProfile [

	<script>
	self new openProfile
]

{ #category : '*OpenPonk-OntoUML-Plugin' }
OntoUMLProfileFactory >> openProfile [

	(OPProject openOnModel: self profile) showAllElementsInAllDiagrams
]
