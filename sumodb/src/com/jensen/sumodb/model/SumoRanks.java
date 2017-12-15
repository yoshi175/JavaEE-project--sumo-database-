package com.jensen.sumodb.model;

public enum SumoRanks {
	
	
/*
	YOKOZUNA,
	OZEKI,
	SEKIWAKE,
	KOMUSUBI,
	MAEGASHIRA_1,
	MAEGASHIRA_2,
	MAEGASHIRA_3,
	MAEGASHIRA_4,
	MAEGASHIRA_5,
	MAEGASHIRA_6,
	MAEGASHIRA_7,
	MAEGASHIRA_8,
	MAEGASHIRA_9,
	MAEGASHIRA_10,
	MAEGASHIRA_11,
	MAEGASHIRA_12,
	MAEGASHIRA_13,
	MAEGASHIRA_14,
	MAEGASHIRA_15,
	MAEGASHIRA_16;
*/
	YOKOZUNA("Yokozuna"),
	OZEKI("Ozeki"),
	SEKIWAKE("Sekiwake"),
	KOMUSUBI("Komusubi"),
	MAEGASHIRA_1("Maegashira 1"),
	MAEGASHIRA_2("Maegashira 2"),
	MAEGASHIRA_3("Maegashira 3"),
	MAEGASHIRA_4("Maegashira 4"),
	MAEGASHIRA_5("Maegashira 5"),
	MAEGASHIRA_6("Maegashira 6"),
	MAEGASHIRA_7("Maegashira 7"),
	MAEGASHIRA_8("Maegashira 8"),
	MAEGASHIRA_9("Maegashira 9"),
	MAEGASHIRA_10("Maegashira 10"),
	MAEGASHIRA_11("Maegashira 11"),
	MAEGASHIRA_12("Maegashira 12"),
	MAEGASHIRA_13("Maegashira 13"),
	MAEGASHIRA_14("Maegashira 14"),
	MAEGASHIRA_15("Maegashira 15"),
	MAEGASHIRA_16("Maegashira 16");
	
	private final String rank;
	
	private SumoRanks(String rank) {
		this.rank = rank;
	}
	
	@Override
	public String toString() {
		return rank;
		/*
		String constValue = super.toString();
		
		return constValue.substring(0,1) + constValue.substring(1).toLowerCase();
		*/
	}
}
