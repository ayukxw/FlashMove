package enums;

public enum TransportationType {
	SMALL(0, "MPV"),
	MEDIUM(1, "VAN"),
	LARGE(2, "LORRY");
	
	int key;
	String value;
	
	TransportationType(int key, String value) {
		this.key = key;
		this.value = value;
	}

	public int getKey() {
		return key;
	}

	public void setKey(int key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	public static String getByKey(int key) {
		for (TransportationType transportationType : TransportationType.values()) {
			if (transportationType.getKey() == key) {
				return transportationType.getValue();
			}
		}
		return "";
	}

}
