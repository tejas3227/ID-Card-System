import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class idPrintServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String prn = request.getParameter("prn"); // only PRN will be passed from list_student.jsp

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourDB", "root", "Tejas@123");

            String query = "SELECT * FROM students WHERE prn = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, prn);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                String prnFromDb = rs.getString("prn"); // You can safely reuse 'prn', but this is cleaner.

                request.setAttribute("name", name);
                request.setAttribute("prn", prnFromDb);

                RequestDispatcher rd = request.getRequestDispatcher("idcard.jsp");
                rd.forward(request, response);
            } else {
                // If no student found for PRN
                request.setAttribute("error", "No student found with PRN: " + prn);
                RequestDispatcher rd = request.getRequestDispatcher("error.jsp"); // You can create an error page
                rd.forward(request, response);
            }

            rs.close();
            ps.close();
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
