<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/zbase/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="decorator" content="default" />
<title>xblog</title>
<style type="text/css">
.blog-content{
	margin-top:40px;
}

.title {
	text-align:center;
	color:blue;
	font-size:20px;
}

</style>
<style type="text/css">
    @import "${ctx}/static/js/thinker-md/css/vendor/font.css";
    @import "${ctx}/static/js/thinker-md/css/vendor/markdown.css";
    @import "${ctx}/static/js/thinker-md/css/emoji/nature.css";
    @import "${ctx}/static/js/thinker-md/css/emoji/object.css";
    @import "${ctx}/static/js/thinker-md/css/emoji/people.css";
    @import "${ctx}/static/js/thinker-md/css/emoji/place.css";
    @import "${ctx}/static/js/thinker-md/css/emoji/Sysmbols.css";
    @import "${ctx}/static/js/thinker-md/css/emoji/twemoji.css";
    @import "${ctx}/static/js/thinker-md/css/vendor/font-awesome.css";
    @import "${ctx}/static/js/thinker-md/css/vendor/sunburst.css";
</style>
<script type="text/javascript">
$(function(){
	$(".title").click(function(){
		var id = $(this).attr("data-id");
		window.location.href="${ctx}/article/add?id="+id;
	});
	

    var options = {  
        currentPage: 3,  
        totalPages: 10,  
        size:"large",  
        alignment:"center",  
        itemTexts: function (type, page, current) {  
            switch (type) {  
                case "first":  
                    return "首页";  
                case "prev":  
                    return "上一页";  
                case "next":  
                    return "下一页";  
                case "last":  
                    return "尾页";  
                case "page":  
                    return  page;  
            }                 
        },  
        onPageClicked: function (e, originalEvent, type, page) {  
            alert("type:" + type + ",Page:" + page);  
        }  
    }  


    $('#pager').bootstrapPaginator(options);  
 
});
</script>
</head>
<body>
<!-- 主要内容 -->
<div class="container blog-content">
<div class="row">
<div class="col-md-1"></div>
<div class="col-md-10">
<c:forEach items="${articleList}" var="item">

<div class="row" id="summary-container">
        <div class="col-md-12">
        <div id="header"><p class="title" data-id="${item.id}">${item.title }</p></div>
        <div id="content">
				${item.htmlText}
        </div>
           
        </div>    
        <!--  <div class="col-md-3" style="height:240px;width:200px">
        <img width="100%" height="240px" src="http://i1153.photobucket.com/albums/p501/dmxiaoshen/hexo/siwei_zpslxeifwoy.jpg" alt="" />
        </div>   --> 
    </div>
    <hr class="feature-divider" />
</c:forEach>
</div>
</div>
<div class="col-md-1"></div>
 <div class="row">
 <div class="col-md-3"></div>
 <div class="col-md-6">
 	<div id="pager" class="pull-right">
 	</div>
 </div>
 <div class="col-md-3"></div>
 </div>
</div>
</body>
</html>
