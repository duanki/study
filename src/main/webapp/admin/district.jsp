<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyUI/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyUI/css/demo.css">
    <script src="js/jquery-1.8.3.js"></script>
    <!--jquery.easyui.min.js包含了easyUI中的所有插件-->
    <script src="js/jquery.easyui.min.js"></script>
    <script type="application/javascript" language="JavaScript" src="js/district.js"></script>
</head>
<body>
    <table id="dg"></table>
    <%--工具栏,链接按钮--%>
    <div id="ToolBar">
        <div style="height: 40px">
            <a href="javascript:Add('AddDialog','区域添加')" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
            <a href="javascript:ModifyBySelect()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
            <a href="javascript:DeleteMoreById()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">批量删除</a>
        </div>
    </div>

    <%--添加对话框--%>
    <div id="AddDialog" class="easyui-dialog" buttons="#AddDialogButtons"
         style="width: 280px; height: 250px; padding: 10px 20px;" closed="true">
        <form id="addDialogForm" method="post">
            <table>
                <tr>
                    <td>区域名称:</td>
                    <td><input type="text" class="easyui-validatebox" required
                               name="name" id="bname" /></td>
                </tr>
            </table>
        </form>
    </div>

    <%--定义增加区域对话框中的按钮--%>
    <div id="AddDialogButtons">
    <a href="javascript:AddSaveDialog()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:CloseDialog('AddDialog')" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
    </div>

    <%--修改对话框--%>
    <div id="UpDialog" class="easyui-dialog" buttons="#UpDialogButtons"
         style="width: 280px; height: 250px; padding: 10px 20px;" closed="true">
        <form id="upDialogForm" method="post">
            <table>
                <tr>
                    <td>区域编号:</td>
                    <td><input type="text" readonly style="border: none" class="easyui-validatebox" required
                               name="id" id="gid" /></td>
                </tr>
                <tr>
                    <td>区域名称:</td>
                    <td><input type="text" class="easyui-validatebox" required
                               name="name" id="gname" /></td>
                </tr>
            </table>
        </form>
    </div>

    <%--定义修改区域对话框中的按钮--%>
    <div id="UpDialogButtons">
        <a href="javascript:UpSaveDialog()" class="easyui-linkbutton" iconCls="icon-ok">更新</a>
        <a href="javascript:CloseDialog('UpDialog')" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
    </div>
</body>
</html>
