<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PRO'FX | Login</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        /* Scoped Styles for the Login Page */
        .login-page {
            --light-gray: #F4F7FB;
            --white: #ffffff;
            --dark-blue: #0D3B66;
            --blue: #4C8BFB;
            --light-blue: #C3D9FF;
            --gray: #A9A9A9;
            --input-background: #F1F6FB;
            --button-background: #0D3B66;
            --button-hover-background: #4C8BFB;
            --input-border-color: #D1D7E6;
            --input-focus-border-color: #4C8BFB;
            --input-placeholder-color: #7D8B96;

            margin-top: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 60px); /* Subtract header height */
            padding: 20px;
            background-color: var(--light-gray);
        }

        .login-page .container {
            display: flex;
            width: 80%;
            max-width: 1200px;
            height: auto;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            overflow: hidden;
            background-color: var(--white);
        }

        .login-page .left-section {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .login-page .left-section img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .login-page .right-section {
            flex: 1;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-align: center;
        }

        .login-page .right-section h1 {
            font-size: 32px;
            font-weight: bold;
            color: var(--dark-blue);
            margin-bottom: 15px;
        }

        .login-page .right-section p {
            font-size: 16px;
            color: var(--gray);
            margin-bottom: 30px;
        }

        .login-page .right-section input[type="text"],
        .login-page .right-section input[type="password"] {
            width: 90%;
            padding: 12px;
            font-size: 14px;
            margin: 10px auto;
            border: 1px solid var(--input-border-color);
            border-radius: 8px;
            background-color: var(--input-background);
            color: var(--dark-blue);
        }

        .login-page .right-section input:focus {
            border-color: var(--input-focus-border-color);
            outline: none;
        }

        .login-page .right-section button {
            width: 90%;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            color: #ffffff;
            background-color: var(--button-background);
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-bottom: 15px;
            transition: all 0.3s ease-in-out;
        }

        .login-page .right-section button:hover {
            background-color: var(--button-hover-background);
            color: var(--dark-blue);
        }

        .login-page .right-section .signup-link a {
            color: var(--blue);
            text-decoration: none;
            font-weight: bold;
        }

        .login-page .right-section .signup-link a:hover {
            text-decoration: underline;
        }

        .login-page .right-section .forgot-password {
            color: var(--blue);
            text-decoration: none;
            font-weight: bold;
        }

        .login-page .right-section .forgot-password:hover {
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .login-page .container {
                flex-direction: column;
                width: 90%;
                height: auto;
            }

            .login-page .left-section {
                height: 300px;
            }

            .login-page .left-section img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .login-page .right-section {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
<%@ include file="demoheader.jsp" %>

<div class="login-page">
    <div class="container">
        <!-- Left Section: Image -->
        <div class="left-section">
            <img src="https://th.bing.com/th/id/OIP.oVI7RD7D2tOTjVgSOOIMigHaE8?w=600&h=400&rs=1&pid=ImgDetMain" alt="Farming Management">
        </div>

        <!-- Right Section: Login Form -->
        <div class="right-section">
            <h1>Welcome Back! Dear Farmer</h1>
            <div class="checklogin">
                <c:if test="${not empty message}">
                    <p class="error-message"><c:out value="${message}" /></p>
                </c:if>
            </div>
            <p>Are You An <a href="adminlogin.jsp">Admin</a>? Login Here!</p>
            <p>Login to manage your farming operations with PRO'FX</p>
            <form action="loginAction" method="POST">
                <input type="text" name="username" placeholder="Your username" required>
                <input type="password" name="password" placeholder="Your Password" required>
                <a href="forgetpassword" class="forgot-password">Forgot password?</a><br><br>
                <button type="submit">Log In</button>
            </form>
            <div class="signup-link">
                <p>Don't have an account? <a href="register">Sign Up</a></p>
            </div>
        </div>
    </div>
</div>
</body>
</html> 