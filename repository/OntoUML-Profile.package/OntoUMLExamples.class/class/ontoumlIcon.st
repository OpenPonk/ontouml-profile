accessing - icons
ontoumlIcon
	^ ontoumlIcon
		ifNil: [ ontoumlIcon := Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self ontoumlIconContents readStream) ]