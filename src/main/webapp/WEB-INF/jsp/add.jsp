<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/1/30
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--标签标签库 -->
<!--函数标签 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bills.css" />
</head>

<body>
<div id="div2">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">记账</h1>
            </div>
        </div>
    </div>
    <div class="container">
        <form id="myform1" class="form-horizontal">
            <label id="type">类型</label>
            <div class="panel panel-default">
                <div class="panel-body">
                    <label class="radio-inline">
                        <input type="radio" name="billsType.id"  value="1"> 支出
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="billsType.id" value="2"> 收入
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="billsType.id"  value="3"> 转账
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="billsType.id" value="4"> 借出
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="billsType.id"  value="5"> 借入
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="billsType.id"  value="6"> 还入
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="billsType.id"  value="7"> 还出
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label >标题</label>
                <input id="title" name="title" type="text" class="form-control" >
            </div>
            <div  id="msg" style="color: red;margin-left: 900px;margin-top: -18px;display: none"></div>
            <%--<div class="form-group">--%>
                <%--<label  for="">日期</label>--%>
                <%--<input type="date" class="form-control" id="date">--%>
            <%--</div>--%>
            <div class="form-group">
                <label  >金额</label>
                <input id="price" name="price" type="text" class="form-control">
            </div>
            <div  id="pricemsg" style="color: red;margin-left: 890px;margin-top: -18px;display: none"></div>
            <div class="form-group">
                <label >说明</label>
                <textarea name="content" class="form-control" rows="3"></textarea>
            </div>
    </div>
    <div  id="btn">
        <input type="reset" class="btn btn-jizhang" value="重置"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="save" type="button" class="btn btn-primary" value="保存"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="/bills/index.action"><input type="button" class="btn btn-info" value="返回"></input></a>
    </div>

    </form>
</div>

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script>

    $(function () {
        $("#save").click(function () {
            var type=$("input:radio[name='billsType.id']:checked").val()
            if(type==null){
                alert("请选择记账类型")
                return false;
            }

            if($("#title").val()==""){
                    $("#msg").html("标题不能为空")
                $("#msg").fadeIn(600)
                $("#msg").fadeOut()
                return false;
            }
            if($("#price").val()==""){
                $("#pricemsg").html("金额不能为空")
                $("#pricemsg").fadeIn(600)
                $("#pricemsg").fadeOut()
                return false;
            }

            $.ajax({
                url:"${pageContext.request.contextPath}/bills/insert.action",
                Type:"post",
                data:($("#myform1").serialize()),
                dataType:"json",
                success: (function (data) {
                    if (data == 0) {
                        alert("记账成功")
                        window.location.reload()
                    }
                })
            })
        })
    })

</script>
</body>

</html>
