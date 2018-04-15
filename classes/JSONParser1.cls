public class JSONParser1 {

	public class Merch {
		public String name;
		public String description;
		public Integer price;
	}

	public class JSON2Apex {
		public List<Merch> merch;
	}

	
	public static JSON2Apex parse(String json) {
		return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
	}
    public static void test(String json){
        
        JSON2Apex j= parse(json);
        System.debug(j.merch[0].name);
        System.debug(j.merch[0]);
    }
}