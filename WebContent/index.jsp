<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>h1</h1>
      <div>div1</div>
      <div>div2</div>
    <button onclick="test()">tag</button>
    <a href="#" onclick="addText()">text</a>
<!-- <div id="test"></div>
<form action="/servlet/HelloServlet">
	<input type="submit" value="test...."/>
	button没有提交功能   onclick动作事件调用test（）
	<input type="button" value="clicke..." onclick="test();">
</form> -->
</body>

<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript">

function test(){
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

</script>
</html>