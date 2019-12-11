package servleti;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeli.Baza;
import modeli.Kategorija;
import modeli.Proizvod;
import modeli.ProizvodUKosarici;


@WebServlet(name = "PrikaziKosaricuServlet", urlPatterns = {"/PrikaziKosaricuServlet"})
public class PrikaziKosaricuServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          try {
            List<ProizvodUKosarici> kosarica = (List<ProizvodUKosarici>) request.getSession().getAttribute("kosarica");
            
            String katid = request.getParameter("katid");
            if (katid==null) katid = "0";
            Baza db = new Baza();
            db.connect();
            Map<Integer,Kategorija> kategorije = new HashMap<>();
            kategorije.put(0, new Kategorija(0,"Svi proizvodi"));
            ResultSet rs = db.selectupit("SELECT * FROM Kategorije");
            while (rs.next()) kategorije.put( rs.getInt("id"), new Kategorija(rs.getInt("id"),rs.getString("ime")) );
            request.setAttribute( "kategorije", kategorije );
            request.setAttribute( "katid", katid );
                        
            Map<Integer,Proizvod> proizvodi = new HashMap<>();
            float ukupno = 0;
            for (ProizvodUKosarici puk:kosarica) {
                rs = db.selectupit("SELECT * FROM Proizvodi WHERE id="+puk.getId() );             
                rs.next(); 
                proizvodi.put( puk.getId(), new Proizvod( 
                          rs.getInt("id"),
                          rs.getString("ime"), 
                          rs.getFloat("kolicina"),
                          rs.getFloat("cijena"), 
                          rs.getInt("idkat") )
                    );
                ukupno = ukupno + puk.getKol() * rs.getFloat("cijena");
            }
            request.setAttribute("proizvodi",proizvodi);
            request.setAttribute("ukupno",ukupno);
            
            getServletContext().getRequestDispatcher("/kosarica.jsp").forward(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(IndexServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(IndexServlet.class.getName()).log(Level.SEVERE, null, ex);
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
