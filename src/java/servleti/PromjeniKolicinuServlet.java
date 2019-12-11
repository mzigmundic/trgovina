package servleti;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeli.ProizvodUKosarici;


@WebServlet(name = "PromjeniKolicinuServlet", urlPatterns = {"/PromjeniKolicinuServlet"})
public class PromjeniKolicinuServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt( request.getParameter("id") );
        float kol = Float.parseFloat( request.getParameter("kol") );
        
        List<ProizvodUKosarici> kosarica = (List<ProizvodUKosarici>)request.getSession().getAttribute("kosarica");
        
        for (int i = 0; i<kosarica.size(); i++) {
           if (id==kosarica.get(i).getId()) { 
               ProizvodUKosarici puk = kosarica.get(i);
               puk.setKol(kol);
               kosarica.set(i, puk);
               break;
           }
        }
        request.getSession().setAttribute("kosarica",kosarica);
        
        response.sendRedirect("PrikaziKosaricuServlet");       
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
