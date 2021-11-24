/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CommentDAO;
import DAO.EventDAO;
import DAO.FollowedEventDAO;
import DAO.JoinEventDAO;
import DTO.CommentDTO;
import DTO.EventDTO;
import DTO.UserDTO;
import Extension.AI;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SE151264
 */
public class ViewEventDetailsController extends HttpServlet {

    private final String ERROR = "error.jsp";
    private final String SUCCESS = "viewEventDetails.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            int eventId = Integer.parseInt(request.getParameter("eventId"));
            String search = request.getParameter("search");
            int index = Integer.parseInt(request.getParameter("index"));
            String countListCmtString = request.getParameter("countListCmt");
            int countListCmt=0;
            if(countListCmtString!=null){
                countListCmt= Integer.parseInt(countListCmtString);
            }
            int indexCmt=1;
            
            EventDAO edao = new EventDAO();
            EventDTO event = edao.getEventById(eventId);
            CommentDAO cdao = new CommentDAO();
            if(countListCmt>=10 && countListCmt<=cdao.countEventComment(eventId)){
                indexCmt=countListCmt/10;
                session.setAttribute("END_OF_COMMENT", true);
            }else{
                session.setAttribute("END_OF_COMMENT", false);
            }
            List<CommentDTO> listShortComment= cdao.getShortListEventComment(eventId, indexCmt, 10);
            UserDTO user = (UserDTO) session.getAttribute("CURRENT_USER");
            JoinEventDAO jeD = new JoinEventDAO();
            if (event!=null && listShortComment!=null) {
                List<String> descStrings = AI.detectEmbededLinks(event.getDescription());
                int follow = new FollowedEventDAO().checkFollow(user, event);
                int join = jeD.checkJoinEvent(event, user);
                request.setAttribute("join", join);
                request.setAttribute("follow", follow);
                request.setAttribute("DESCRIPTION", descStrings);
                session.setAttribute("SELECTED_EVENT", event);
                session.setAttribute("LIST_COMMENT", listShortComment);
                request.setAttribute("search", search);
                request.setAttribute("index", index);
                session.setAttribute("index", index);
                url=SUCCESS;
            }
            else{
                request.setAttribute("ERROR_MESSAGE", "Error at ViewEventDetailsController");
            }
        } catch (Exception e) {
            request.setAttribute("ERROR_MESSAGE", "Cannot retrieve selected event!");
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
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
