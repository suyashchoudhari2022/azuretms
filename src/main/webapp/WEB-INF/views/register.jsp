<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TMS - Register</title>
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
            --border-color: #d1d5db;
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
            padding: 2rem;
            display: flex;
            justify-content: center;
        }

        .register-container {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }

        h2 {
            color:#1f2937;
            margin-bottom: 1.5rem;
            text-align: center;
            font-size: 1.8rem;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
        }

       .form-group {
           margin-bottom: 1rem;
           position: relative;
       }


        .form-group.full-width {
            grid-column: span 2;
        }

      .form-group label {
          display: block;
          margin-bottom: 0.5rem;
          color: var(--text-color);
          font-weight: 500;
      }

        .form-group i {
            position: absolute;
            left: 1rem;
            color: #6b7280;
            font-size: 1rem;
            top: 2.8rem; /* Positioning below label */
        }

        .form-group textarea + i {
            top: 2rem;
            transform: none;
        }

      .form-control {
          width: 100%;
          padding: 0.75rem 1rem 0.75rem 2.5rem;
          border: 1px solid var(--border-color);
          border-radius: 5px;
          font-size: 1rem;
          line-height: 1.5;
          height: 2.75rem;
      }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(37, 99, 235, 0.2);
        }

        select.form-control {
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%236b7280'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M19 9l-7 7-7-7'%3E%3C/path%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            background-size: 1em;
        }

      textarea.form-control {
          min-height: 100px;
          height: auto;
          resize: vertical;
          line-height: 1.5;
          padding-top: 2rem;
      }

      .form-group textarea ~ i {
          top: 3.8rem; /* Adjust for textarea */
      }

      .btn i {
          position: static;
          transform: none;
      }

        .btn {
            width: 100%;
            padding: 0.75rem;
            background-color: #1f2937;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .btn:hover {
            background-color: #1f2937;
        }

        .links {
            text-align: center;
            margin-top: 1.5rem;
        }

        .links a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }

        .links a:hover {
            text-decoration: underline;
        }

        /* Footer Styles */
        footer {
            background-color: #1f2937;
            color: white;
            padding: 1.5rem;
            text-align: center;
            margin-top: 2rem;
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

        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-group.full-width {
                grid-column: span 1;
            }

            .register-container {
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
        <div class="register-container">
            <h2><i class="fas fa-user-plus"></i> Create Account</h2>

            <form:form method="post" action="handleuser" modelAttribute="user">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="firstName">First Name</label>
                        <i class="fas fa-user"></i>
                        <form:input path="firstName" class="form-control" placeholder="Enter your first name"/>
                    </div>

                    <div class="form-group">
                        <label for="lastName">Last Name</label>
                        <i class="fas fa-user"></i>
                        <form:input path="lastName" class="form-control" placeholder="Enter your last name"/>
                    </div>

                    <div class="form-group">
                        <label for="username">Username</label>
                        <i class="fas fa-user-circle"></i>
                        <form:input path="username" class="form-control" placeholder="Choose a username"/>
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <i class="fas fa-envelope"></i>
                        <form:input path="email" type="email" class="form-control" placeholder="Enter your email"/>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <i class="fas fa-lock"></i>
                        <form:password path="password" class="form-control" placeholder="Create a password"/>
                    </div>

                    <div class="form-group">
                        <label for="contactNumber">Contact Number</label>
                        <i class="fas fa-phone"></i>
                        <form:input path="contactNumber" class="form-control" placeholder="Enter your contact number"/>
                    </div>



                    <div class="form-group full-width">
                        <label for="address">Address</label>
                        <i class="fas fa-home"></i>
                        <form:textarea path="address" class="form-control" placeholder="Enter your address"/>
                    </div>

                    <div class="form-group full-width">
                        <button type="submit" class="btn">
                            <i class="fas fa-user-plus"></i> Register Account
                        </button>
                    </div>
                </div>
            </form:form>

            <div class="links">
                <p>Already have an account? <a href="/login">Login here</a></p>
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