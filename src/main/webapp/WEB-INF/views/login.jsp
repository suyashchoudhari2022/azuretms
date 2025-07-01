<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TMS - Login</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        :root {
            --primary-color: #2563eb;
            --secondary-color: #1e40af;
            --background-color: #f3f4f6;
            --text-color: #1f2937;
        }

        body {
            background-color: var(--background-color);
            color: var(--text-color);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Header Styles */
        header {
            background: #1f2937;
            color: white;
            padding: 1rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
        }

        /* Main Content Styles */
        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem;
            background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }

        .login-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 420px;
            overflow: hidden;
        }

        .login-header {
            background-color:#1f2937;
            color: white;
            padding: 1.5rem;
            text-align: center;
        }

        .login-header h2 {
            color: white;
            margin: 0;
            font-size: 1.75rem;
        }

        .login-body {
            padding: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #4b5563;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #6b7280;
        }

        .form-control {
            width: 100%;
            padding: 0.875rem 1rem 0.875rem 2.5rem;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.2);
        }

        .btn {
            width: 100%;
            padding: 0.875rem;
            background-color: #1f2937;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 0.5rem;
        }

        .btn:hover {
            background-color: #1f2937;
            transform: translateY(-1px);
        }

        .btn:active {
            transform: translateY(0);
        }

        .btn i {
            font-size: 1.125rem;
        }

        .links {
            text-align: center;
            margin-top: 1.5rem;
            font-size: 0.95rem;
        }

        .links a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .links a:hover {
            color: var(--secondary-color);
            text-decoration: underline;
        }

        .message {
            text-align: center;
            margin-top: 1.25rem;
            padding: 0.75rem;
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .message i {
            font-size: 1.25rem;
        }

        .error {
            background-color: #fee2e2;
            color: #dc2626;
        }

        .success {
            background-color: #dcfce7;
            color: #16a34a;
        }

        /* Footer Styles */
        footer {
            background-color: #1f2937;
            color: white;
            padding: 1.5rem;
            text-align: center;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
        }

        .footer-links {
            margin-bottom: 1rem;
        }

        .footer-links a {
            color: white;
            text-decoration: none;
            margin: 0 1rem;
        }

        .footer-links a:hover {
            text-decoration: underline;
        }

        @media (max-width: 640px) {
            .login-body {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="header-content">
            <div class="logo">
                <i class="fas fa-building"></i> TMS
            </div>
            <nav>
                <a href="/" style="color: white; text-decoration: none;">Home</a>
            </nav>
        </div>
    </header>

    <main>
        <div class="login-container">
            <div class="login-header">
                <h2><i class="fas fa-user-circle"></i> Login</h2>
            </div>

            <div class="login-body">
                <form:form method="post" action="loginpage" modelAttribute="user">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <div class="input-wrapper">
                            <i class="fas fa-user"></i>
                            <form:input path="username" id="username" class="form-control" placeholder="Enter your username"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <div class="input-wrapper">
                            <i class="fas fa-lock"></i>
                            <form:password path="password" id="password" class="form-control" placeholder="Enter your password"/>
                        </div>
                    </div>

                    <button type="submit" class="btn">
                        <i class="fas fa-sign-in-alt"></i> Login
                    </button>
                </form:form>

                <div class="links">
                    <p>Don't have an account? <a href="register">Register</a></p>
                </div>

                <c:if test="${not empty loginError}">
                    <div class="message error">
                        <i class="fas fa-exclamation-circle"></i> ${loginError}
                    </div>
                </c:if>

                <c:if test="${not empty registrationSuccess}">
                    <div class="message success">
                        <i class="fas fa-check-circle"></i> ${registrationSuccess}
                    </div>
                </c:if>
            </div>
        </div>
    </main>

    <footer>
        <div class="footer-content">
            <div class="footer-links">
                <a href="/about">About</a>
                <a href="/contact">Contact</a>
                <a href="/privacy">Privacy Policy</a>
                <a href="/terms">Terms of Service</a>
            </div>
            <p>&copy; 2025 Tenant Management System. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>