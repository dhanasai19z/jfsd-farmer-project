<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ADMIN | ADD FARMER</title>
    <style>
        body {
            font-family: 'Roboto', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #e9ecef; /* Light gray for a modern look */
        }

        .main-content {
            margin-left: 250px; /* Aligns with the sidebar */
            padding: 20px;
        }

        .form-container {
            background-color: #ffffff; /* White for a clean look */
            border-radius: 10px; /* Rounded corners for a softer feel */
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            padding: 30px;
            max-width: 600px;
            margin: 40px auto; /* Centering with a gap from the top */
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .form-container:hover {
            transform: scale(1.02); /* Slight scaling on hover */
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15); /* Enhance shadow on hover */
        }

        h2 {
            text-align: center;
            color: #333333; /* Dark gray for contrast */
            font-size: 24px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #495057; /* Bootstrap-like color for text */
            font-size: 15px;
            font-weight: 500;
        }

        .form-group input {
            width: 100%; /* Full width for input */
            padding: 12px;
            border: 1px solid #ced4da; /* Light border for input */
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        .form-group input:focus {
            outline: none;
            border-color: #007bff; /* Blue border on focus */
            box-shadow: 0 0 4px rgba(0, 123, 255, 0.4); /* Glow effect */
        }

        .submit-button {
            width: 100%; /* Full-width button */
            padding: 12px;
            background-color: #007bff; /* Bootstrap primary color */
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease-in-out;
        }

        .submit-button:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        .error-message {
            color: red;
            text-align: center; /* Center align error messages */
            font-size: 14px;
            margin-bottom: 15px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <%@ include file="adminnavbar.jsp" %>
    <div class="main-content">
        <div class="form-container">
            <h2>Add Farmer</h2>
            <div class="checklogin">
                <c:if test="${not empty message}">
                    <p class="error-message"><c:out value="${message}" /></p>
                </c:if>
            </div>
            <form action="adminaddfarmer" method="post">
                <div class="form-group">
                    <label for="name">Farmer Name</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="text" id="phone" name="phone" required>
                </div>
                <div class="form-group">
                    <label for="username">User name</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" required>
                </div>
                <div class="form-group">
                    <label for="state">State</label>
                    <input type="text" id="state" name="state" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="image">Image-URL</label>
                    <input type="text" id="image" name="image" required>
                </div>
                <button type="submit" class="submit-button">Add Farmer</button>
            </form>
        </div>
    </div>
</body>
</html>

