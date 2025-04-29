import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UpdateStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String prn = request.getParameter("prn");
        String name = request.getParameter("name");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourDB", "root", "Tejas@123");

            String query = "UPDATE students SET name = ? WHERE prn = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, prn);
            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated > 0) {
                request.setAttribute("message", prn+" information updated successfully.");
            } else {
                request.setAttribute("message", prn+" not found.");
            }
            RequestDispatcher rd = request.getRequestDispatcher("removeStudent.jsp");
            rd.forward(request, response);

            ps.close();
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
