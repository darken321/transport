package by.transport;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class transportServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Получение параметра name, который можно передать через /transport?name=Dima
        String param = request.getParameter("name");
        // Сохранение параметра в атрибуте запроса
        if (param==null || param.trim().equals("")) {
            param="UserName";
        }
        request.setAttribute("name", param);
        request.setAttribute("transport_test", "test attribute");
        //отправляем все параметры в test.jsp
        request.getRequestDispatcher("/WEB-INF/jsp/test.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
