<%-- 
    Document   : actualizar
    Created on : 5 dic. 2023, 20:25:59
    Author     : Asus
--%>

<%@page import="org.json.JSONArray"%>
<%@page import="org.apache.http.HttpEntity"%>
<%@page import="org.apache.http.util.EntityUtils"%>
<%@page import="org.apache.http.HttpResponse"%>
<%@page import="org.apache.http.client.methods.HttpGet"%>
<%@page import="org.apache.http.impl.client.HttpClientBuilder"%>
<%@page import="org.apache.http.client.HttpClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id="", nombre="", apellido="", direccion="", telefono="";
    try {
        id = request.getParameter("cedula");
        String url = "http://localhost/apiphp/api.php?buscar="+id;
        HttpClient cliente = HttpClientBuilder.create().build();
        HttpGet get = new HttpGet(url);
        HttpResponse respuesta = cliente.execute(get);
        HttpEntity entity = respuesta.getEntity();
        String responseString = EntityUtils.toString(entity);
        JSONArray array = new JSONArray(responseString);
        nombre = array.getJSONObject(0).getString("nombre");
        apellido = array.getJSONObject(0).getString("apellido");
        direccion = array.getJSONObject(0).getString("direccion");
        telefono = array.getJSONObject(0).getString("telefono");
    } catch (Exception e) {
        out.print(e);
    }
%>
<jsp:include page="navbar.jsp" />
<h1>Actualizar Estudiante</h1>
<form method="POST" style="width: 50%;" action="update.jsp"> 
    <div class="mb-3">
        <input type="hidden" class="form-control" id="cedula" name="cedula" value="<%=id%>">
    </div>
    <div class="mb-3">
        <label for="nombre" class="form-label">Nombre: </label>
        <input type="text" class="form-control" id="nombre" name="nombre" value="<%=nombre%>">
    </div>
    <div class="mb-3">
        <label for="apellido" class="form-label">Apellido: </label>
        <input type="text" class="form-control" id="apellido" name="apellido" value="<%=apellido%>">
    </div>
    <div class="mb-3">
        <label for="direccion" class="form-label">Direccion: </label>
        <input type="text" class="form-control" id="direccion" name="direccion" value="<%=direccion%>">
    </div>
    <div class="mb-3">
        <label for="telefono" class="form-label">Telefono: </label>
        <input type="telefono" class="form-control" id="telefono" name="telefono" value="<%=telefono%>">
    </div>
    <button type="submit" class="btn btn-primary">Ingresar</button>
</form>
