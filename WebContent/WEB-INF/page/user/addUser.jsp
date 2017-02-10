<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>demo</title>
</head>
<body>
<hr></hr>
<span>${flag}</span>
<form action="<%=request.getContextPath() %>/user.do?method=add" method="post">
  <table>
    <tr>
      <td><span>用户ID</span></td>
      <td><input size="20" name="id" value="${user.id}"/></td>
    </tr>
     <tr>
      <td><span>用户名</span></td>
      <td><input size="20" name="username" value="${user.username}"/></td>
    </tr>
  </table>
</form>
</body>
</html>