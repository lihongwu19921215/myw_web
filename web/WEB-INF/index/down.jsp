
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String path = request.getContextPath();
%>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

    <title>CMS</title>

    <link href="<%=path%>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path%>/css/starter-template.css" rel="stylesheet">
    <link href="<%=path%>/css/carousel.css" rel="stylesheet">

</head>
<body>



<jsp:include page="top.jsp"></jsp:include>


<div class="container" style="margin-top: 20;">

    <div class="row">

        <div class="col-xs-12 col-sm-9">
            <div>
                <img src="<%=path%>/img/qqdown.jpg" alt="">
            </div>
        </div><!--/span-->
    </div><!--/row-->

    <br/>
    <br/>

    <div class="footer">
        <div class="row">


            <div class="col-md-12">
                合作伙伴:
                <span style="margin-left: 20px;">青年旅行社</span>
                <span style="margin-left: 20px;">青年旅行社</span>
                <span style="margin-left: 20px;">青年旅行社</span>
                <span style="margin-left: 20px;">青年旅行社</span>
                <span style="margin-left: 20px;">青年旅行社</span>
                <span style="margin-left: 20px;">青年旅行社</span>
                <span style="margin-left: 20px;">青年旅行社</span>
            </div>

            <div class="col-md-12">
                <p>友情链接
                    <span style="margin-left: 20px;">人民网</span>
                    <span style="margin-left: 20px;">CCTV</span>
                    <span style="margin-left: 20px;">人民网</span>
                    <span style="margin-left: 20px;">CCTV</span>
                    <span style="margin-left: 20px;">人民网</span>
                    <span style="margin-left: 20px;">CCTV</span>
                    <span style="margin-left: 20px;">人民网</span>
                    <span style="margin-left: 20px;">CCTV</span>
                    <span style="margin-left: 20px;">人民网</span>
                    <span style="margin-left: 20px;">CCTV</span>

            </div>

            <div class="col-md-12">
                <p>&copy; 募游网 2013</p>
            </div>
        </div>
    </div>

</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="http://cdn.bootcss.com/holder/2.0/holder.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=path%>/js/offcanvas.js"></script>


</body>
</html>