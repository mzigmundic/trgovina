<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="files/meta.html" %>
        <title>Prikaz prijava na sustav</title>
    </head>
    <body>
       

        
        <div id="container">
            <div id="header">
                <%@include file="zaglavlje.jsp"  %>
            </div>
            <div id="body">
                <br/>
                    <h3 class="bnaslov">Prikaz prijava na sustav</h3>
                <br/>
                
                <table class="table table-striped">
                    <tr class="row">
                        <th class="col-md-3">Ime i prezime</th>
                        <th class="col-md-3">Email</th>
                        <th class="col-md-3">Vrijeme</th>
                        <th class="col-md-3">Način prijave</th>
                    </tr> 
                    <c:forEach var="p" items="${prijave}">
                        <tr class="row">
                            <td class="col-md-3">${p.imeprezime}</td>
                            <td class="col-md-3">${p.email}</td>
                            <td class="col-md-3">${p.vrijeme}</td>
                            <td class="col-md-3">${p.nacinprijave}</td>
                        </tr>
                    </c:forEach> 
                </table>
                
                
                
                <br/>
                <a href="IndexServlet" class="btn btn-primary bat">Nazad na kupnju</a>
            </div>
            <br/><br/><br/>
            <div id="footer">
                <%@include file="files/footer.html" %>
           </div>
        </div>
    </body>
</html>

