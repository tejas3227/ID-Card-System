<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ID Card</title>
    <style>
        .id-card {
            width: 300px;
            height: 180px;
            border: 2px solid #000;
            padding: 20px;
            text-align: center;
            margin: 50px auto;
            font-family: Arial, sans-serif;
        }

        .home-button {
            display: block;
            width: 100px;
            margin: 20px auto;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }
        .home-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="id-card">
    <h2>KOLHAPUR INSTITUTE OF TECHNOLOGY</h2>
    <h3>College of Engineering Kolhapur</h3>
    <h2>${message}</h2>
</div>

<!-- HOME Button -->
<a href="home.html" class="home-button">Home</a>

</body>
</html>
