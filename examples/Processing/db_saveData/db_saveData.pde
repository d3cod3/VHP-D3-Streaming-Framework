import http.requests.*;

JSONObject response;
String serverAddress = "http://192.168.1.169"; // your server address here
String authKey = "xxxxxxxxxxxxx"; // your auth key here

void setup(){
  size(800,600);
  
}


void draw(){
  background(0);
  
  
}

void keyReleased(){
  if(key == 's'){
    PostRequest post = new PostRequest(serverAddress+"/streaming/exec/save_data.php");
    post.addData("auth_key", authKey);
    post.addData("user_name", "n3m3da");
    post.addData("data_name", "varAVM");
    post.addData("data_type", "int"); // can be:  bool, int, float, text
    post.addData("data", str(mouseX)); // values must be always a String type
    post.send();
    
    // Load the JSON file as a JSON object
    response = parseJSONObject(post.getContent());
    
    println(response.toString());
  }
}



