<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="files/meta.html" %>
        <title>Popis proizvoda</title>
    </head>
    
    <body>
        <div id="container">
            <div id="header">
                <%@include file="zaglavlje.jsp" %>      
            </div>
            
                
            <div id="navig">
                <c:forEach var="k" items="${kategorije}">
                    <a href="IndexServlet?katid=${k.key}" 
                        <c:if test="${k.key!=katid}">class="btn btn-primary"</c:if>
                        <c:if test="${k.key==katid}">class="btn btn-success"</c:if>
                    >${k.value.ime}</a> &nbsp; &nbsp;
                </c:forEach>
            </div>
            <br/><br/>


            <div id="body">
          
                <table class="table table-striped">
                    <tr class="row">
                        <th class="col-md-5">Naziv</th>
                        <th class="col-md-3">Kategorija</th>
                        <th class="col-md-2">Cijena [Kn]</th>
                        <th class="col-md-2">Akcija</th>
                    </tr> 
                    <c:forEach var="p" items="${proizvodi}">
                        <tr class="row">
                            <td class="col-md-5">${p.ime}</td>
                            <td class="col-md-2">${kategorije.get(p.idkat).ime}</td>
                            <td class="col-md-2"><span style="float:right"><fmt:formatNumber value="${p.cijena}" maxFractionDigits="2" minFractionDigits="2"/></span></td>
                            <td class="col-md-1"></td>
                            <td class="col-md-2">
                                <form action="DodajUKosaricuServlet?id=${p.id}" method="post">
                                    <div class="row">&nbsp;
                                        <input type="hidden" name="katid" value="${katid}" />
                                        <input type="number" min="1" style="width:50px" 
                                               class="form-control" max="${p.kolicina}" 
                                               name="kol" value="1" /> &nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type=image src=files/addItem.png alt="Submit feedback" height='26px'>
                                    </div>
                                </form> 
                            </td>
                        </tr>
                    </c:forEach>      
                </table>
                <br/><br/><br/>
            </div>

            <div id="footer">
                <%@include file="files/footer.html" %>
            </div>

        </div>
  
    </body>
</html>

