module project/Bugs

//
// Signatures:
//
abstract sig Bool {}
sig True extends Bool {}
sig False extends Bool {}

sig Bug {}

sig Report {
	bug: Bug,
	severity: Int ,
	corrected: Bool,
	daysOld: Int,
	daysSinceWorked: Int,
}

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
	lastVersion: one Version
}

//
// Facts:
//
fact LimitCorrectionTime {
	no r: Report |
		r.daysOld < 1 ||
		r.daysOld > 6 ||
		(r.daysOld = 7 && r.corrected = True )
}

fact LimitSeverity {
	no r: Report |
		r.severity < 1 || r.severity > 3
}

fact LimitDaysSinceWorked {
	no r: Report |
		r.daysSinceWorked < 1 ||
		r.daysSinceWorked > 7 ||
		r.daysOld < r.daysSinceWorked
}

run {} for 5
