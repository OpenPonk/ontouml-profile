Class {
	#name : #OntoUMLPlugin,
	#superclass : #OPUmlClassEditorPlugin,
	#classInstVars : [
		'ontoumlIcon'
	],
	#category : #'OntoUML-Profile-Model'
}

{ #category : #'as yet unclassified' }
OntoUMLPlugin class >> defaultProfiles [
	^ {OntoUMLProfileFactory profile}
]

{ #category : #'accessing - icons' }
OntoUMLPlugin class >> ontoumlIcon [
	^ ontoumlIcon
		ifNil: [ ontoumlIcon := Form
				fromBinaryStream: self ontoumlIconContents base64Decoded readStream ]
]

{ #category : #'accessing - icons' }
OntoUMLPlugin class >> ontoumlIconContents [
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAABWVBMVEVHcEwtQojvaSgqQYoq
QYrvaSjvaSgqQYoqQYrvaSgqQYrvaSgqQYrtaSn3ayTuaSj2aiTvaSjtaSnuaSi0XUXvaSgg
P4/uaSjvaSgbPpH3ayTvaSj3ayS0XUUbPpHkZy20XUUbPpHCYEC1XUS6XkItQoi0XUUrQYnv
aSj2aiTvaSgdPpH2aiT2aiQgP4/taSn0aiXvaSgtQogrQYnwaScqQYogP4/vaSggP48qQYrv
aSjvaSgqQYrvaSgjQI0qQYrvaSjvaSjvaSgrQYkqQYoqQYoqQYrvaSjvaSjvaSjvaSjvaSjv
aSjvaSjvaSjvaSjvaSjvaSjvaSgqQYoqQYoqQYorQYkqQYoqQYoqQYoqQYoqQYoqQYoqQYoq
QYoqQYoqQYoqQYoqQYoqQYoqQYoqQYoqQYoqQYoqQYoqQYoqQYrvaSgqQYruaSjtaSn3ayQb
PpEtQogrQYnaPUGRAAAAa3RSTlMABANXAQQBBAIC2WEFAwQEA25JcQJvA74VA1e82TVSAqrM
AwICV4UEvlIqA4rRVO0G6dlxBAPW+I5q2hpTdgIsngiSvfvhRQd4iP1c4R2O5Sb0+QqxxgIZ
Wcn88NAoQJH9xOiGD3sX4MGI/vSwdzwAAADUSURBVBjTNc9VV0JhEIXhFzzCEbAVW1QsFLE7
sQC7MDCwa8b8/xd+6zvLfTNrnj03A+Dy/HD3+vSIg43L9Yu+3+rVmScO7oXevxUv9cR0JpNs
auEGznV92UqQWc0TcY43dMEs0Mf47xqnREJaYiFKamqGJYL/UEViKEkc39hPDz4DldR+NNDN
YOd3O00GSqmWFmJ09Xa0UWehXvqZYKT1q5kKC2GZS8P88GcN5QbKGJiWXCCzIqONBLCyKls7
+yKL+L3v8O8diRxmvd67OQhv75ph8geQ/iHLJlMN5gAAAABJRU5ErkJggg=='
]

{ #category : #accessing }
OntoUMLPlugin >> icon [
	^ self class ontoumlIcon
]

{ #category : #accessing }
OntoUMLPlugin >> isPluginFor: aModel [
	^ {self modelClass.
	OPUMLModel} includes: aModel class
]

{ #category : #accessing }
OntoUMLPlugin >> name [
	^ 'OntoUML UFO-A'
]

{ #category : #'instance creation' }
OntoUMLPlugin >> newModel [
	| model |
	model := super newModel.
	model profileApplications
		addAll:
			(self defaultProfiles
				collect: [ :each | OPUMLProfileApplication new appliedProfile: each ]).
	^ model
]
