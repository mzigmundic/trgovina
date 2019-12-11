<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="files/meta.html" %>
        <title>Registracija</title>

    </head>
    
    <body>
        <div id="container">
            <div id="header">
                <%@include file="zaglavlje.jsp" %>
            </div>
            
            <div id="body">
                <br/>
                    <h3 class="bnaslov">Registracija</h3>
                <br/>
                <div class="col-md-6 offset-3">
                    <form method="post" action="RegistracijaServlet">
                        <div class="form-group">
                            <label for="ime">Ime:</label> 
                            <input type="text" name="ime" id="ime" class="form-control"/>
                        </div>        
                        <div class="form-group"> 
                            <label for="prezime">Prezime:</label> 
                            <input type="text" name="prezime" id="prezime" class="form-control"/>
                        </div>        
                        <div class="form-group"> 
                            <label for="email">E-mail:</label> 
                            <input type="email" name="email" id="email" class="form-control" aria-describedby="email" placeholder="Uneiste email"/>
                       </div>        
                       <div class="form-group"> 
                           <label for="lozinka">Lozinka:</label> 
                           <input type="password" name="lozinka" id="lozinka" class="form-control" aria-describedby="lozinka" value=""/>
                       </div>       
                        <br/>
                        <div class="row">
                            <div class="col-md-6">
                                <button type="submit" class="btn btn-primary bat">Registriraj se</button>
                            </div>                          
                            <div class="col-md-6">
                                <a href="IndexServlet" class="btn btn-primary bat">Nazad na kupnju</a>
                            </div>
                        </div>
                    </form>
                </div>
                
            </div>
            <br/><br/><br/>
        <div id="footer">
            <%@include file="files/footer.html" %>
        </div>
    </body>
</html>