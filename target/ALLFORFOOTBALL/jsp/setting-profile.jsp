<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/2/27
  Time: 15:56
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <link href="${pageContext.request.contextPath}/img/logo-2.png" rel="shortcut icon"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/navbar-default.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user-info.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ImgCropping.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cropper.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-select.min.css">

    <script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"
            charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/cropper.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-select.min.js" type="text/javascript"
            charset="utf-8"></script>

    <%--select2插件CDN--%>
    <link href="${pageContext.request.contextPath}/css/select2.min.css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/js/select2.min.js"></script>

    <%--表单验证--%>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>


    <meta charset="utf-8"/>
    <title>懂球儿</title>
</head>
<style>
    .navbar-brand img {
        display: inline-block;
    }

    .modal input {
        width: 200px;
    }

    .editing {
        display: none;
    }

</style>
<script>
    $(function () {
        /**
         *
         * select2 配置
         */
        $(".js-data-example-ajax").select2({
            placeholder: '俱乐部选择',
//            data: [{id: 0, text: 'story'},{id: 1, text: 'bug'},{id: 2, text: 'task'}],
//          参考地址：https://select2.org/data-sources/ajax
            ajax: {
                url: '/club/searchSelect2Club',
                dataType: 'json',
                data: function (params) {
                    return {
                        search: params.term, // search term 请求参数 ， 请求框中输入的参数
                        page: params.page
                    };
                },
                delay: 400,
                processResults: function (data, params) {
                    //返回的选项必须处理成以下格式
                    //var results =  [{ id: 0, text: 'enhancement' }, { id: 1, text: 'bug' }, { id: 2, text: 'duplicate' }, { id: 3, text: 'invalid' }, { id: 4, text: 'wontfix' }];
                    var results = data
                    return {
                        results: results  //必须赋值给results并且必须返回一个obj
                    };
                },
                cache: true
                // Additional AJAX parameters go here; see the end of this chapter for the full code of this example
            }
        });

        /**
         * 表单验证
         */
        $('#settingProfileForm').validate({
            rules: {
                name: {
                    rangelength: [0, 10]
                }
            },
            messages: {
                name: {
                    rangelength: "请输入10位以内用户姓名"
                }
            }
        })
    })


    function editingBtn() {
        var spans = $(".userinfo-edit-item-right").children("span")
        spans.hide()
        $(".editing").show()
    }

    function saveBtn() {
        if ($("#settingProfileForm").valid()) {
            var spans = $(".userinfo-edit-item-right").children("span")
            spans.show()
            $(".editing").hide()
            var imgUrl = $("#finalImg").attr("src")
            var userId = '${user.id}'
            var name = $("#name").val()
            var sex = $("input[name=sex]:checked").val()
            var clubId = $(".js-data-example-ajax").select2("val")
            var profile = $("#profile").val()
            $.ajax({
                data: {
                    id: userId,
                    name: name,
                    sex: sex,
                    imgUrl:imgUrl,
                    "club.id": clubId,
                    profile: profile
                },
                type:"POST",
                url: '/user/updateUser',
                success: function (res) {
                    if(res.code==-1){
                        alert('后台请求出错')
                    }else {
                        window.location.href="/user/setting/info"
                    }

                }
            })
        }
    }
</script>

