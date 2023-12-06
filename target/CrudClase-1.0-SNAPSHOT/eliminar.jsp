<%-- 
    Document   : eliminar
    Created on : 5 dic. 2023, 20:56:27
    Author     : Asus
--%>

<%@page import="org.apache.http.HttpResponse"%>
<%@page import="org.apache.http.client.methods.HttpDelete"%>
<%@page import="org.apache.http.impl.client.HttpClientBuilder"%>
<%@page import="org.apache.http.client.HttpClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try {
        String url = "http://localhost/apiphp/api.php";
        HttpClient cliente = HttpClientBuilder.create().build();
        HttpDelete delete = new HttpDelete(url + "?cedula=" + request.getParameter("cedula"));
        HttpResponse respuesta = cliente.execute(delete);
        if (respuesta != null) {
            response.sendRedirect("index.jsp");
        } else {
            out.print("<br>");
            out.print("<div class=\"alert alert-success text-center m-4\" role=\"alert\">Fallo</div>");
        }
    } catch (Exception e) {
        out.print(e);
    }
%>