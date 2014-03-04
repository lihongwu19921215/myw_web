
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String path = request.getContextPath();
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

    <title>CMS</title>

    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
          rel="stylesheet" type="text/css">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

    <script src="<%=path%>/js/bootstrap3-validation.js"></script>


    <link href="<%=path%>/css/carousel.css" rel="stylesheet">

    <script src="http://cdn.bootcss.com/holder/2.0/holder.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=path%>/js/offcanvas.js"></script>
    <script src="http://ditu.google.cn/maps/api/js?sensor=false&libraries=geometry&v=3.7"></script>
    <script type="text/javascript" src="<%=path%>/js/maplace.min.js"></script>

    <style>
        #gmap {
            display: block;
            width: 600px;
            height: 400px;

        }
    </style>



</head>
<body>


<jsp:include page="top.jsp"></jsp:include>


<div class="container" style="margin-top: 20;">

    <div class="row">

        <div class="col-xs-12 col-md-12">

            <h3>行程名称：</h3>
            <div class="row">
                <div class="col-md-12">
                    <button id="addPlace" class="btn btn-success" data-toggle="modal">
                        +添加地点
                    </button>
                </div>



            </div>
            <div class="row">
                <div class="col-md-8">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>名称</th>
                            <th>添加时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="place" items="${list_place}">

                            <tr>
                                <td>${place.id}</td>
                                <td>${place.name}</td>
                                <td>${place.adddate}</td>
                                <td>
                                    <button type="button" class="btn btn-primary" onclick="addImg(${place.id})">照片管理</button>
                                    <button type="button" class="btn btn-primary" onclick="editPlace(${place.id})">编辑</button>
                                    <!--
                                    <button type="button" class="btn btn-primary">删除</button>
                                    -->
                                </td>
                            </tr>

                        </c:forEach>
                        </tbody>
                    </table>

                </div>
                <div class="col-md-4">
                </div>

            </div>



        </div>

    </div>

</div>

<jsp:include page="foot.jsp"></jsp:include>

<!-- Modal -->
<div class="modal fade" id="placeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 800px;height: 600px;">
        <div class="modal-content">

            <form class="form-horizontal" method="post" id="placeForm" action="<%=path%>/place/save" role="form">

                <input id="lat" type="hidden" name="place.lat" value="">
                <input id="lon" type="hidden" name="place.lon" value="">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">添加旅程地点</h4>
                </div>
                <div class="modal-body">
                    <div class="row">

                        <div class="col-md-12">

                            <div class="form-group">
                                <label for="name" class="col-md-2 control-label">地点名称</label>
                                <div class="col-md-6">
                                    <input type="text" name="place.name" class="form-control" id="name" placeholder="" check-type="required">
                                </div>
                            </div>

                            <div class="form-group">

                                <label for="gps" class="col-md-2 control-label">GPS</label>
                                <div class="col-md-6">
                                    <input type="text" readonly="readonly" name="place.gps" class="form-control" id="gps" placeholder="" check-type="required">
                                    <label>请点击地图确定GPS位置</label>
                                </div>


                            </div>
                        </div>
                        <div class="col-md-2">
                        </div>
                    </div>
                    <div id="mapdiv" class="container" style="margin-left: 50px;">
                        <div id="gmap" style=""></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="savePlace">保存</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


</body>
</html>


<script type="text/javascript">


    var marker;

    new Maplace({
        show_markers: false,
        locations: [{
            lat: 39.92,
            lon: 116.46,
            zoom: 8
        }],
        listeners: {
            click: function(map, e) {
                var point = e.latLng;
                $("#gps").val(point);
                $("#lat").val(e.latLng.lat());
                $("#lon").val(e.latLng.lng());

                if (marker) {
                    marker.setAnimation(google.maps.Animation.DROP);
                    marker.setPosition(e.latLng);
                } else {
                    marker = new google.maps.Marker({
                        position: e.latLng,
                        animation: google.maps.Animation.DROP,
                        map: map});
                }


//                var geocoder = new google.maps.Geocoder();
//                geocoder.geocode({'latLng':point},function(result,status){
//                    alert(result[0].formatted_address +'   ' + result[1].formatted_address + '  ' + result[2].formatted_address + ' ' + result[3].formatted_address + ' ');
//                    var pos = "";
//                    if (status != google.maps.GeocoderStatus.OK) {
//                        pos = "位置信息不可用("+retvalue[ncount].Latitude+","+retvalue[ncount].Longitude+")";
//                    }
//                    else{
//                        pos = result[0].formatted_address;
//                    }
//                    alert(pos);
//                });

            }
        }
    }).Load();


    $(function(){
        $("#addPlace").on('click',function(event){
            $('#place').val();
            $('#gps').val();
            $('#placeModal').modal('show');
        });

        //flight
        $("#placeForm").validation();
        $("#savePlace").on('click',function(event){
            if ($("#placeForm").valid()==false){
                $("#error-text").text("填写信息不完整。")
                return false;
            }else{
                $("#placeForm").submit();
            }
        });
    });


    function onCreate()
    {
        location.href = '<%=path%>/';
    }
    function addImg(placeid)
    {
        location.href='<%=path%>/upload/'+placeid;
    }
    function editPlace(placeid)
    {
        alert(placeid);
        $('#myModal').modal('show');

    }
</script>