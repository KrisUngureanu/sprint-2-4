package kz.bitlab.servlets;

import kz.bitlab.models.DBManager;
import kz.bitlab.models.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addTask")
public class addTaskServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String name = req.getParameter("nameTask");
        String desc = req.getParameter("descTask");
        String deadline = req.getParameter("deadlime");
        Task task = new Task();
        task.setName(name);
        task.setDescription(desc);
        task.setDeadlineDate(deadline);
        task.setCompleted(false);
        DBManager.addTask(task);
        resp.sendRedirect("/index");
    }
}
