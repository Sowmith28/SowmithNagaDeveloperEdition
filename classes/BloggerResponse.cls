public class BloggerResponse {
 public static void getBlogPageDetails(String blogId){
        Http h = new Http();
        HttpRequest hReq = new HttpRequest();
		hReq.setEndpoint('https://www.googleapis.com/blogger/v2/blogs/'+blogId+'/pages');
        hReq.setMethod('GET');
        hReq.setHeader('Authorization', 'OAuth ya29.Glt3BYjfpOA3WwtpUaW21AxsSL7uy8LBdFoJ6wVIyWPW1ino0IdC5bsigRGBi22UdOSuV_-RmQqoVodIBpsdeZOmOBvkrYE3F1En7r0lduASfeqPss-y4MmpMwfK');
        hReq.setHeader('Content-Type', 'application/json');
        HttpResponse hRes = h.send(hReq);
        System.debug('HRes'+hRes.getBody());
        BloggerJSON j2A = parse(hRes.getBody()); 
        System.debug('j2A'+j2A.Items[0].author.displayName);
    }
    public class BloggerJSON {
		public String kind;
		public List<Items> items;
	}

	public class Author {
		public String id;
		public String displayName;
		public String url;
		public Image image;
	}

	public class Items {
		public String kind;
		public String id;
		public Blog blog;
		public String published;
		public String updated;
		public String url;
		public String selfLink;
		public String title;
		public String content;
		public Author author;
	}

	public class Image {
		public String url;
	}

	public class Blog {
		public String id;
	}

	
	public static BloggerJSON parse(String json) {
		return (BloggerJSON) System.JSON.deserialize(json, BloggerJSON.class);
	}
}