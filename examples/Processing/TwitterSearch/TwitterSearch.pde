import http.requests.*;

JSONObject response;
JSONArray tweets;
PFont font;

void setup() {
  size(1024,768);
  
  PostRequest post = new PostRequest("http://localhost:8888/streaming/exec/get_tweets.php");
  post.addData("tag", "openframeworks");
  post.send();
  
  // Load the JSON file as a JSON object
  response = parseJSONObject(post.getContent());
  
  println(response.toString());
  
  tweets = response.getJSONArray("data");
  
  for(int i=0;i<tweets.size();i++){
    String t = tweets.getString(i);
    println(i+" - "+t); 
  }
  
  font = loadFont("ArialUnicodeMS-16.vlw");
  
}

void draw(){
  
  background(0);
  fill(255);
  
  textFont(font, 16);
  
  // Get the array of items from the JSON object
  for(int i=0;i<tweets.size();i++) {
    String t = tweets.getString(i);
    text(t, 20, 60 + (i*40));
  }
  
  
  
}
