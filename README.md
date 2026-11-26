# OpenPonk: OntoUML Profile

[![Nightly](https://github.com/OpenPonk/ontouml-profile/actions/workflows/nightly.yml/badge.svg)](https://github.com/OpenPonk/ontouml-profile/actions/workflows/nightly.yml) [![Coverage Status](https://coveralls.io/repos/github/OpenPonk/ontouml-profile/badge.svg?branch=master)](https://coveralls.io/github/OpenPonk/ontouml-profile?branch=master)

[OntoUML](https://ccmi.fit.cvut.cz/methodologies/ontouml/) stereotype profile and UI plugin extending [`class-editor`](https://github.com/OpenPonk/class-editor) in the [OpenPonk](https://openponk.org) platform. Included automatically in `class-editor` (`complete`) and all-in-one builds.

## Installation

See [openponk.org/#direct-installation](https://openponk.org/#direct-installation) for the supported Pharo version.

```smalltalk
Metacello new
	baseline: 'OpenPonkOntoUMLProfile';
	repository: 'github://OpenPonk/ontouml-profile';
	load.
```

## Documentation

Part of the [OpenPonk](https://openponk.org) platform. For architecture, the repository catalog, and contributing guidelines, see [`OpenPonk/.github`](https://github.com/OpenPonk/.github/blob/main/profile/README.md).