<body>
<%@include file="head.jsp" %>
<!--主体-->
<div class="container userinfo">
    <div class="row" style="margin-bottom: 30px">
        <ul class="nav nav-tabs nav-justified" style="background-color:rgb(220,220,220)">
            <li class="active"><a href="/user/setting/info">基本资料</a></li>
            <li><a href="/user/setting/bind">账号绑定</a></li>
            <li><a href="/user/setting/modifyPwd">密码修改</a></li>
        </ul>
    </div>
    <div class="row">
        <form method="post" name="settingProfileForm" id="settingProfileForm">
            <div class="col-md-2">
                <!--头像-->
                <div style="width: 150px;height: 150px;border: solid 1px beige">
                    <img id="finalImg" alt="请上传头像" src="${user.imgUrl}" style="width: 150px;height: 150px">
                </div>
                <div class="editing">
                    <button class="l-btn" style="margin-left: 33px;margin-top: 5px" id="replaceImg">更换头像</button>
                </div>
            </div>
            <div class="col-md-10">
                <div class="userinfo-head">
                    <!--昵称-->
                    <h1>${user.nickname}</h1>
                </div>
                <div class="userinfo-edit-fileds">
                    <div class="userinfo-edit-item">
                        <span class="col-md-2">姓名</span>
                        <div class="col-md-8 userinfo-edit-item-right">
                            <!--姓名-->
                            <span>${user.name}</span>
                            <div class="editing">
                                <input id="name" name="name" type="text" class="form-control" placeholder="请输入姓名"
                                       value="${user.name}">
                            </div>
                        </div>
                    </div>
                    <div class="userinfo-edit-item">
                        <span class="col-md-2">性别</span>
                        <div class="col-md-8 userinfo-edit-item-right">
                            <c:if test="${user.sex==1}">
                                <span>男</span>
                            </c:if>
                            <c:if test="${user.sex==2}">
                                <span>女</span>
                            </c:if>
                            <div class="editing">
                                <c:if test="${user.sex==null}">
                                    <label class="radio-inline">
                                        <input type="radio" name="sex" value="1"><span>男</span>
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="sex" value="2"><span>女</span>
                                    </label>
                                </c:if>
                                <c:if test="${user.sex==1}">
                                    <label class="radio-inline">
                                        <input type="radio" name="sex" value="1" checked><span>男</span>
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="sex" value="2"><span>女</span>
                                    </label>
                                </c:if>
                                <c:if test="${user.sex==2}">
                                    <label class="radio-inline">
                                        <input type="radio" name="sex" value="1"><span>男</span>
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="sex" value="2" checked><span>女</span>
                                    </label>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <div class="userinfo-edit-item">
                        <span class="col-md-2">主队</span>
                        <div class="col-md-8 userinfo-edit-item-right">
                            <c:if test="${user.club.name!=null}">
                                <span>
                                    <img src="${user.club.imgUrl}" style="margin-bottom: 3px">&nbsp;${user.club.name}
                                </span>
                            </c:if>
                            <div class="editing">
                                <select name="clubId" class="js-data-example-ajax">
                                    <option value="${user.club.id}">${user.club.name}</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="userinfo-edit-item">
                        <span class="col-md-2">简介</span>
                        <div class="col-md-8 userinfo-edit-item-right">
                            <span>${user.profile}</span>
                            <div class="editing">
                            <textarea id="profile" name="profile" cols="30" rows="3" class="form-control"
                                      style="resize: none;">${user.profile}</textarea>
                            </div>

                        </div>
                    </div>
                    <div class="userinfo-edit-item">
                        <span class="col-md-2">注册时间</span>
                        <div class="col-md-8 userinfo-edit-item-right">
                            <p style="font-size: 18px;color: #ff3b59;">${user.createTime}</p>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="row">
        <div class="col-md-12" style="margin-top: 10px;">
            <a class="btn btn-primary" style="margin-left: 450px" onclick="editingBtn()">编辑</a>
            <a class="btn btn-success" style="margin-left: 20px" onclick="saveBtn()">保存</a>
        </div>
    </div>
</div>

<!--图片裁剪框 start-->
<div style="display: none" class="tailoring-container">
    <div class="black-cloth" onclick="closeTailor(this)"></div>
    <div class="tailoring-content">
        <div class="tailoring-content-one">
            <label title="上传图片" for="chooseImg" class="l-btn choose-btn">
                <input type="file" accept="image/jpg,image/jpeg,image/png" name="file" id="chooseImg" class="hidden"
                       onchange="selectImg(this)">
                选择图片
            </label>
            <div class="close-tailoring" onclick="closeTailor(this)">×</div>
        </div>
        <div class="tailoring-content-two">
            <div class="tailoring-box-parcel">
                <img id="tailoringImg">
            </div>
            <div class="preview-box-parcel">
                <p>图片预览：</p>
                <div class="square previewImg"></div>
                <div class="circular previewImg"></div>
            </div>
        </div>
        <div class="tailoring-content-three">
            <button class="l-btn cropper-reset-btn">复位</button>
            <button class="l-btn cropper-rotate-btn">旋转</button>
            <button class="l-btn cropper-scaleX-btn">换向</button>
            <button class="l-btn sureCut" id="sureCut">确定</button>
        </div>
    </div>
