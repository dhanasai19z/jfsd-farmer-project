<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="demoheader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PRO'FX - Admin Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),
                url('https://th.bing.com/th/id/OIG1.fysQdrZJLZtbO.kALScq?w=1024&h=1024&rs=1&pid=ImgDetMain');
            background-size: cover;
            background-position: center;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #fff;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            padding: 30px 20px;
            text-align: center;
        }

        h1 {
            color: #2D5B56;
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .login-form p {
            margin-top: -10px;
            font-size: 14px;
            color: #6b6b6b;
        }

        .login-form a {
            color: #FF5722;
            text-decoration: none;
        }

        .login-form a:hover {
            text-decoration: underline;
        }

        .checklogin .error-message {
            color: #FF5722;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .input-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .input-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-size: 14px;
            font-weight: bold;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            color: #333;
        }

        .input-group input:focus {
            outline: none;
            border-color: #FF5722;
        }

        .signin-button {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            background-color: #2D5B56;
            border: none;
            border-radius: 5px;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .signin-button:hover {
            background-color: #FF5722;
        }

        .reset-password {
            display: inline-block;
            margin-top: 20px;
            font-size: 14px;
            color: #2D5B56;
            text-decoration: none;
        }

        .reset-password:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px 15px;
            }

            h1 {
                font-size: 20px;
            }

            .signin-button {
                padding: 10px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Login</h1>
        <p>Are you a <a href="login.jsp">Farmer?</a> Login here!</p>
        <div class="checklogin">
            <c:if test="${not empty message}">
                <p class="error-message"><c:out value="${message}" /></p>
            </c:if>
        </div>
        <form method="post" action="/checkadminlogin">
            <div class="input-group">
                <label for="admin-username"><i class="fas fa-user"></i> Admin Username</label>
                <input type="text" id="admin-username" name="admin-username" required>
            </div>
            <div class="input-group">
                <label for="admin-password"><i class="fas fa-lock"></i> Admin Password</label>
                <input type="password" id="admin-password" name="admin-password" required>
            </div>
            <button type="submit" class="signin-button">Sign In</button>
        </form>
        <a href="reset-password.jsp" class="reset-password">Reset your password?</a>
    </div>
</body>
</html>
