package servleti;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeli.Baza;
import modeli.Korisnik;
import modeli.Prijava;


@WebServlet(name = "PrikaziPrijaveServlet", urlPatterns = {"/PrikaziPrijaveServlet"})
public class PrikaziPrijaveServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Korisnik k = (Korisnik)request.getSession().getAttribute("uid");
        if (k==null) { response.sendRedirect("LoginServlet"); return; }
        if (!k.getUloga().equals("Administrator")) 
            { response.sendRedirect("IndexServlet"); return; }
        
        try {
            Baza db = new Baza();
            db.connect();
            
            List<Prijava> prijave = new ArrayList<>();
            
            ResultSet rs = db.selectupit("SELECT * FROM Prijave ORDER BY vrijeme DESC");
            
            while( rs.next() ) {
                String imeprezime = "-";
                String email = "-";
                if (rs.getInt("idkorisnik")!=0) {
                    ResultSet rs2 = db.selectupit( "SELECT * FROM Korisnici WHERE id="+rs.getInt("idkorisnik") );
                    rs2.next();
                    imeprezime = rs2.getString("ime")+" "+rs2.getString("prezime");
                    email = rs2.getString("email");
                }
                String input = rs.getString("vrijeme");
                SimpleDateFormat parser = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date date = null;
                try {
                    date = parser.parse(input);
                } catch (ParseException ex) {
                    Logger.getLogger(PrikaziPovijestServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                SimpleDateFormat formatter = new SimpleDateFormat("d.M.yyyy. HH:mm:ss");
                String vrijeme = formatter.format(date);
                
                String nacinprijave = "<span style='color:green'>uspješna prijava na sustav</span>";
                if (rs.getInt("nacinprijave")==1) nacinprijave = "<span style='color:red'>utipkana kriva lozinka</span>";
                if (rs.getInt("nacinprijave")==2) nacinprijave = "<span style='color:red'>nepostojeći korisnik</span>";
                if (rs.getInt("nacinprijave")==3) nacinprijave = "<span style='color:blue'>uspješna odjava</span>";
                
                Prijava p = new Prijava( imeprezime, email, vrijeme, nacinprijave );
                prijave.add( p );
            }
            request.setAttribute("prijave", prijave);
            getServletContext().getRequestDispatcher("/prijave.jsp").forward(request, response); 
            
        } catch (SQLException ex) {
            Logger.getLogger(PrikaziPrijaveServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PrikaziPrijaveServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
