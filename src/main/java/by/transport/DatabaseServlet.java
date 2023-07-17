package by.transport;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.List;

@WebServlet(name = "databaseServlet", value = "/databaseServlet")
public class DatabaseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        //Создаю объект для записи текстовых данных в тело HTTP ответа
        PrintWriter printWriter = response.getWriter();
        //загрузка драйвера postgres в JVM
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            //если не драйвера нет в classpath или в папке lib tomcat, то выскочит эта ошибка
            throw new RuntimeException(e);
        }

        //создание подключения для базы данных
        try {
            Connection conn = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/transport_db",
                    "user",
                    "password");
            //Создаем объект statement для создания запросов с его помощью
            Statement statement = conn.createStatement();
            //Создаем запрос в БД с помощью объекта statement
            //В объект resultSet1 помещается результат ПЕРВОГО запроса
            ResultSet resultSet1 = statement.executeQuery("SELECT * FROM transport");
            printWriter.println("<p>"+"id   transport"+"</p>"); // вывел заголовок таблицы

            printWriter.println("<p>");
            //пока в resultSet есть новые элементы
            while (resultSet1.next()) {
                //выводим нужные нам строки из таблицы
                printWriter.println(
                        resultSet1.getString("id") + "  " +
                        resultSet1.getString("transport_name") +"<br>");
            }
            printWriter.println("</p>");

            //Создаем запрос в БД с помощью объекта statement
            //В объект resultSet2 помещается результат ВТОРОГО запроса
            ResultSet resultSet2 = statement.executeQuery("SELECT * FROM stop");
            printWriter.println("<p>"+"id   stop_name"+"</p>"); // вывел заголовок таблицы

            printWriter.println("<p>");
            //пока в resultSet есть новые элементы
            while (resultSet2.next()) {
                //выводим нужные нам строки из таблицы
                printWriter.println(
                        resultSet2.getString("id") + "  " +
                        resultSet2.getString("stop_name") +"<br>");
            }
            printWriter.println("</p>");
            statement.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
