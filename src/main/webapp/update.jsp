<%-- 
    Document   : update
    Created on : 5 dic. 2023, 20:45:38
    Author     : Asus
--%>

<%@page import="org.apache.http.HttpResponse"%>
<%@page import="org.apache.http.client.methods.HttpPut"%>
<%@page import="org.apache.http.impl.client.HttpClientBuilder"%>
<%@page import="org.apache.http.client.HttpClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getMethod().equals("POST")) {
        try {
            String url = "http://localhost/apiphp/api.php";
            HttpClient cliente = HttpClientBuilder.create().build();
            HttpPut put = new HttpPut(url + "?cedula=" + request.getParameter("cedula") + "&nombre="
                    + request.getParameter("nombre") + "&apellido=" + request.getParameter("apellido")
                    + "&direccion=" + request.getParameter("direccion") + "&telefono=" + request.getParameter("telefono"));
            HttpResponse respuesta = cliente.execute(put);
            if (respuesta != null) {
                response.sendRedirect("index.jsp");
            } else {
                out.print("<br>");
                out.print("<div class=\"alert alert-success text-center m-4\" role=\"alert\">Fallo</div>");
            }
        } catch (Exception e) {
            out.print(e);
        }
    }
%>
