import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import com.yourproject.model.Student;


public class ListStudentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> students = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourDB", "root", "Tejas@123");

            String query = "SELECT prn, name FROM students";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                String prn = rs.getString("prn");
                String name = rs.getString("name");
                students.add(new Student(prn, name));
            }

            // ✅ Set with correct attribute name
            request.setAttribute("students", students);

            // ✅ Forward to JSP
            RequestDispatcher rd = request.getRequestDispatcher("list_students.jsp");
            rd.forward(request, response);

            rs.close();
            stmt.close();
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
