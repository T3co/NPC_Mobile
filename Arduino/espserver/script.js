 function createXmlHttpObject(){
  if(window.XMLHttpRequest){
    xmlHttp=new XMLHttpRequest();
  }
  else{
    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  return xmlHttp;
}
function response(){
  var message;
  var barwidth;
  var currentsensor;
  var xmlResponse;
  var xmldoc;
  var dt = new Date();
  var color = "#e8e8e8";
 
  xmlResponse=xmlHttp.responseXML;

  document.getElementById("time").innerHTML = dt.toLocaleTimeString();
  document.getElementById("date").innerHTML = dt.toLocaleDateString();

  temp = xmlResponse.getElementsByTagName("temp");
  document.getElementById("temp").innerHTML = temp[0].childNodes[0].nodeValue;

  carNumbers = document.location.search();
  document.getElementById("car").innerHTML = carNumbers;
 }

function process(){
 
 if(xmlHttp.readyState==0 || xmlHttp.readyState==4) {
    xmlHttp.open("PUT","xml",true);
    xmlHttp.onreadystatechange=response;
    xmlHttp.send(null);
  }       
    setTimeout("process()",100);
}