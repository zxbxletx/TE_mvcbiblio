<%@page import="com.emergentes.modelo.Libro"%>
<%@page import="com.emergentes.modelo.LibroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            LibroDAO lista = (LibroDAO) session.getAttribute("gestor");
        %>
        <h1>Listado</h1>
        <p><a href="../Principal?op=nuevo">Nuevo</a></p>
        <%
            if(lista.getLibros().size() > 0){
        %>        
            
            <table border="1">
                <tr>
                    <th>Id</th>
                    <th>Titulo</th>
                    <th>Autor</th>
                    <th>Estado</th>
                    <th></th>
                    <th></th>
                </tr>
            
        <%
                for(Libro item : lista.getLibros()){
                    
        %> 
                <tr>
                    <td><%= item.getId() %></td>
                    <td><%= item.getTitulo() %></td>
                    <td><%= item.getAutor() %></td>
                    <td><%= item.getEstado() %></td>
                    <td><a href="../Principal?=editar&id<%= item.getId() %>">Editar</a></td>
                    <td><a href="../Principal?=eliminar&id<%= item.getId() %>"
                           onclick="return(confirm('Esta seguro de eliminar???'))"
                           >Eliminar</a></td>
                </tr>
        <%        
                }
        %>
            </table>    
        <%
            }
            else{
                out.println("<p>No existen registros</p>");
            }    
        %>    
    </body>
    
</html>
