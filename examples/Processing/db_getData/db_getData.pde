import http.requests.*;

JSONObject response;
JSONObject lastData;
String lastValue;

String serverAddress = "http://192.168.1.169"; // your server address here
String authKey = "xxxxxxxxxxxxx"; // your auth key here

void setup(){
  size(800,600);
  
}

void draw(){
  background(0);
  
}

void keyReleased(){
  if(key == 'g'){
    receiveData("n3m3da","mouse");
  }
}

void receiveData(String user, String dataName){
    PostRequest post = new PostRequest(serverAddress+"/streaming/exec/get_data.php");
    post.addData("last", "true");
    post.addData("user_name", user);
    post.addData("data_name", dataName);
    post.send();
    
    // Load the JSON file as a JSON object
    response = parseJSONObject(post.getContent());
    
    String ok = response.getString("ok");
    
    // if we have a response
    if(response.getString("msg").length() == 54 || ok == "1"){
      lastData = response.getJSONArray("data").getJSONObject(0);
      lastValue = lastData.getString("data_"+lastData.getString("data_type"));
      println(lastValue);
    }else{
      println(response.getString("msg"));
    }
}

