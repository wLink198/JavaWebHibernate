package controller;

import entity.Account;
import entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/register")
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("user");
        String mail = req.getParameter("mail");
        String pass = req.getParameter("pass");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");

        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();

        Account account = new Account();
        account.setUsername(username);
        account.setEmail(mail);
        account.setPassword(pass);

        User user = new User();
        user.setPhone(phone);
        user.setAddress(address);

        account.setUser(user);
        user.setAccount(account);

        session.beginTransaction();
        session.save(account);
        session.save(user);
        session.getTransaction().commit();

        resp.sendRedirect("/login");
    }
}
