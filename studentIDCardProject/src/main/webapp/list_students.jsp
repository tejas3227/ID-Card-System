<%@ page import="java.util.List, com.yourproject.model.Student" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of All Students</title>
    <style>
        table {
            width: 80%;
            margin: 50px auto;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        h1 {
            text-align: center;
            font-family: Arial, sans-serif;
        }
        .home-button {
            display: block;
            width: 150px;
            margin: 30px auto;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            font-size: 16px;
        }
        .home-button:hover {
            background-color: #45a049;
        }
        .generate-button {
            padding: 5px 15px;
            background-color: #2196F3;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
        }
        .generate-button:hover {
            background-color: #1976D2;
        }
    </style>
</head>
<body>

    <h1>List of All Students</h1>

    <!-- HOME Button -->
    <a href="home.html" class="home-button">Home</a>

    <table>
        <thead>
            <tr>
                <th>PRN</th>
                <th>Name</th>
                <th>Generate ID Card</th> <!-- NEW COLUMN -->
            </tr>
        </thead>
        <tbody>
            <%
                List<Student> students = (List<Student>) request.getAttribute("students");
                if (students != null && !students.isEmpty()) {
                    for (Student student : students) {
            %>
            <tr>
                <td><%= student.getPrn() %></td>
                <td><%= student.getName() %></td>
                <td>
                    <form action="idPrintServlet" method="post" style="margin:0;">
                        <input type="hidden" name="prn" value="<%= student.getPrn() %>">
                        <input type="submit" value="Generate" class="generate-button">
                    </form>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="3">No students found.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

</body>
</html>
