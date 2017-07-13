waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["serverrules","Server Rules"];
player createDiarySubject ["controls","Controls"];
player createDiarySubject ["features","Features"];

player createDiaryRecord["changelog",
	[
		"v 1.0",
			"
				Official release of Encore Training Server.
			"
	]
];

player createDiaryRecord["changelog",
 [
	"v 2.0",
		"
			Complete overhaul on revive system. Players can now drag dead bodies.
		"
	]
];

player createDiaryRecord ["controls",
	[
		"",
			"
			Y: Open Player Menu<br/>
			U: Lock and unlock vehicles<br/>
			F: Cop Siren (if cop)<br/>
			T: Vehicle Trunk<br/>
			H: Holster/Unholster weapon<br/>
			User Action 10: Earplugs (Increase/Reduce in-game effect volum)<br/>
			User Action 11: Use Redgulls<br/>
			User Action 6: User Nitro<br/>
			"
	]
];

player createDiaryRecord ["features",
	[
		"",
			"
			Player reviving with timers and debuffs.<br/>
			5 minute bleeding out<br/>
			Player executing<br/>
			Blood Bagging<br/>
		 Painkillers<br/>
			Splint<br/>
			Cartels<br/>
			Nitro<br/>
			Seatbelt<br/>
			Loadouts<br/>
			"
	]
];
