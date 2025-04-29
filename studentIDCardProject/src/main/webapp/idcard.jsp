<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ID Card</title>
    <style>
        body {
            background: #f0f0f0;
        }
        .id-card {
    width: 450px;
    height: 250px;
    background: #ffffff;
    border: 1px solid #ccc;
    border-radius: 10px;
    overflow: hidden;
    font-family: Arial, sans-serif;
    margin: 50px auto;
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    position: relative;
    
    display: flex;           
    flex-direction: column;  
    justify-content: space-between; 
}

        .top-section {
            background: #ececec;
            padding: 10px;
            display: flex;
            align-items: center;
        }
        .top-section img.logo {
            height: 50px;
            margin-right: 10px;
        }
        .top-section .institute {
            font-size: 12px;
            font-weight: bold;
            color: #333;
        }
        .middle-section {
            background: #f26522;
            color: white;
            text-align: center;
            padding: 5px;
            font-weight: bold;
        }
        .content-section {
            display: flex;
            padding: 10px;
        }
        .photo {
            flex: 1;
            text-align: center;
        }
        .photo img {
            width: 100px;
            height: 120px;
            border: 2px solid #f26522;
            object-fit: cover;
        }
        .details {
            flex: 2;
            padding-left: 10px;
            font-size: 14px;
        }
        .details p {
            margin: 5px 0;
        }
        .bottom-section {
            text-align: center;
            padding: 10px;
            font-size: 10px;
            background: #ececec;
        }
        .barcode {
            text-align: center;
            margin-top: 5px;
        }
        .barcode img {
            width: 150px;
            height: 40px;
        }
    </style>
</head>
<body>

<div class="id-card">
    <div class="top-section">
        <img src="logo.png" alt="Logo" class="logo">
        <div class="institute">
            KOLHAPUR INSTITUTE OF TECHNOLOGY'S<br>
            COLLEGE OF ENGINEERING (AUTONOMOUS)<br>
            KOLHAPUR
        </div>
    </div>
    <div class="middle-section">
        <%= request.getAttribute("name") %>
    </div>
    <div class="content-section">
        <div class="photo">
            <img src="profile.jpg" alt="Student Photo">
        </div>
        <div class="details">
            <p><strong>PRN:</strong> <%= request.getAttribute("prn") %></p>
        </div>
    </div>
    <div class="bottom-section">
        Gokul Shirgaon, Kolhapur-416234 | www.kitcoek.in | info@kitcoek.in
    </div>
</div>

</body>
</html>
