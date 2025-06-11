<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>������</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; background-color: #f5f5f5; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 20px; border-radius: 5px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h1 { color: #333; text-align: center; }
        .result-box { margin: 20px 0; padding: 15px; border-radius: 4px; }
        .success { background: #dff0d8; color: #3c763d; }
        .warning { background: #fcf8e3; color: #8a6d3b; }
        .error { background: #f2dede; color: #a94442; margin-top: 15px; padding: 10px; border-radius: 4px; }
        .stats { font-size: 18px; margin: 15px 0; }
        .btn { background: #337ab7; color: white; padding: 8px 15px; border: none; border-radius: 4px; cursor: pointer; text-decoration: none; display: inline-block; }
        .btn:hover { background: #286090; }
        .btn-group { margin-top: 20px; }
    </style>
</head>
<body>
<div class="container">
    <h1>������</h1>

    <div class="result-box success">
        <h3>�������</h3>
        <div class="stats">
            ������ ${totalCount} ����¼��
            <span style="color: green;">�ɹ� ${successCount} ��</span>��
            <c:if test="${failCount > 0}">
                <span style="color: #8a6d3b;">ʧ�� ${failCount} ��</span>
            </c:if>
        </div>
    </div>

    <c:if test="${failCount > 0}">
        <div class="error">
            <h4>������Ϣ��</h4>
            <p>${errorMessages}</p>
        </div>
    </c:if>

    <div class="btn-group">
        <a href="../ListStudentServlet.do" class="btn">�鿴ѧ���б�</a>
        <a href="../jsp/import.jsp" class="btn" style="margin-left: 10px;">��������</a>
    </div>
</div>
</body>
</html>