package servleti;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeli.*;


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            String lozinka = request.getParameter("lozinka");
            
            Baza db = new Baza();
            db.connect();
            
             DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	     Date date = new Date();
             String vrijeme = dateFormat.format(date);
            
            int gr = 0;
            ResultSet rs = db.selectupit("SELECT * FROM Korisnici WHERE email='"+email+"'");
            
            if (!rs.next()) {
                gr = 2;
                request.setAttribute("gr", gr);
                request.setAttribute("email", "" );
                db.upit("INSERT INTO Prijave (idkorisnik,vrijeme,nacinprijave) VALUES "
                        + "('0','"+vrijeme+"','2')");
                getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            }
            else {
                if (lozinka.equals(rs.getString("lozinka"))) {
                    String uloga = "Kupac";
                    if (rs.getInt("uloga")==2) uloga = "Administrator";
                    Korisnik k = new Korisnik( rs.getInt("id"),
                                               rs.getString("ime"),
                                               rs.getString("prezime"),
                                               rs.getString("email"),
                                               uloga,
                                               rs.getString("adresa"));
                    request.getSession().setAttribute("uid", k);
                    db.upit("INSERT INTO Prijave (idkorisnik,vrijeme,nacinprijave) VALUES "
                        + "('"+rs.getInt("id")+"','"+vrijeme+"','0')");
                    response.sendRedirect("IndexServlet");
                }
                else {
                    gr = 1;
                    request.setAttribute("gr", gr);
                    request.setAttribute("email", email );
                    db.upit("INSERT INTO Prijave (idkorisnik,vrijeme,nacinprijave) VALUES "
                        + "('"+rs.getInt("id")+"','"+vrijeme+"','1')");
                    getServletContext().getRequestDispatcher("/login.jsp").forward(request, response); 
                    return;                    
                }
            }
    
          
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
