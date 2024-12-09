<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="demoheader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PRO'FX - Farmer Registration</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        :root {
            --primary-color: #2D5B56; /* Dark Green */
            --secondary-color: #F8D349; /* Bright Yellow */
            --accent-color: #FF5722; /* Burnt Orange */
            --background-color: #F1F1F1;
            --white: #FFFFFF;
            --input-bg: #E4E4E4;
            --input-focus-border-color: #FF5722;
            --button-bg-color: #2D5B56;
            --button-hover-bg-color: #F8D349;
            --text-color: #333;
        }

        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--background-color);
            color: var(--text-color);
        }

        .farmer-registration-page {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .farmer-registration-page .container {
            display: flex;
            flex-direction: row;
            background-color: var(--white);
            border-radius: 15px;
            overflow: hidden;
            max-width: 1000px;
            width: 100%;
            box-shadow: 0 8px 40px rgba(0, 0, 0, 0.1);
        }

        .farmer-registration-page .form-container {
            padding: 40px;
            flex: 1;
            background-color: var(--white);
        }

        .farmer-registration-page .form-container h2 {
            margin-bottom: 25px;
            color: var(--primary-color);
            font-size: 24px;
            font-weight: bold;
        }

        .farmer-registration-page .form-group {
            margin-bottom: 20px;
        }

        .farmer-registration-page .form-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            color: var(--primary-color);
        }

        .farmer-registration-page .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            background-color: var(--input-bg);
            color: var(--text-color);
            transition: border-color 0.3s ease-in-out;
        }

        .farmer-registration-page .form-group input:focus {
            outline: none;
            border-color: var(--input-focus-border-color);
        }

        .farmer-registration-page .register-button {
            width: 100%;
            padding: 12px;
            background-color: var(--button-bg-color);
            border: none;
            border-radius: 8px;
            color: var(--white);
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        .farmer-registration-page .register-button:hover {
            background-color: var(--button-hover-bg-color);
        }

        .farmer-registration-page .forgot-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: var(--primary-color);
            text-decoration: none;
            font-size: 14px;
        }

        .farmer-registration-page .forgot-link:hover {
            text-decoration: underline;
        }

        .farmer-registration-page .image-container {
            flex: 1;
            background: url('https://in2english.net/wp-content/uploads/2019/03/robinson-crusoe2.jpg') no-repeat center center;
            background-size: cover;
            position: relative;
            overflow: hidden;
        }

        .farmer-registration-page .image-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4);
        }

        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 15px;
        }

        @media (max-width: 768px) {
            .farmer-registration-page .container {
                flex-direction: column;
            }

            .farmer-registration-page .image-container {
                height: 250px;
            }

            .farmer-registration-page .form-container {
                padding: 20px;
            }

            .farmer-registration-page .form-group input {
                padding: 10px;
            }

            .farmer-registration-page .register-button {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="farmer-registration-page">
        <div class="container">
            <div class="form-container">
                <h2>Farmer Registration</h2>
                <div class="checklogin">
                    <c:if test="${not empty message}">
                        <p class="error-message"><c:out value="${message}" /></p>
                    </c:if>
                </div>
                <form action="/checkfarmerregister" method="POST" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="name"><i class="fas fa-user"></i> Name</label>
                        <input type="text" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="phone"><i class="fas fa-phone"></i> Phone</label>
                        <input type="text" id="phone" name="phone" required>
                    </div>
                    <div class="form-group">
                        <label for="username"><i class="fas fa-user"></i> Username</label>
                        <input type="text" id="username" name="username" required>
                    </div>
                    <div class="form-group">
                        <label for="password"><i class="fas fa-lock"></i> Password</label>
                        <input type="password" id="password" name="password" 
                               pattern="(?=.*[0-9])(?=.*[@#$%^&+=])(?=.*[a-zA-Z]).{9,}" 
                               title="Password must be at least 9 characters long, include at least one special character (@#$%^&+=), and one number" 
                               required>
                    </div>
                    <div class="form-group">
                        <label for="address"><i class="fas fa-home"></i> Address</label>
                        <input type="text" id="address" name="address" required>
                    </div>
                    <div class="form-group">
                        <label for="state"><i class="fas fa-map-marker-alt"></i> State</label>
                        <input type="text" id="state" name="state" required>
                    </div>
                    <div class="form-group">
                        <label for="imageUrl"><i class="fas fa-link"></i> Image URL</label>
                        <input type="url" id="imageUrl" name="imageUrl" placeholder="Enter image URL (JPEG/PNG)" required>
                    </div>
                    <button type="submit" class="register-button">Register</button>
                </form>
                <a href="login" class="forgot-link">Already have an account? Sign In</a>
            </div>
            <div class="image-container"></div>
        </div>
    </div>
</body>
</html>
