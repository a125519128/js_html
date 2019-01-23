<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

   <div id="test">
   
        <div class="solution">
            <div class="span-1"></div>
            <div class="span-18">
                <div class="solutionName"></div>
                <div class="solutionDescription"></div>
            </div>
            <div class="span-2" >
                <div>
                    <a href="#" >add</a>
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

	<script type="text/javascript">
	$.ajax({
		type : "POST",
		url : 'success.jsp',
		dataType : "html",
		success: function(data) {
		    alert( data ); // shows whole dom
		    //alert( $(data).find('#test').html() ); // returns null
	            $("#test").html($(data).find("#test").html());


	        },
		error : function() {
		    alert("Sorry, The requested property could not be found.");
		}
	});
	</script>
</body>
</html>