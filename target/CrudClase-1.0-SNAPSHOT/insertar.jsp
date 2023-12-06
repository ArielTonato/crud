<%-- 
    Document   : insertar
    Created on : 5 dic. 2023, 19:18:03
    Author     : Asus
--%>
<%@page import="org.apache.http.impl.client.HttpClientBuilder"%>
<%@page import="org.apache.http.HttpResponse"%>
<%@page import="org.apache.http.client.entity.UrlEncodedFormEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.http.message.BasicNameValuePair"%>
<%@page import="org.apache.http.client.methods.HttpPost"%>
<%@page import="org.apache.http.client.HttpClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form method="POST" style="width: 50%;"> 
    <div class="mb-3">
        <label for="cedula" class="form-label">Cedula: </label>
        <input type="text" class="form-control" id="cedula" name="cedula" required>
    </div>
    <div class="mb-3">
        <label for="nombre" class="form-label">Nombre: </label>
        <input type="text" class="form-control" id="nombre" name="nombre" required>
    </div>
    <div class="mb-3">
        <label for="apellido" class="form-label">Apellido: </label>
        <input type="text" class="form-control" id="apellido" name="apellido" required>
    </div>
    <div class="mb-3">
        <label for="direccion" class="form-label">Direccion: </label>
        <input type="text" class="form-control" id="direccion" name="direccion" required>
    </div>
    <div class="mb-3">
        <label for="telefono" class="form-label">Telefono: </label>
        <input type="telefono" class="form-control" id="telefono" name="telefono" required>
    </div>
    <button type="submit" class="btn btn-primary">Ingresar</button>
</form>
<%
    if (request.getMethod().equals("POST")) {
        try {
            String url = "http://localhost/apiphp/api.php";
            String cedula = request.getParameter("cedula");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String direccion = request.getParameter("direccion");
            String telefono = request.getParameter("telefono");
            HttpClient cliente = HttpClientBuilder.create().build();
            HttpPost post = new HttpPost(url);
            ArrayList<BasicNameValuePair> parametros = new ArrayList<>();
            parametros.add(new BasicNameValuePair("cedula", cedula));
            parametros.add(new BasicNameValuePair("nombre", nombre));
            parametros.add(new BasicNameValuePair("apellido", apellido));
            parametros.add(new BasicNameValuePair("direccion", direccion));
            parametros.add(new BasicNameValuePair("telefono", telefono));
            post.setEntity(new UrlEncodedFormEntity(parametros));
            HttpResponse respuesta = cliente.execute(post);
            if (respuesta != null) {
                out.print("<br>");
                out.print("<div class=\"alert alert-success text-center m-4\" role=\"alert\">Registrado con exito</div>");
            }
        } catch (Exception e) {
            out.print("<br>");
            out.print("<div class=\"alert alert-success text-center m-4\" role=\"alert\">Fallo</div>");
        }

    }
%>