<%-- 
    Document   : index
    Created on : 5 dic. 2023, 19:13:44
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="navbar.jsp" />
    <body>
        <header>
            <h1 class="text-center m-3">SOA</h1>
        </header>
        <main>
            <div class="row justify-content-center">
                <jsp:include page="insertar.jsp" />                
            </div>
            <div >
                
                <jsp:include page="mostrar.jsp" />                
            </div>
        </main>
    </body>
</html>
