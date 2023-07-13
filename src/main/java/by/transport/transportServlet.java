package by.transport;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class transportServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("transport_test", "test attribute");
        request.getRequestDispatcher("/WEB-INF/jsp/test.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
