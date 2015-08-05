<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/zbase/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="decorator" content="admin" />
<title>后台管理</title>
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
<script type="text/javascript" charset="utf-8" src="${ctx}/static/js/thinker-md/js/emojimap.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/static/js/thinker-md/js/vendor/jquery/jquery-2.1.3.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/static/js/thinker-md/js/vendor/highlight/highlight.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/static/js/thinker-md/js/vendor/markdown/he.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/static/js/thinker-md/js/vendor/markdown/marked.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/static/js/thinker-md/js/vendor/markdown/to-markdown.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/static/js/thinker-md/js/vendor/markdown/jsHtmlToText.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/static/js/thinker-md/js/vendor/markdown/tab.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/static/js/thinker-md/js/vendor/markdown/config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/static/js/thinker-md/js/vendor/markdown/emoji.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/static/js/thinker-md/js/vendor/markdown/bootstrap-markdown.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${ctx}/static/js/thinker-md/js/vendor/markdown/locale/bootstrap-markdown.zh.js"></script>
<script type="text/javascript">

$("textarea[data-provide='markdown']").markdown({
        language: 'zh',
        fullscreen: {
            enable: true
        },
        resize: 'vertical',
        localStorage: 'md',
        imgurl: '/cors/upload/ajaxUpload',
        base64url: '/cors/upload/base64Upload'
    });


    $(function(){
        $("#save").click(function(){
            var title = $("#title").val();
            var mdText = $("textarea[name='content']").val();       
            var htmlText = marked(mdText);
            
            $.ajax({
            	type:'post',
            	dataType:"text",
            	url:"${ctx}/article/save",
            	data:{
            		id:$("#id").val(),
            		title:title,
            		mdText:mdText,
            		htmlText:htmlText
            	},
            	success:function(data){
            		if(data=="success"){
            			alert("保存成功");
            		}
            	}
            });
          
        });
    });
</script>
</head>
<body>
	<!--  <h1 class="page-header" >管理控制台</h1>  -->

	<p style="margin-top:20px">

		<button type="button" class="btn btn-lg btn-default">操作1</button>
		<button type="button" class="btn btn-lg btn-primary">操作2</button>
		<button type="button" class="btn btn-lg btn-success">操作3</button>
		<button type="button" class="btn btn-lg btn-info">操作4</button>
		<button type="button" class="btn btn-lg btn-warning">操作5</button>
		<button type="button" class="btn btn-lg btn-danger">操作6</button>
	</p>
	<div class="row">
		<div class="col-md-12">
			<p>
			<input type="hidden" value="${article.id }" id="id"/>
			<label>标题</label><input type="text" name="title" id="title" value="${article.title }"/>
			</p>
			<div>
			<p>
			 <label>正文</label>
			</p>
			<p>
			 <textarea  id="content" name="content" data-provide="markdown" rows="10" placeholder="这里输入内容,支持Markdown语法.">${article.mdText}</textarea>
			</p>
			</div>
			<p><button type="button" class="btn btn-lg btn-default" id="save">保存</button></p>
		</div>
		
	</div>

</body>
</html>
