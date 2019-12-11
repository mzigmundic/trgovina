<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="files/meta.html" %>
        <title>Sadržaj košarice</title>
    </head>
    <body>

        <div id="container">
            <div id="header">
                <%@include file="zaglavlje.jsp" %>
            </div>

            <div id="body">
                <br/>
                    <h3 class="bnaslov">Košarica</h3>
                <br/>



                <table class="table table-striped">
                    <tr class="row">
                        <th class="col-md-5">Naziv</th>
                        <th class="col-md-3">Kategorija</th>
                        <th class="col-md-2">Cijena [Kn]</th>
                        <th class="col-md-2">Akcija</th>
                    </tr> 
                    <c:forEach var="puk" items="${kosarica}">
                        <tr class="row">
                            <td class="col-md-5">${proizvodi.get(puk.id).ime}</td>
                            <td class="col-md-2">${kategorije.get( proizvodi.get(puk.id).idkat ).ime}</td>
                            <td class="col-md-2"><span style="float:right"><fmt:formatNumber value="${proizvodi.get(puk.id).cijena}" maxFractionDigits="2" minFractionDigits="2"/></span></td>
                            <td class="col-md-1"></td>
                            <td class="col-md-2">
                                <span>
                                    <form action="PromjeniKolicinuServlet?id=${puk.id}" method="post">
                                        <div class="row">
                                            <input type="number" min="1" style="width:50px" 
                                                    class="form-control" max="${proizvodi.get(puk.id).kolicina}" 
                                                    name="kol" value="${puk.kol}" />
                                             <input type="submit" class="btn btn-sm btn-warning promjeni" value="Promjeni" />
                                             <a href="ObrisiIzKosariceServlet?id=${puk.id}" class="btn btn-danger btn-sm ukloni">Ukloni</a>
                                        </div>
                                    </form>
                                </span>
                            </td>
                        </tr> 
                    </c:forEach>
                        <tr class="row">
                            <th class="col-md-5"></th>
                            <th class="col-md-2">Ukupno:</th>
                            <th class="col-md-2"><span style="float:right"><fmt:formatNumber value="${ukupno}" maxFractionDigits="2" minFractionDigits="2"/></span></th>
                            <td class="col-md-1"></td>
                            <th class="col-md-2"></th>
                        </tr> 
                </table>

                <br/><br/>             
                <div class="row">             
                    <div class="col-md-6">
                        <br/>
                        <c:if test="${uid!=null}">
                            <br/><br/><br/><br/><br/>
                            <a href="IndexServlet" class="btn btn-lg btn-primary bat">Nazad na kupnju</a>
                        </c:if>
                        <c:if test="${uid==null}">
                            <a href="IndexServlet" class="btn btn-primary bat">Nazad na kupnju</a>
                        </c:if>
                    </div>
                    <div class="col-md-6">
                        <c:if test="${uid!=null}">
                            <form method="post" action="KupiServlet">
                                Način plaćanja:
                                <br/><br/>
                                <div style="padding-left:100px;">
                                    <div class="custom-control custom-radio">
                                        <input checked type="radio" id="customRadio1" name="nacinpl" class="custom-control-input" value="1" />
                                        <label class="custom-control-label" for="customRadio1">on-line</label>
                                    </div>
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="customRadio2" name="nacinpl" class="custom-control-input" value="2" />
                                        <label class="custom-control-label" for="customRadio2">gotovina/pouzećem</label>
                                    </div>
                                </div>
                                <br/><br/>
                              <input type="submit" class="btn btn-lg btn-success bat" value="Kupi" />
                            </form>
                        </c:if> 
                        <c:if test="${uid==null}">
                            <p style="text-align:center; margin-bottom: 0px;">Kako bi mogli kupiti ove proizvode morate se prijaviti:<p>
                            <a href="LoginServlet" class="btn btn-primary bat">Prijava</a>
                        </c:if>
                    </div>
                </div>
                <br/><br/><br/>

            </div>

            <div id="footer">
                <%@include file="files/footer.html" %>
            </div>
        </div>                

    </body>
</html>

