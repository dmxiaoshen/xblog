<%@ page pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/zbase/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><decorator:title /></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<page:applyDecorator name="header" page="/WEB-INF/jsp/zbase/admin-head.jsp" />
<decorator:head />
</head>
<body class="corporate">
<jsp:include page="/WEB-INF/jsp/zbase/admin-header.jsp" flush="true" />
<div class="container-fluid">
		<div class="row">
		<jsp:include page="/WEB-INF/jsp/zbase/admin-left.jsp" flush="true" />
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<decorator:body />
		</div>
		</div>
</div>
</body>
</html>
