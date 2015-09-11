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
<script type="text/javascript" charset="utf-8" src="${ctx}/static/js/fileupload/ajaxfileupload.js"></script>
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
    	$("#upload").click(function(){
    		alert("上传");
    		$.ajaxFileUpload({
    	        url: '${ctx}/article/fileUpload',
    	        secureuri: false,
    	        fileElementId: 'reFile',
    	        dataType: 'text',
    	        success: function(data,status) {
    	        	alert(data);
    	        	/* if(data.msg=="success"){
    	        		alert("文件上传成功");
    	        		$("#remoteFile").val(data.fileName);
    	        		var extention = data.fileName.substring(data.fileName.lastIndexOf(".") + 1).toLowerCase();
    	        		var fileName = data.fileName.substring(0,data.fileName.lastIndexOf("."));
    	        		$("#app").append("<a href='${ctx}/article/download/"+extention+"/"+fileName+"'>"+data.fileName+"-下载</a>")
    	        	}else{
    	        		alert(data.msg);
    	        		$("#remoteFile").val('');
    	        	} */
    	        	//alert(data);
    	        	/* alert(data);
    	        	 alert("文件上传成功");      	
    	         if(data=="success"){
    	        	 alert("文件上传成功");
    	         } */
    	        /*  if("${msg}"=="success"){
    	        	 alert("上传文件成功");
    	        	 $("#remoteFile").val("${fileName}");
    	         } */
    	        },
    	      });
    	});
    	$(".cateitem").click(function(){
    		var label = $(this).html();
    		var id = $(this).attr("data-bind");
    		$("#category").val(label);
    		$("#category").attr("data-value",id);
    	});
        $("#save").click(function(){
            var mdContent = $("textarea[name='content']").val();       
            var htmlContent = marked(mdContent);
            
            $.ajax({
            	type:'post',
            	dataType:"text",
            	url:"${ctx}/article/save",
            	data:{
            		id:$("#id").val(),
            		title:$("#title").val(),
            		date:$("#date").val(),
            		'category.id':$("#category").attr("data-value"),
            		tags:$("#tags").val(),
            		mdFileName:$("#mdFileName").val(),
            		mdContent:mdContent,
            		htmlContent:htmlContent
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

	<!-- <p style="margin-top:20px">

		<button type="button" class="btn btn-lg btn-default">操作1</button>
		<button type="button" class="btn btn-lg btn-primary">操作2</button>
		<button type="button" class="btn btn-lg btn-success">操作3</button>
		<button type="button" class="btn btn-lg btn-info">操作4</button>
		<button type="button" class="btn btn-lg btn-warning">操作5</button>
		<button type="button" class="btn btn-lg btn-danger">操作6</button>
	</p> -->
	<div class="row">
		<div class="col-md-12">
			<input type="hidden" value="${article.id }" id="id"/>	
			<%-- <div class="row">
				<div class="col-md-6">
					<div class="input-group input-group-lg">
					  <span class="input-group-addon" id="basic-addon1">标题</span>
					  <input type="text" name="title"  id="title" value="${article.title }" class="form-control" placeholder="" aria-describedby="basic-addon1" />
					</div>
					<div class="input-group input-group-lg">
					  <span class="input-group-addon" id="basic-addon1">日期</span>
					  <input type="text" name="date"  id="date"  value='<fmt:formatDate value="${article.date }" pattern="yyyy-MM-dd" />' class="form-control Wdate" onfocus="WdatePicker({lang:'zh_cn'})" aria-describedby="basic-addon1" />
					</div>
					
					<div class="input-group input-group-lg">
					<input name="category" id="category" type="text" value="${defaultCate.label }" data-value="${defaultCate.id}" class="form-control" aria-label="..." />
				      <div class="input-group-btn">
				        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">分类<span class="caret"></span></button>
				        <ul class="dropdown-menu dropdown-menu-right">
				         <c:forEach items="${categoryList }" var="item">
				         	<li><a href="javascript:void(0);" class="cateitem" data-bind="${item.id }">${item.label}</a></li>
				         </c:forEach>
				        </ul>
				      </div><!-- /btn-group -->
      
    				</div><!-- /input-group -->
    				
    				<div class="input-group input-group-lg">
					  <span class="input-group-addon" id="basic-addon1">标签</span>
					  <input type="text" name="tags"  id="tags" value="${article.tags }" class="form-control" placeholder="多个标签请用,号隔开" aria-describedby="basic-addon1" />
					</div>
					<div class="input-group input-group-lg">
					  <span class="input-group-addon" id="basic-addon1">文件名</span>
					  <input type="text" name="mdFileName"  id="mdFileName" value="${article.mdFileName }" class="form-control" placeholder="用以生产.md文件时所用的文件名，建议英文" aria-describedby="basic-addon1" />
					</div>
				</div>
			</div> --%>
									
			<div class="input-group input-group-lg">
				<span class="input-group-addon" id="basic-addon1">正文</span>	  
				<textarea  id="content" name="content" data-provide="markdown" rows="10" placeholder="这里输入内容,支持Markdown语法.">${article.mdContent}</textarea>		
			</div>
			<input type="file" id="reFile" name="reFile" onchange="ajaxFileUpload(this)"/>
		    <input type="button" value="上传" id="upload"/>
			
			<input type="hidden" id="remoteFile" name="remoteFile" />
			
			<!-- <p><button type="button" class="btn btn-lg btn-default" id="save">保存</button></p> -->
			<div id="app"></div>
		</div>
		
	</div>
<script type="text/javascript">
var i = 0;
function ajaxFileUpload(fileObj) {
  if (i < 3) {
    var allowExtention = ".jpg,.bmp,.gif,.png,.pdf,.txt"; //允许上传文件的后缀名document.getElementById("hfAllowPicSuffix").value;
    var extention = fileObj.value.substring(fileObj.value.lastIndexOf(".") + 1).toLowerCase();
    var browserVersion = window.navigator.userAgent.toUpperCase();
    if (allowExtention.indexOf(extention) > -1) {
      
    } else {
      alert("仅支持" + allowExtention + "为后缀名的文件!");
      fileObj.value = ""; //清空选中文件
      if (browserVersion.indexOf("MSIE") > -1) {
        fileObj.select();
        document.selection.clear();
      }
      fileObj.outerHTML = fileObj.outerHTML;
    }
  } else {
    alert("最多可上传三张图片");
  }
}
</script>
</body>
</html>
