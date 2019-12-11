<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="files/meta.html" %>
        <title>Prijava</title>

    </head>
    
    <body>
        <div id="container">
            <div id="header">
                <%@include file="zaglavlje.jsp" %>
            </div>
            
            <div id="body">
                <br/>
                    <h3 class="bnaslov">Prijava</h3>
                <br/>
                <div class="col-md-6 offset-3">
                    <form method="post" action="LoginServlet">
                       <div class="form-group"> 
                           <label for="email">E-mail:</label> 
                           <input type="email" name="email" id="email" class="form-control" aria-describedby="email"
                            <c:if test="${gr==1}">
                                value="${email}"
                            </c:if>  />
                            <c:if test="${gr==2}">
                                <small id="email" class="form-text text-muted"><span style='color:red'>(taj korisnik ne postoji)</span></small>
                            </c:if>
                       </div>        
                       <div class="form-group"> 
                           <label for="lozinka">Lozinka:</label> 
                           <input type="password" name="lozinka" id="lozinka" class="form-control" aria-describedby="lozinka"
                            <c:if test="${gr==1}">
                                <small id="lozinka" class="form-text text-muted"><span style='color:red'>(pogrešna lozinka)</span></small>
                            </c:if>
                       </div>       
                        <br/>
                        <div class="row">
                            <div class="col-md-6">
                                <button type="submit" class="btn btn-primary bat">Prijavi se</button>
                            </div>                          
                            <div class="col-md-6">
                                <a href="IndexServlet" class="btn btn-primary bat">Nazad na kupnju</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
                
            
        </div>
        <div id="footer">
            <%@include file="files/footer.html" %>
        </div>
    </body>
</html>
