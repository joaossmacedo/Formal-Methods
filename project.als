module project/Bugs

// Signatures:
abstract sig Bool {}
sig True extends Bool {}
sig False extends Bool {}

sig Bug {}

sig Date {}

sig Version {
	bugs: seq Report,
	hasBeenRevised: Bool
}

sig Client {
	project: some Project
}

sig Repository {
	clients: set Client
}

sig Project {
	folder: one Folder
}

sig Folder {
	subfolder: seq Version, 
	latestVersion: one Version
}

sig Report {
	bug: Bug,
	severity: Int ,
	corrected: Bool,
	time: seq Date
}

run {} for 5
