<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	  <h1>添加html标签</h1>
      <div></div>
      <div></div>
    <button onclick="addTag()">添加a标签</button>
    <a href="#" onclick="addText()">添加文本</a>
</body>

<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript">
function addTag(){
    //创建XMLHttpRequest 请求的对象
    var request = new XMLHttpRequest();
    // 请求的方式
    var method = "GET";
    // 请求的连接地址
    var url = "success.jsp";
    // 初始化请求参数
    request.open(method, url,true);
    // 发送请求
    request.send(null);
    request.onreadystatechange = function(){
        // 如果响应请求
        if(request.readyState==4){
            // 如果请求成功
            if(request.status==200 || request.status==304){
                
                var a = request.responseText;
                alert(a);
                var d = document.getElementsByTagName("div")[0];
                d.innerHTML = a;
            }
        }
    };
    
}


function addText(){
    //创建XMLHttpRequest 请求的对象
    var request = new XMLHttpRequest();
    // 请求的方式
    var method = "GET";
    // 请求的连接地址
    var url = "AServlet";
    // 初始化请求参数
    request.open(method, url,true);
    // 发送请求
    request.send(null);
    request.onreadystatechange = function(){
        // 如果响应请求
        if(request.readyState==4){
            // 如果请求成功
            if(request.status==200 || request.status==304){
                
                var text = request.responseText;
                var d = document.getElementsByTagName("div")[1];
                d.innerHTML = text;
            }
        }
    };
    
}

</script>


</html>