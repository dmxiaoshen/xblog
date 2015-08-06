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
                    return "第一页";  
                case "prev":  
                    return "<";  
                case "next":  
                    return ">";  
                case "last":  
                    return "最后页";  
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
 <div class="row">
 <div class="col-md-12">
 	<div id="pager"></div>
 </div>
 </div>
</div>
</body>
</html>