</div>
<!--图片裁剪框 end-->
<script>
    //弹出框水平垂直居中
    (window.onresize = function () {
        var win_height = $(window).height();
        var win_width = $(window).width();
        if (win_width <= 768) {
            $(".tailoring-content").css({
                "top": (win_height - $(".tailoring-content").outerHeight()) / 2,
                "left": 0
            });
        } else {
            $(".tailoring-content").css({
                "top": (win_height - $(".tailoring-content").outerHeight()) / 2,
                "left": (win_width - $(".tailoring-content").outerWidth()) / 2
            });
        }
    })();

    //弹出图片裁剪框
    $("#replaceImg").on("click", function () {
        $(".tailoring-container").toggle();
        return false;
    });

    //图像上传
    function selectImg(file) {
        if (!file.files || !file.files[0]) {
            return;
        }
        var reader = new FileReader();
        reader.onload = function (evt) {
            var replaceSrc = evt.target.result;
            //更换cropper的图片
            $('#tailoringImg').cropper('replace', replaceSrc, false);//默认false，适应高度，不失真
        }
        reader.readAsDataURL(file.files[0]);
    }

    //cropper图片裁剪
    $('#tailoringImg').cropper({
        aspectRatio: 1 / 1,//默认比例
        preview: '.previewImg',//预览视图
        guides: false,  //裁剪框的虚线(九宫格)
        autoCropArea: 0.5,  //0-1之间的数值，定义自动剪裁区域的大小，默认0.8
        movable: false, //是否允许移动图片
        dragCrop: true,  //是否允许移除当前的剪裁框，并通过拖动来新建一个剪裁框区域
        movable: true,  //是否允许移动剪裁框
        resizable: true,  //是否允许改变裁剪框的大小
        zoomable: false,  //是否允许缩放图片大小
        mouseWheelZoom: false,  //是否允许通过鼠标滚轮来缩放图片
        touchDragZoom: true,  //是否允许通过触摸移动来缩放图片
        rotatable: true,  //是否允许旋转图片
        crop: function (e) {
            // 输出结果数据裁剪图像。
        }
    });
    //旋转
    $(".cropper-rotate-btn").on("click", function () {
        $('#tailoringImg').cropper("rotate", 45);
    });
    //复位
    $(".cropper-reset-btn").on("click", function () {
        $('#tailoringImg').cropper("reset");
    });
    //换向
    var flagX = true;
    $(".cropper-scaleX-btn").on("click", function () {
        if (flagX) {
            $('#tailoringImg').cropper("scaleX", -1);
            flagX = false;
        } else {
            $('#tailoringImg').cropper("scaleX", 1);
            flagX = true;
        }
        flagX != flagX;
    });

    //裁剪后的处理
    $("#sureCut").on("click", function () {
        if ($("#tailoringImg").attr("src") == null) {
            return false;
        } else {
            var cas = $('#tailoringImg').cropper('getCroppedCanvas');//获取被裁剪后的canvas
            var base64url = cas.toDataURL('image/png'); //转换为base64地址形式
            $("#finalImg").prop("src", base64url);//显示为图片的形式

            console.log(base64url)

            var index = base64url.indexOf(',')
            console.log("index=" + index)
            base64url = base64url.substr(0, index)

            //关闭裁剪框
            closeTailor();
        }
    });

    //关闭裁剪框
    function closeTailor() {
        $(".tailoring-container").toggle();
    }


</script>

<%@include file="bottom.jsp" %>
</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/head.js"></script>

