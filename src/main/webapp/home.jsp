<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PRO'FX - Home</title>
    <!-- Embedded CSS -->
    <style>
        /* General Body Styles */
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #F3F6F9;
            margin: 0;
            padding: 0;
            color: #333333;
        }

        /* Header Section */
        header {
            background-color: #4A7A8C;
            padding: 20px 0;
            color: #FFFFFF;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            text-align: center;
        }

        nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: center;
        }

        nav ul li {
            margin: 0 15px;
        }

        nav ul li a {
            color: #FFFFFF;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        nav ul li a:hover {
            color: #BFE2F3;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(
                    rgba(0, 0, 0, 0.3),
                    rgba(0, 0, 0, 0.3)
                ),
                url('https://i.pinimg.com/originals/1a/d4/e7/1ad4e7cc7297738dca45245f1cb7dcbf.jpg')
                    no-repeat center center/cover;
            color: #FFFFFF;
            padding: 100px 0;
            text-align: center;
        }

        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 20px;
            color: #F1F1F1;
        }

        .hero p {
            font-size: 1.5rem;
            margin-bottom: 30px;
            color: #DDDDDD;
        }

        .hero a {
            font-size: 1.25rem;
            color: #FFFFFF;
            text-decoration: underline;
        }

        .buttons a {
            background-color: #4A7A8C;
            color: #FFFFFF;
            padding: 12px 30px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            margin: 0 10px;
            transition: background-color 0.3s ease;
        }

        .buttons a:hover {
            background-color: #72A9BE;
        }

        /* Grid Section */
        .grid-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
            margin: 40px auto;
            padding: 0 20px;
        }

        .grid-item {
            background-color: #FFFFFF;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            width: calc(20% - 20px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
        }

        .grid-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 14px rgba(0, 0, 0, 0.2);
        }

        .grid-item img {
            width: 70px;
            height: 70px;
            margin-bottom: 15px;
        }

        .grid-item h3 {
            color: #4A7A8C;
            margin-bottom: 10px;
        }

        .grid-item p {
            color: #777777;
        }

        /* Four Container Section */
        .four-containers {
            display: flex;
            gap: 20px;
            justify-content: center;
            margin: 40px auto;
            padding: 0 20px;
        }

        .container-item {
            position: relative;
            flex: 1;
            height: 250px;
            border-radius: 8px;
            background-size: cover;
            background-position: center;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .container-item:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .container-item h3 {
            position: absolute;
            bottom: 15px;
            left: 15px;
            margin: 0;
            padding: 10px 20px;
            background: rgba(0, 0, 0, 0.5);
            color: #FFFFFF;
            border-radius: 5px;
            font-size: 1.2rem;
        }
    </style>
</head>
<body>

<%@ include file="demoheader.jsp" %>

<section class="hero">
    <div class="container">
        <h1>Farming Management System</h1>
        <p>PRO'FX is a Simpler & Enhanced Farmer Management System. Explore Our Awesome <a href="services">Services</a> Now.</p>
        <div class="buttons">
            <a href="login" class="btn">Farmer Login</a>
            <a href="userlogin" class="btn">User Login</a>
            <a href="register" class="btn">Register</a>
        </div>
    </div>
</section>

<section class="home-section">
    <div class="grid-container">
        <div class="grid-item" onclick="location.href='adminlogin.jsp';">
            <img src="https://www.svgrepo.com/show/421614/admin-user-web.svg" alt="Admin Login">
            <h3>Admin Login</h3>
            <p>Secure admin access for management operations.</p>
        </div>
        <div class="grid-item" onclick="location.href='homeservices.jsp';">
            <img src="https://www.svgrepo.com/show/524608/globus.svg" alt="Services">
            <h3>Services</h3>
            <p>Providing top-notch services for your farming needs.</p>
        </div>
        <div class="grid-item" onclick="location.href='homeaboutus.jsp';">
            <img src="https://www.svgrepo.com/show/129388/about-us.svg" alt="About Us">
            <h3>About Us</h3>
            <p>Learn more about our mission and values.</p>
        </div>
        <div class="grid-item" onclick="location.href='homefeedbackus.jsp';">
            <img src="https://www.svgrepo.com/show/415812/contact-phone-talking.svg" alt="Contact Us">
            <h3>To Contact or Feedback Us</h3>
            <p>Get in touch with our support team anytime.</p>
        </div>
        <div class="grid-item" onclick="location.href='home247.jsp';">
            <img src="https://www.svgrepo.com/show/415825/contact-headset-communication.svg" alt="Help 24/7">
            <h3>Help 24/7</h3>
            <p>We are available round the clock to assist you.</p>
        </div>
    </div>
    <div class="four-containers">
        <div class="container-item" style="background-image: url('https://www.twi-global.com/image-library/hero/sustainability-istock-473558826.jpg');">
            <h3>Sustainability</h3>
        </div>
        <div class="container-item" style="background-image: url('https://th.bing.com/th/id/OIP.bGbdcB9cedxlk8hF1dt5ZwAAAA?rs=1&pid=ImgDetMain');">
            <h3>Food Safety</h3>
        </div>
        <div class="container-item" style="background-image: url('https://www.logility.com/wp-content/uploads/2022/09/LO_Leverage-People-and-Technology-in-a-Time-of-Supply-Chain-Disruptions_1280x661-1200x675.jpg');">
            <h3>Traceability (Future)</h3>
        </div>
        <div class="container-item" style="background-image: url('https://vst.co.jp/wp-content/uploads/2023/12/crop-growth-monitoring.jpg');">
         <h3>Growth Monitoring</h3>
        </div>
        </div>