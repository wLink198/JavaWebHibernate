package controller;

import entity.Account;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from Account");
        List<Account> list = query.list();

        String mail = req.getParameter("mail");
        String pass = req.getParameter("pass");
        boolean login = false;
        long account_id = 0;

        for (Account li:
             list) {
            if (mail.equals(li.getEmail()) && pass.equals(li.getPassword())) {
                login = true;
                account_id = li.getId();
            }
        }

        if (login == true) {
            Cookie c = new Cookie("login", String.valueOf(account_id));
            resp.addCookie(c);
            resp.sendRedirect("/listFeedback");
        }
        resp.getWriter().println("fail cmnr");
    }
}
