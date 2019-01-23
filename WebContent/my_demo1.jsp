<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div id="ppp"></div>
   <div id="test">
   
        <div class="solution">
            <div class="span-1"></div>
            <div class="span-18">
                <div class="solutionName"></div>
                <div class="solutionDescription"></div>
            </div>
            <div class="span-2" >
                <div>
                    <a href="#" >add</a><input type="button" value="tijao" onclick="test()"/>
                    more
                </div>
                <div><textarea style="width:75; height:25; overflow: auto;" rows="3" cols="5">111111111</textarea></div>
                <div><textarea style="width:75; height:25; overflow: auto;" rows="3" cols="5">222222222</textarea></div>
                <div><textarea style="width:75; height:25; overflow: auto;" rows="3" cols="5">333333333</textarea></div>
            </div>
            <div class="span-3 last"></div>
    
            <div class="span-24 last solutionSplitter">
                <hr/>
            </div>
        </div>
    
</div>
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
	<script type="text/javascript">
	function test(){
	$.ajax({
		type : "POST",
		url : 'fromHtml',
		dataType : "html",
		success: function(data) {
			
		    alert( data ); // shows whole dom
		    alert( $(data).find('#test') ); // returns null
		   	alert($(data).text());
			alert(document.getElementsByTagName("div")[0]);
			var d = document.getElementsByTagName("div")[0];
			// $("#ppp").html($(data).text());
			 
			 alert( data ); // shows whole dom
			    //alert( $(data).find('#test').html() ); // returns null
		     $("#test").html(data);
			    
			//alert("body="+$(data).find("#test").html());
	        },
		error : function() {
		    alert("Sorry, The requested property could not be found.");
		}
	});
	}
	</script>
</body>
</html>