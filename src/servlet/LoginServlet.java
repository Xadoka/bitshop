package servlet;

import db.DBConnector;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email= req.getParameter("email");
        String password= req.getParameter("password");
        String redirect = "/login?error";
        User user = DBConnector.getUserByEmailAndPassword(email,password);
        if(user != null){
            redirect="/profile";
        }
        resp.sendRedirect(redirect);
    }
}
