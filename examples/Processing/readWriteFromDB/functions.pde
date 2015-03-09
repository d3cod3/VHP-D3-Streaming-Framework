String serverAddress = "http://192.168.1.169"; // your server address
String auth_key = "AVM_KEY"; // your auth key

String receiveData(String user, String dataName){
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
      return lastValue;
    }else{
      println(response.getString("msg"));
      return "";
    }
    
    
}


void sendData(String user, String dataName,String type, String value){
    PostRequest post = new PostRequest(serverAddress+"/streaming/exec/save_data.php");
    post.addData("auth_key", auth_key);
    post.addData("user_name", user);
    post.addData("data_name", dataName);
    post.addData("data_type", type); // bool, int, float, text
    post.addData("data", value);
    post.send();
    
    // Load the JSON file as a JSON object
    response = parseJSONObject(post.getContent());
    if(response.getString("ok") == "0"){
      println(response.getString("msg"));
    }else{
      println("Data saved OK");
    }
    
}

PVector extractMouseData(String data){
  PVector temp;
  
  String[] list = split(data, '_');
  
  temp = new PVector(int(list[0]),int(list[1]));
  
  return temp;
}

