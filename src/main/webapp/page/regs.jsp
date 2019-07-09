<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" >
<!-- saved from url=(0049)http://localhost:8080/HouseRent/page/register.jsp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>青鸟租房 - 用户注册</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type><LINK 
rel=stylesheet type=text/css href="../css/style.css">
<META name=GENERATOR content="MSHTML 8.00.7601.17514">
  <script language="JavaScript" src="../admin/js/jquery-1.8.3.js"></script>
  <script language="JavaScript">
   $(function () {
       $("#uname").blur(function () {
           var userName=$("#uname").val();
           if (userName != "") {
               $.post("checkName",{"name":userName},function (data) {
                   if (data.result==1){
                       $("#none").html("用户已存在").css("color","red");
                   } else{
                       $("#none").html("请继续注册").css("color","green");
                   }
               },"json");
           }
       });
   });

    function register() {
        if (userName == "") {
            $("#none").html("必填").css("color", "red");
            $("#uname").focus();
        }else if ($("#password").val() == "") {
            $("#password").focus();
        }else if ($("#repassword").val() == ""||($("#repassword").val()) != ($("#password").val())) {
            $("#repassword").focus();
        }else if ($("#telephone").val()==""){
            $("#telephone").focus();
        }else{
            $("#submitForm").submit();
        }
    }
  </script>
</HEAD>
<BODY>
<DIV id=header class=wrap>
<DIV id=logo><IMG src="../images/logo.gif"></DIV></DIV>
<DIV id=regLogin class=wrap>
<DIV class=dialog>
<DL class=clearfix>
  <DT>新用户注册</DT>
  <DD class=past>填写个人信息</DD></DL>
<DIV class=box>
<FORM id="submitForm" action=reg method="post">
<DIV class=infos>
<TABLE class=field>
  <TBODY>
  <TR>
    <TD class=field>用 户 名：</TD>
    <TD><INPUT class=text type=text id="uname" name=name>
    <span id="none"></span>
    </TD></TR>
  <TR>
    <TD class=field>密　　码：</TD>
    <TD><INPUT class=text id="password" type=password name=password></TD></TR>
  <TR>
    <TD class=field>确认密码：</TD>
    <TD><INPUT class=text id="repassword" type=password name=repassword> </TD></TR>
  <TR>
    <TD class=field>电　　话：</TD>
    <TD><INPUT class=text id="telephone" type=text name=telephone> </TD></TR>
  </TBODY></TABLE>
<DIV class=buttons>
<INPUT onclick="register()" value=立即注册 type=button>
</DIV></DIV></FORM></DIV></DIV></DIV>
<DIV id=footer class=wrap>
<DL>
  <DT>青鸟租房 © 2018 北大青鸟 京ICP证1000001号</DT>
  <DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD></DL></DIV></BODY></HTML>
