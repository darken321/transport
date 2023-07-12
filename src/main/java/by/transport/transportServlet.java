package by.transport;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class transportServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

//      установка типа и кодировки контента, аналогично строке ниже.
//        response.setHeader("Content-type","text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");

        response.getWriter().write("Hello " + name + "  ");
        response.getWriter().write("Hello transport!!");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
