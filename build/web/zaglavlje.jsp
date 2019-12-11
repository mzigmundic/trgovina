<%@page import="modeli.ProizvodUKosarici"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


 <%
           int kossize = 0;
            List<ProizvodUKosarici> kosarica = (List<ProizvodUKosarici>) request.getSession().getAttribute("kosarica");
            if (kosarica!=null) kossize = kosarica.size();
            request.setAttribute("kossize", kossize);
%>




<div id="head">
    <div class="row">
        <div class="col-md-6">
            <div id="branding">
                <a href="IndexServlet"><h1><span class="highlight">MyGuitar</span> Shop</h1></a>
            </div>
        </div>
        <div class="col-md-4">
            <div id="logininfo">
                <c:if test="${uid==null}">
                    <a href="RegistracijaServlet" class="btn btn-sm btn-primary">Registracija</a><br/>
                    <a href="LoginServlet" class="btn btn-sm btn-primary">Prijava</a>
                </c:if>
                <c:if test="${uid!=null}">
                    Prijavljen: ${uid.ime} ${uid.prezime}
                    <c:if test="${uid.uloga.equals('Administrator')}"> (Admin)<br/>                           
                       <a href="PrikaziPrijaveServlet" class="btn btn-sm btn-primary">Prijave</a>
                    </c:if>
                    <c:if test="${uid.uloga.equals('Kupac')}">                            
                       <br/>
                    </c:if>                      
                    <a href="PrikaziPovijestServlet" class="btn btn-sm btn-primary">Povijest kupnje</a>
                    <a href="LogoutServlet" class="btn btn-sm btn-primary">Odjava</a>
             </c:if>
            </div>
        </div>
        <div class="col-md-2">
            <div id="kos">
                <c:if test="${kossize==0}">
                    <img src="files/kosarica.png" height="50px"/>
                </c:if>
                <c:if test="${kossize!=0}">
                    <a href="PrikaziKosaricuServlet" style="text-decoration:none">
                        <span class="badge" style="background-color:#e8491d; color:black; font-size: 15px">${kossize}</span>
                        <img src="files/kosarica.png" height="50px"/>
                    </a>
                </c:if>
            </div>
        </div>    
    </div>
</div>
        

            
