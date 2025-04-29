import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String prn = request.getParameter("prn");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourDB", "root", "Tejas@123");

            String query = "INSERT INTO students (name, prn) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, prn);

            request.setAttribute("name", name);
            request.setAttribute("prn", prn);
            int rowsDeleted = ps.executeUpdate();

            if (rowsDeleted > 0) {
                request.setAttribute("message", prn+" inserted successfully.");
            } else {
                request.setAttribute("message",  prn +"not inserted.");
            }
            RequestDispatcher rd = request.getRequestDispatcher("removeStudent.jsp");
            rd.forward(request, response);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
