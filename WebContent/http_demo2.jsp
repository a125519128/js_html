<%@ page language="java" contentType="text/html; charset=uft8"
    pageEncoding="uft8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
	// 2-Ajax模拟类
	var Ajax = function () {
	    var _this = this;
	    //请求路径
	    _this.ajaxUrl = "";
	    //传入的参数对象
	    _this.data = {};
	    //返回数据类型：json/jsonp/xml/text...
	    _this.dataType = "text";
	    //是否异步
	    _this.isAsync = true,
	    //回调函数
	    _this.rollBack = function (result) {
	    };

	    _this.Init = function (handlerName, actionName, dataObject, rollBack) {
	        _this.ajaxUrl = "/ajax/" + handlerName + ".js?action=" + actionName;
	        _this.data = dataObject;
	        _this.rollBack = rollBack;
	        return _this;
	    };
	    _this.Init_Two = function (postUrl, dataObject, rollBack) {
	        _this.ajaxUrl = postUrl;
	        _this.data = dataObject;
	        _this.rollBack = rollBack;
	        return _this;
	    };

	    //Get请求
	    _this.Get = function (dataType, isAsync) {
	        if (dataType != null) {
	            _this.dataType = dataType;
	        };
	        if (isAsync != null) {
	            _this.isAsync = isAsync;
	        };
	        $.ajax({
	            type: "GET",
	            url: _this.ajaxUrl,
	            data: _this.data,
	            dataType: _this.dataType,
	            async: _this.isAsync,//false代表只有在等待ajax执行完毕后才执行
	            success: function (json) {
	                var result = json;
	                if (_this.dataType == "text") {
	                    try {
	                        result = JSON.parse(json);
	                    } catch (e) {
	                        result = new Function("return " + json)();
	                    }
	                }
	                if (_this.rollBack && _this.rollBack instanceof Function) {
	                    _this.rollBack(result);
	                }
	            },
	            error: function (e) {
	                console.log(e);
	            }
	        });
	    };
	    //获取请求地址的HTML内容(获取html的地址，select选择器)
	    _this.GetHtml = function (getHtmlUrl, jquerySelectDom) {
	        $.ajax({
	            type: "GET",
	            url: getHtmlUrl,
	            data: "",
	            dateType: "html",
	            //false代表只有在等待ajax执行完毕后才执行
	            async: false,
	            success: function (data) {
	                if (jquerySelectDom != "") {
	                    var $data = $(data);
	                    //由于$data是个集合，得到的是所有一级节点的jquery集合，所以，先从一级集合中找，再从所有子元素中找
	                    var $result = $data.next(jquerySelectDom);
	                    if ($result.length == 0) {
	                        $result = $data.find(jquerySelectDom);
	                    }
	                    var resultHtml = "";
	                    if ($result.length > 0) {
	                        resultHtml = $result.html();
	                    }
	                    return resultHtml;
	                } else {
	                    return data;
	                }
	            }
	        });
	    };
	    //普通Post请求（请求地址：postUrl,,是否异步）
	    _this.Post = function (dataType, isAsync) {
	        if (dataType != null) {
	            _this.dataType = dataType;
	        };
	        if (isAsync != null) {
	            _this.isAsync = isAsync;
	        };
	        $.ajax({
	            type: "POST",
	            url: _this.ajaxUrl,
	            data: _this.data,
	            dataType: _this.dataType,
	            //false代表只有在等待ajax执行完毕后才执行
	            async: _this.isAsync,
	            success: function (json) {
	                var result = json;
	                if (_this.dataType == "text") {
	                    try {
	                        result = JSON.parse(json);
	                    } catch (e) {
	                        result = new Function("return " + json)();
	                    }
	                }
	                if (_this.rollBack && _this.rollBack instanceof Function) {
	                    _this.rollBack(result);
	                }
	            },
	            error: function (e) {
	                console.log(e);
	            }
	        });
	    };
	    //模拟Form表单请求-参数为FormData对象
	    _this.FormPost = function () {
	        $.ajax({
	            type: "POST",
	            url: _this.ajaxUrl,
	            data: _this.data,
	            //false代表只有在等待ajax执行完毕后才执行
	            async: _this.isAsync,
	            processData: false,
	            contentType: false,
	            success: function (json) {
	                try {
	                    result = JSON.parse(json);
	                } catch (e) {
	                    result = new Function("return " + json)();
	                }
	                if (_this.rollBack && _this.rollBack instanceof Function) {
	                    _this.rollBack(result);
	                }
	            },
	            error: function (e) {
	                console.log(e);
	            }
	        });
	    };
	};
	window["Ajax"] = Ajax;
	
	</script>
</body>
</html>