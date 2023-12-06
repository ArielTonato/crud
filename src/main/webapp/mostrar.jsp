<%-- 
    Document   : mostrar
    Created on : 5 dic. 2023, 20:02:19
    Author     : Asus
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.apache.http.util.EntityUtils"%>
<%@page import="org.apache.http.HttpEntity"%>
<%@page import="org.apache.http.HttpResponse"%>
<%@page import="org.apache.http.client.methods.HttpGet"%>
<%@page import="org.apache.http.impl.client.HttpClientBuilder"%>
<%@page import="org.apache.http.client.HttpClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form>
                <div class="form-group">
                    <label for="buscar">Cédula:</label>
                    <input type="text" class="form-control" id="buscar" name="buscar">
                    <button type="submit" class="btn btn-primary mt-5">Buscar</button>
                </div>
            </form>
        </div>
    </div>
</div>


<table class="table mt-5" >
    <thead>
        <tr>
            <th scope="col">Cedula</th>
            <th scope="col">Nombre</th>
            <th scope="col">Apellido</th>
            <th scope="col">Direccion</th>
            <th scope="col">Telefono</th>
            <th scope="col">Acciones</th>
        </tr>
    </thead>
    <tbody>
        <%
            try {
                if (request.getParameter("buscar") == null) {
                    String url = "http://localhost/apiphp/api.php";
                    HttpClient cliente = HttpClientBuilder.create().build();
                    HttpGet get = new HttpGet(url);
                    HttpResponse respuesta = cliente.execute(get);
                    HttpEntity entity = respuesta.getEntity();
                    String responseString = EntityUtils.toString(entity);
                    JSONArray array = new JSONArray(responseString);
                    String fila = "";
                    for (int i = 0; i < array.length(); i++) {
                        JSONObject objeto = array.getJSONObject(i);
                        fila += "<tr>"
                                + "<td>" + objeto.getString("cedula") + "</td>"
                                + "<td>" + objeto.getString("nombre") + "</td>"
                                + "<td>" + objeto.getString("apellido") + "</td>"
                                + "<td>" + objeto.getString("direccion") + "</td>"
                                + "<td>" + objeto.getString("telefono") + "</td>"
                                + "<td>" + "<a href=\"actualizar.jsp?cedula=" + objeto.getString("cedula") + "\" class='btn btn-primary'>"
                                + "Actualizar</a>" + "</td>"
                                + "<td>" + "<a href=\"eliminar.jsp?cedula=" + objeto.getString("cedula") + "\" class='btn btn-danger'>"
                                + "Eliminar</a>" + "</td>"
                                + "</tr>";
                    }
                    out.print(fila);
                } else {
                    String url = "http://localhost/apiphp/api.php?buscar="+request.getParameter("buscar");
                    HttpClient cliente = HttpClientBuilder.create().build();
                    HttpGet get = new HttpGet(url);
                    HttpResponse respuesta = cliente.execute(get);
                    HttpEntity entity = respuesta.getEntity();
                    String responseString = EntityUtils.toString(entity);
                    JSONArray array = new JSONArray(responseString);
                    String fila = "";
                    for (int i = 0; i < array.length(); i++) {
                        JSONObject objeto = array.getJSONObject(i);
                        fila += "<tr>"
                                + "<td>" + objeto.getString("cedula") + "</td>"
                                + "<td>" + objeto.getString("nombre") + "</td>"
                                + "<td>" + objeto.getString("apellido") + "</td>"
                                + "<td>" + objeto.getString("direccion") + "</td>"
                                + "<td>" + objeto.getString("telefono") + "</td>"
                                + "<td>" + "<a href=\"actualizar.jsp?cedula=" + objeto.getString("cedula") + "\" class='btn btn-primary'>"
                                + "Actualizar</a>" + "</td>"
                                + "<td>" + "<a href=\"eliminar.jsp?cedula=" + objeto.getString("cedula") + "\" class='btn btn-danger'>"
                                + "Eliminar</a>" + "</td>"
                                + "</tr>";
                    }
                    out.print(fila);
                }
            } catch (Exception e) {
                out.print(e);
            }

        %>
    </tbody>
</table>

