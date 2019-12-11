<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="files/meta.html" %>
        <title>Povijest kupnje</title>
    </head>
    
    <body>
        <div id="container">
            <div id="header">
                <%@include file="zaglavlje.jsp"  %>
            </div>
            
            <div id="body" style="width:100%">
                <br/>
                    <h3 class="bnaslov">Povijest kupnje</h3>
                <br/>

                <table class="table table-striped">
                    <tr>
                        <c:if test="${uid.uloga.equals('Administrator')}"> 
                            <th>Ime i prezime kupca<br/>
                                <form method="post" action="PrikaziPovijestServlet">
                                    <c:if test="${vrod!=null}">
                                    <input type="hidden" name="vrod" value="${vrod}" />
                                    <input type="hidden" name="vrdo" value="${vrdo}" />
                                    </c:if>
                                    <select name="odabranikorisnik" class="form-control" onchange="this.form.submit()">
                                        <option value="0">Svi kupci</option>
                                        <c:forEach var="kor" items="${korisnici}">
                                            <option value="${kor.id}" 
                                                 <c:if test="${kor.id==odabranikorisnik}">
                                                    selected="selected"
                                                 </c:if>
                                                    >${kor.prezime}, ${kor.ime}</option>
                                        </c:forEach>
                                    </select>
                                </form>
                            </th><th>Email</th>
                        </c:if>    
                        <th>Naziv proizvoda</th><th>Količina</th><th>Cijena [Kn]</th><th>Način plaćanja</th>
                        <th>Vrijeme
                             <c:if test="${uid.uloga.equals('Administrator')}"> 
                                 <br/>
                                 <form action="PrikaziPovijestServlet" method="post">
                                     <c:if test="${odabranikorisnik!=null}">
                                     <input type="hidden" name="odabranikorisnik" value="${odabranikorisnik}" />
                                     </c:if>
                                    od: <input type="datetime-local" name="vrod" value="${vrod}" /><br/> 
                                    do: <input type="datetime-local" name="vrdo" value="${vrdo}" /> 
                                    <input type="submit" value="prikaži" />
                                 </form>
                            </c:if>
                        </th>
                    </tr> 
                    <c:forEach var="kp" items="${kupljeniproizvodi}">
                        <tr>
                            <c:if test="${uid.uloga.equals('Administrator')}"> 
                                <td>${kp.imeprezime}</td>
                                <td>${kp.email}</td>
                            </c:if>
                            <td>${kp.ime}</td>
                            <td>${kp.kol}</td>
                            <td align="right" width="110px"><fmt:formatNumber value="${kp.cijena}" maxFractionDigits="2" minFractionDigits="2"/></td>
                            <td>${kp.nacinpl}</td>
                            <td>${kp.vrijeme}</td>
                        </tr>
                    </c:forEach> 
                </table>
                <br/>             
                <a href="IndexServlet" class="btn btn-primary bat">Nazad na kupnju</a>
                <br/><br/><br/><br/>
            </div>
           
           <div id="footer">
               <%@include file="files/footer.html" %>
           </div>
        </div>
           
    </body>
    
</html>

