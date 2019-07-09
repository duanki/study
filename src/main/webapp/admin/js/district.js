$(function () {
    $("#dg").datagrid({
        title:"区域信息",
        url:'getDistrict',
        pagination:true,  //启动分页
        pageList:[3,5,10],
        pageSize: 3,
        toolbar:"#ToolBar",
        rownumbers:true, //显示行号
        //singleSelect:true, //单行选择
        columns:[[
            {field:'ck',checkbox:'true',width:100},
            {field:'id',title:'区域编号',width:100},
            {field:'name',title:'区域名称',width:100},
            {field:'op',title:'操作',width:100,
                formatter:function(value,row,index){
                    return '<a href="javascript:DeleteDistrict('+row.id+')" class="easyui-linkbutton"\n' +
                        '                            iconCls="icon-ok">删除</a>';
                }
            }
        ]]
    });
});

//打开添加对话框
function Add(id,title) {
    $("#"+id).dialog("open").dialog("setTitle",title);
}
/*关闭对话框*/
function CloseDialog(id){
    $("#"+id).dialog("close");
}

//实现添加操作
function AddSaveDialog() {
    $("#addDialogForm").form('submit',{
        url:"addDistrict",
        success:function (data) {
            data=$.parseJSON(data);
            if(data.result==1){
                $("#AddDialog").dialog("close");
                $('#dg').datagrid('reload');
                $.messager.alert('提示框','添加成功！','info');
            }else{
                $.messager.alert('提示框','添加失败！','info');
            }
        }
    });
}

//打开修改对话框
function ModifyBySelect() {
    var selectRows = $("#dg").datagrid('getSelections');
    if(selectRows.length!=1){
        $.messager.alert('提示框','操作有误,请选一行做修改!','info');
        return;
    }
    $("#UpDialog").dialog("open").dialog("setTitle","修改区域");

    var row=selectRows[0];
    $.post("getSingleDistrict",{"id":row.id},function (data) {
        $('#upDialogForm').form('load',data);
    },"json");
}

//实现修改操作
function UpSaveDialog() {
    $("#upDialogForm").form('submit',{
        url:"upDistrict",
        success:function (data) {
            data=$.parseJSON(data);
            if(data.result==1){
                $("#UpDialog").dialog("close");
                $('#dg').datagrid('reload');
                //$.messager.alert('提示框','修改成功！','info');
            }else{
                $.messager.alert('提示框','修改失败！','info');
            }
        }
    });
}

function DeleteDistrict(obj) {
    $.messager.confirm('提示框','确定要删除吗?',function (del) {
        if(del) {
            $.post("deleteDistrict", {"id": obj}, function (data) {
                if (data.result == 1) {
                    $('#dg').datagrid('reload');
                } else {
                    $.messager.alert('提示框', '删除失败!', 'info');
                }
            }, "json");
        }
    });
}

function DeleteMoreById() {
    //获取选中行
    var selectRows = $("#dg").datagrid('getSelections');
    if(selectRows==0){
        $.messager.alert('提示框', '你没有选择删除的行', 'info');
        return;
    }
    //确认删除
    $.messager.confirm('提示框','确定要删除吗?',function (flag) {
        if(flag) {  //点确定,返回的flag为true实现删除, 点击取消,返回的flag为flase
            var value="";
            for(var i=0;i<selectRows.length;i++){
                value = value+selectRows[i].id+',';
            }

            value = value.substring(0,value.length-1);
            //发送异步请求到服务器
            $.post("deleteMoreDistrict",{"id":value},function (data) {
                if(data.result>0){
                    $('#dg').datagrid('reload');
                }else{
                    $.messager.alert('提示框','删除失败!',"info");
                }
            },"json");
        }
    });
}