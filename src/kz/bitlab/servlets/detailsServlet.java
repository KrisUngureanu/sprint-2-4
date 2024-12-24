package kz.bitlab.servlets;

import kz.bitlab.models.DBManager;
import kz.bitlab.models.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/details")
public class detailsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idTask = req.getParameter("idTask");
        Task task = DBManager.getTask(Long.parseLong(idTask));
        req.setAttribute("task", task);
        req.getRequestDispatcher("details.jsp").forward(req,resp);
    }
}
