package servleti;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
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
import modeli.KupljeniProizvod;

@WebServlet(name = "PrikaziPovijestServlet", urlPatterns = {"/PrikaziPovijestServlet"})
public class PrikaziPovijestServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Korisnik k = (Korisnik)request.getSession().getAttribute("uid");
        if (k==null) { response.sendRedirect("LoginServlet"); return; }
        try {
            Baza db = new Baza();
            db.connect();
            
            int idkupca = k.getId();
            ResultSet rs;
            if (k.getUloga().equals("Kupac"))
                rs = db.selectupit("SELECT * FROM Povijest WHERE idkupca="+idkupca+" ORDER BY vrijeme DESC");
            else {
                String odabranikorisnik = request.getParameter("odabranikorisnik");
                String vrod = request.getParameter("vrod");
                String vrdo = request.getParameter("vrdo");
                String vrodc = "";
                String vrdoc = "";
                if (vrod!=null) {
                    vrodc = vrod.substring(0,10)+" "+vrod.substring(11);
                    vrdoc = vrdo.substring(0,10)+" "+vrdo.substring(11);
                }
                
                if (vrod==null && odabranikorisnik==null)
                    rs = db.selectupit("SELECT * FROM Povijest ORDER BY vrijeme DESC");
                else {
                    String whdod = "WHERE 1=1 ";
                    if (odabranikorisnik!=null && !odabranikorisnik.equals("0")) whdod += " AND idkupca="+odabranikorisnik;
                    if (vrod!=null) whdod += " AND vrijeme>='"+vrodc+"' AND vrijeme<='"+vrdoc+"'";
                    rs = db.selectupit("SELECT * FROM Povijest "+whdod+" ORDER BY vrijeme DESC");
                    if (odabranikorisnik!=null) request.setAttribute("odabranikorisnik",odabranikorisnik);
                    if (vrod!=null) {
                        request.setAttribute("vrod",vrod);
                        request.setAttribute("vrdo",vrdo);
                    }
                }

            }
            List<KupljeniProizvod> kupljeniproizvodi = new ArrayList<>();
            while(rs.next()) {
                int idproizvod = rs.getInt("idproizvod");
                ResultSet rs2 = db.selectupit( "SELECT * FROM Proizvodi WHERE id="+idproizvod);
                rs2.next();
                String naziv = rs2.getString("ime");
                float kol = rs.getFloat("kol");
                float cijena = rs2.getFloat("cijena");
                String nacinpl = "on-line";
                if (rs.getInt("nacinpl")==2) nacinpl = "gotovina/pouzećem";
                
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
                
                KupljeniProizvod kp = new KupljeniProizvod( naziv, kol, cijena, nacinpl, vrijeme );
                
                if (k.getUloga().equals("Administrator")) {
                    ResultSet rs3 = db.selectupit( "SELECT * FROM Korisnici WHERE id="+rs.getInt("idkupca"));
                    rs3.next();
                    kp.setImeprezime(rs3.getString("ime")+" "+rs3.getString("prezime"));
                    kp.setEmail(rs3.getString("email"));
                }
                                
                kupljeniproizvodi.add(kp);
            }
            request.setAttribute("kupljeniproizvodi", kupljeniproizvodi);
            
            if (k.getUloga().equals("Administrator")) {
               List<Korisnik> korisnici = new ArrayList<>();
               rs = db.selectupit( "SELECT * FROM Korisnici ORDER BY prezime,ime" );
               while (rs.next()) {
                   Korisnik kor = new Korisnik( rs.getInt("id"), rs.getString("ime"), rs.getString("prezime"),
                                              rs.getString("email"), rs.getString("uloga"), rs.getString("adresa") );
                   korisnici.add( kor );
               }
               request.setAttribute( "korisnici", korisnici );
            }
            
            getServletContext().getRequestDispatcher("/povijest.jsp").forward(request, response); 
            
        } catch (SQLException ex) {
            Logger.getLogger(PrikaziPovijestServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PrikaziPovijestServlet.class.getName()).log(Level.SEVERE, null, ex);
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
