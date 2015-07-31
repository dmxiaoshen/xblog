<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%@ include file="common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" href="${ctx}/sites/deqin.com/files/favicon.ico" type="image/x-icon" />
		<script type="text/javascript">
		var ctx='${ctx}';
		</script>
		
		<link type="text/css" rel="stylesheet" media="all" href="${ctx}/sites/deqin.com/files/css/css_608f44634fc0bf6ff4af5e890ab18ae1.css" />
		<link type="text/css" rel="stylesheet" media="print" href="${ctx}/sites/deqin.com/files/css/css_31b485cd91f1c9345e70b363802df234.css" />
		<!--[if IE]>
		<link type="text/css" rel="stylesheet" media="all" href="${ctx}/themes/corporate/css/ie.css-4.css" />
		<![endif]-->
		<!--[if lte IE 6]>
		<link type="text/css" rel="stylesheet" media="all" href="${ctx}/themes/corporate/css/ie6.css-4.css" />
		<![endif]-->
		  <!-- Fonts START -->
		  <link href="http://fonts.useso.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css" />
		  <!-- Fonts END -->
		  
		  <!-- Global styles START -->          
		  <link href="${ctx}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
		  <link href="${ctx}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
		  <!-- Global styles END --> 
   
		  <!-- Page level plugin styles START -->
		  <link href="${ctx}/assets/global/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet" />
		  <link href="${ctx}/assets/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.css" rel="stylesheet" />
		  <link href="${ctx}/assets/global/plugins/slider-revolution-slider/rs-plugin/css/settings.css" rel="stylesheet" />
		  <!-- Page level plugin styles END -->

		  <!-- Theme styles START -->
		  <link href="${ctx}/assets/global/css/components.css" rel="stylesheet" />
		  <link href="${ctx}/themes/corporate/frontend/layout/css/style.css" rel="stylesheet" />
		  <link href="${ctx}/themes/corporate/frontend/pages/css/style-revolution-slider.css" rel="stylesheet" /><!-- metronic revo slider styles -->
		  <link href="${ctx}/themes/corporate/frontend/layout/css/style-responsive.css" rel="stylesheet" /> 
		  <link href="${ctx}/themes/corporate/frontend/layout/css/custom.css" rel="stylesheet" />
				
		<script src="${ctx }/assets/global/plugins/jquery-2.1.1.min.js" type="text/javascript"></script>
	    <script src="${ctx }/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
	    <script src="${ctx }/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>      
	    <script src="${ctx }/assets/frontend/layout/scripts/back-to-top.js" type="text/javascript"></script>
	    <!-- END CORE PLUGINS -->

	    <!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
	    <script src="${ctx }/assets/global/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
	    <script src="${ctx }/assets/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.min.js" type="text/javascript"></script><!-- slider for products -->
	
	    <!-- BEGIN RevolutionSlider -->
  
	    <%-- <script src="${ctx }/assets/global/plugins/slider-revolution-slider/rs-plugin/js/jquery.themepunch.revolution.min.js" type="text/javascript"></script> --%> 
	    <%-- <script src="${ctx }/assets/global/plugins/slider-revolution-slider/rs-plugin/js/jquery.themepunch.tools.min.js" type="text/javascript"></script> --%> 
	    <%-- <script src="${ctx }/themes/corporate/frontend/pages/scripts/revo-slider-init.js" type="text/javascript"></script> --%>
	    <!-- END RevolutionSlider -->

	   <%--  <script src="${ctx }/themes/corporate/frontend/layout/scripts/layout.js" type="text/javascript"></script> --%>
			<script type="text/javascript">
			$.fn.extend({
				nextX:function(expr,untilExpr){
					var t=this.next();
					while(!t.is(expr)){
						t=t.next();
						if(!t.length||t.is(untilExpr)){
							return $([]);
						}
					}
					return t;
				},
				prevX:function(expr,untilExpr){
					var t=this.prev();
					while(!t.is(expr)){
						t=t.prev();
						if(!t.length||t.is(untilExpr)){
							return $([]);
						}
					}
					return t;
				}
			});
			</script>
		
	    <script type="text/javascript">
	        jQuery(document).ready(function() {
	            //Layout.init();    
	            //Layout.initOWL();
	            //RevosliderInit.initRevoSlider();
	            //Layout.initTwitter();
	            //Layout.initFixHeaderWithPreHeader(); /* Switch On Header Fixing (only if you have pre-header) */
	            //Layout.initNavScrolling(); 
				//$("#style-color").attr("href","/themes/corporate/frontend/layout/css/themes/red.css");
	        });
	    </script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->
    
     <link href="${ctx}/themes/corporate/frontend/layout/css/themes/blue.css" rel="stylesheet" id="style-color" />
   <style>
		body {
		    background: none repeat scroll 0 0 #FFF;
		}
		#content{
		padding:20px;
		}
		.header {
		    background: url("${ctx}/sites/s000009.cinics.com/files/upload/image/bg_001.png") repeat-x scroll 0 -17px rgba(0, 0, 0, 0);
		}
		
		.header-navigation > ul > li > a {
		    color: #333;
		    display: block;
		    padding: 10px 20px 23px;
		
		}
   </style>
</head>
</html>
