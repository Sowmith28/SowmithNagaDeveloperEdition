public class UVCheck {

    public static void getUVDetails(String lat, String lng){
        Http h = new Http();
        HttpRequest hReq = new HttpRequest();
		hReq.setEndpoint('https://api.openuv.io/api/v1/uv?lat='+lat+'&lng='+lng);
        hReq.setMethod('GET');
        hReq.setHeader('x-access-token', 'f4c18f37be6044c44826d4d4016e1995');
        hReq.setHeader('Content-Type', 'application/json');
        HttpResponse hRes = h.send(hReq);
        System.debug('HRes'+hRes.getBody());
        JSON2Apex j2A = parse(hRes.getBody()); 
        System.debug('j2A'+j2A.result.uv);
    }
    


	public class JSON2Apex {
		public Result result;
	}

	public class Sun_times {
		public String solarNoon;
		public String nadir;
		public String sunrise;
		public String sunset;
		public String sunriseEnd;
		public String sunsetStart;
		public String dawn;
		public String dusk;
		public String nauticalDawn;
		public String nauticalDusk;
		public String nightEnd;
		public String night;
		public String goldenHourEnd;
		public String goldenHour;
	}

	public class Sun_position {
		public Double azimuth;
		public Double altitude;
	}

	public class Sun_info {
		public Sun_times sun_times;
		public Sun_position sun_position;
	}

	public class Safe_exposure_time {
		public Integer st1;
		public Integer st2;
		public Integer st3;
		public Integer st4;
		public Integer st5;
		public Integer st6;
	}

	public class Result {
		public Double uv;
		public String uv_time;
		public Double uv_max;
		public String uv_max_time;
		public Double ozone;
		public String ozone_time;
		public Safe_exposure_time safe_exposure_time;
		public Sun_info sun_info;
	}

	
	public static JSON2Apex parse(String json) {
		return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
	}

}