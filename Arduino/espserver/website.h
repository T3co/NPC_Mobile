const char PAGE_MAIN[] PROGMEM = R"=====(
<!DOCTYPE html>
<html lang="en" class="js-focus-visible">
  <title>Web Page Update Demo</title>
  <style>
    table {
      position: relative;
      width: 100%;
      border-spacing: 0px;
    }
    tr {
      border: 1px solid white;
      font-family: "Verdana", "Arial", sans-serif;
      font-size: 20px;
    }
    th {
      height: 20px;
      padding: 3px 15px;
      background-color: #343a40;
      color: #ffffff !important;
    }
    td {
      height: 20px;
      padding: 3px 15px;
    }
    .tabledata {
      font-size: 24px;
      position: relative;
      padding-left: 5px;
      padding-top: 5px;
      height: 25px;
      border-radius: 5px;
      color: #ffffff;
      line-height: 20px;
      transition: all 200ms ease-in-out;
      background-color: #00aa00;
    }
    .fanrpmslider {
      width: 30%;
      height: 55px;
      outline: none;
      height: 25px;
    }
    .bodytext {
      font-family: "Verdana", "Arial", sans-serif;
      font-size: 24px;
      text-align: left;
      font-weight: light;
      border-radius: 5px;
      display: inline;
    }
    .navbar {
      width: 100%;
      height: 50px;
      margin: 0;
      padding: 10px 0px;
      background-color: #fff;
      color: #000000;
      border-bottom: 5px solid #293578;
    }
    .fixed-top {
      position: fixed;
      top: 0;
      right: 0;
      left: 0;
      z-index: 1030;
    }
    .navtitle {
      float: left;
      height: 50px;
      font-family: "Verdana", "Arial", sans-serif;
      font-size: 50px;
      font-weight: bold;
      line-height: 50px;
      padding-left: 20px;
    }
    .navheading {
      position: fixed;
      left: 60%;
      height: 50px;
      font-family: "Verdana", "Arial", sans-serif;
      font-size: 20px;
      font-weight: bold;
      line-height: 20px;
      padding-right: 20px;
    }
    .navdata {
      justify-content: flex-end;
      position: fixed;
      left: 70%;
      height: 50px;
      font-family: "Verdana", "Arial", sans-serif;
      font-size: 20px;
      font-weight: bold;
      line-height: 20px;
      padding-right: 20px;
    }
    .category {
      font-family: "Verdana", "Arial", sans-serif;
      font-weight: bold;
      font-size: 32px;
      line-height: 50px;
      padding: 20px 10px 0px 10px;
      color: #000000;
    }
    .heading {
      font-family: "Verdana", "Arial", sans-serif;
      font-weight: normal;
      font-size: 28px;
      text-align: left;
    }

    .btn {
      background-color: #444444;
      border: none;
      color: white;
      padding: 10px 20px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin: 4px 2px;
      cursor: pointer;
    }
    .foot {
      font-family: "Verdana", "Arial", sans-serif;
      font-size: 20px;
      position: relative;
      height: 30px;
      text-align: center;
      color: #aaaaaa;
      line-height: 20px;
    }
    .container {
      max-width: 1800px;
      margin: 0 auto;
    }
    table tr:first-child th:first-child {
      border-top-left-radius: 5px;
    }
    table tr:first-child th:last-child {
      border-top-right-radius: 5px;
    }
    table tr:last-child td:first-child {
      border-bottom-left-radius: 5px;
    }
    table tr:last-child td:last-child {
      border-bottom-right-radius: 5px;
    }
  </style>
  <body style="background-color: #efefef" onload="process()">
    <header>
      <div class="navbar fixed-top">
        <div class="container">
          <div class="navtitle">Info Monitor</div>
        </div>
      </div>
    </header>
    <main class="container" style="margin-top: 70px">
      <div class="category">Info Readings</div>
      <div style="border-radius: 10px !important">
        <table style="width: 50%">
          <tr>
            <th colspan="1">
              <div class="heading">Branch</div>
            </th>
            <th colspan="1">
              <div class="heading">Value</div>
            </th>
          </tr>
          <tr>
            <td>
              <div class="bodytext">Temperature</div>
            </td>
            <td>
              <div class="tabledata" id="b0">
                <span id="switch">0</span>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div class="bodytext">Car Info</div>
            </td>
            <td>
              <div class="tabledata" id="b1">
                <span id="RC">0</span>
              </div>
            </td>
          </tr>
        </table>
      </div>
    </main>

    <script  type = "text/javascript">
      function createXmlHttpObject() {
        if (window.XMLHttpRequest) {
          xmlHttp = new XMLHttpRequest();
        } else {
          xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        return xmlHttp;
      }
      function response() {
        var message;
        var barwidth;
        var currentsensor;
        var xmlResponse;
        var color = "#e8e8e8";
        parser = new DOMParser();
        xmlResponse = xmlHttp.responseXML;

        document.getElementById("switch").innerHTML = "25";
      }

      function process() {
        if (xmlHttp.readyState == 0 || xmlHttp.readyState == 4) {
          xmlHttp.open("PUT", "xml", true);
          xmlHttp.onreadystatechange = response;
          xmlHttp.send(null);
        }
        setTimeout("process()", 100);
      }
    </script>
  </body>
</html>
)=====";