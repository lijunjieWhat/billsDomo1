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
    <meta charset="utf-8" />
    <title></title>
    <link rel="stylesheet" href="/css/bootstrap.css" />
    <link rel="stylesheet" href="/css/bills.css" />
</head>

<body>
<div id="div1">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">账单管理</h1>
            </div>
        </div>
    </div>
    <nav class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#show" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="panel panel-default" id="show">
                <div class="panel-body">
                    <form id="myform" action="${pageContext.request.contextPath}/bills/index.action" class="form-inline" method="post" >
                        <label for="billstype">类型</label>
                        <select class="form-control" name="billsType.id" id="billstype">

                            <option value="0">--请选择--</option>
                            <option value="1">支出</option>
                            <option value="2">收入</option>
                            <option value="3">转账</option>
                            <option value="4">借出</option>
                            <option value="5">借入</option>
                            <option value="6">还入</option>
                            <option value="7">还出</option>
                        </select>

                        <div class="form-group">
                            <label for="startdate">时间：从</label>
                            <input name="startDate" type="date" class="form-control" id="startdate">
                        </div>
                        <div class="form-group">
                            <label for="enddate">到</label>
                            <input name="endDate" type="date" class="form-control" id="enddate">
                        </div>

                        <input type="submit" class="btn btn-primary" value="搜索"></input>
                        <%--<button class="btn btn-jizhang" onclick="window.location.href='${pageContext.request.contextPath}/bills/add.action'">记账</button>--%>
                        <a href="/bills/add.action"><input type="button" class="btn btn-jizhang" value="记账"></input></a>
                    </form>
                </div>
            </div>
        </div>
    </nav>





    <div class="panel panel-default">
        <div class="panel-heading">账单信息列表</div>
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th>标题</th>
                <th>记账时间</th>
                <th>类别</th>
                <th>金额</th>
                <th>说明</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${list}" var="b">
                <tr>
                <td>${b.title}</td>
                <td>${b.date}</td>
                <td>${b.billsType.name}</td>
                <td>${b.price}</td>
                <td>${b.content}</td>
                    <td>
                        <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#billsEditDialog" onclick="editBills(${b.id})">修改</a>
                        <a href="#" class="btn btn-danger btn-xs" onclick="delete1(${b.id})">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
    <c:if test="${empty list}">
        <h1>没有找到任何账单信息！</h1>
    </c:if>
</div>

<div class="modal fade" id="billsEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改账单信息</h4>
            </div>
            <div class="modal-body">
                <form id="updateFrom">
                    <div class="form-group">
                        <label  for="recipient-name" class="control-label">标题:</label>
                        <input name="title" id="title" type="text" class="form-control" id="recipient-name">
                    </div>

                    <div class="form-group">
                        <label class="control-label">记账时间:</label>
                        <input name="date" id="date" class="form-control" type="text" placeholder="" readonly>
                    </div>
                    <label class="control-label">类别:</label>
                    <select name="billsType.id" id="typeid1" class="form-control">
                        <option value="1">支出</option>
                        <option value="2">收入</option>
                        <option value="3">转账</option>
                        <option value="4">借出</option>
                        <option value="5">借入</option>
                        <option value="6">还入</option>
                        <option value="7">还出</option>
                    </select>
                    <div class="form-group">
                        <label for="price" class="control-label">金额:</label>
                        <input name="price" id="price" type="text" class="form-control" id="price">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="control-label">说明:</label>
                        <textarea name="content" id="content" class="form-control" id="message-text"></textarea>
                    </div>
                    <input type="hidden" name="id" id="id">
                    <%--<input type="hidden" name="billsType.id" id="typeid">--%>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updateBills()">保存修改</button>
            </div>
        </div>
    </div>

</div>
<div id="page">
<nav aria-label="Page navigation">
    <ul class="pagination">
        <li>
            <a>当前页:${currentPage} / <span id="total">${totalpage}</span></a>
        </li>
        <li><a href="javascript:void(0)" onclick="pagination('first')" >首页</a></li>
        <li> <a href="javascript:void(0)" onclick="pagination('pre')" >上一页</a></li>
        <li> <a href="javascript:void(0)" onclick="pagination('next')" >下一页</a></li>
        <li> <a href="javascript:void(0)" onclick="pagination('last')" >尾页</a></li>
        <li> <a>Go<input type="text" style="height: 20px;width: 20px"  id="go" onchange="pagination('go')"></a></li>
        <form action="/bills/index.action" method="post" name="pageForm">
            <input type="hidden" id="curr" name="currentPage" value="${currentPage}">
            <input type="hidden" name="typeid" value="${vo.billsType.id}">
            <input type="hidden" name="endDate" value="${vo.endDate}">
            <input type="hidden" name="startDate" value="${vo.startDate}">
        </form>
    </ul>
</nav>

</div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function pagination(page){
        var total = document.getElementById("total").innerHTML;
        var curr = document.getElementById("curr");
        if(page == 'first'){
            curr.value = 1;
        }else if(page == 'last' ){
            if(curr.value==total){
                alert('已经是最后一页了');
                return
            }
            curr.value = total;

        }else if(page == 'pre'){
            var temp = curr.value -1;
            if(temp <=0){
                temp = 1;
            }
            curr.value = temp;
        }else if(page == 'next'){
            var temp = parseInt(curr.value) + 1;
            if(temp >= total){
                temp = total;
            }
            curr.value = temp;
        }else if(page == 'go'){
            var go = parseInt(document.getElementById("go").value);

            if(go >= 0 && parseInt(go) <= parseInt(total)){
                curr.value = go;
            }else{
                alert("输入页码有误");
                $("#go").val("")
                return;
            }
        }
        pageForm.submit();
    }
</script>

<script>
    function editBills(id) {
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/bills/edit.action",
            data:{id:id},
            dataType:"json",
            success:function (data) {
                $("#title").val(data.title)
                $("#date").val(data.date)
                $("#price").val(data.price)
                $("#content").val(data.content)
                $("#typeid1 option[value="+data.billsType.id+"]").attr("selected", true);
                $("#id").val(data.id)
                $("#typeid").val(data.billsType.id)
            }
        })


    }

    function updateBills() {
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/bills/update.action",
            data:($("#updateFrom").serialize()),
            dataType:"json",
            success:function (data) {
                if(data=="0"){
                    alert("账单信息更新成功！");
                }else{
                    alert("账单信息更新失败！");
                }
                window.location.reload();
            }
        })
    }

    function delete1(id) {
        if(confirm('确实删除此账单?')){
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/bills/delete.action",
            data:{id:id},
            dataType:"json",
            success:function (data) {
                if(data=="0"){
                    alert("删除成功！");
                }else{
                    alert("删除失败！");
                }
                window.location.reload();
            }
        })
        }
    }
</script>
</body>

</html>
