package controller;

import entity.Account;
import entity.Feedback;
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

@WebServlet(urlPatterns = "/")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cookieName = "login";
        boolean login = false;
        Cookie[] cookies = req.getCookies();
        if (cookies != null)
        {
            for(int i=0; i<cookies.length; i++)
            {
                Cookie cookie = cookies[i];
                if (cookieName.equals(cookie.getName()))
                {
                    login = true;
                }
            }
        }

        if (login == true) {
            SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
            Session session = sessionFactory.openSession();
            Query query = session.createQuery("from Account  ");
            List<Account> list = query.list();

            req.setAttribute("acc", list);
            req.getRequestDispatcher("listFeedback.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("/login");
        }
//        for (Account li:
//             list) {
//            for (Feedback fb:
//                 li.getFeedbacks()) {
//                System.out.println(li.getUsername() + "    " + fb.getContent());
//            }
//        }
    }
}
