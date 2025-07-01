<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Property</title>
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
            --sidebar-color: #1f2937;
            --text-color: #ffffff;
            --border-color: #d1d5db;
            --card-bg: #ffffff;
            --detail-text-color: #333333; /* Darker color for better visibility */
            --label-color: #1f2937; /* Color for labels */
        }

        body {
            background-color: var(--background-color);
            color: var(--detail-text-color);
            display: flex;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: var(--sidebar-color);
            color: var(--text-color);
            padding: 1rem;
            position: fixed;
            height: 100vh;
            overflow-y: auto;
        }

        .sidebar-header {
            padding: 1rem;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            margin-bottom: 1rem;
        }

        .sidebar-logo {
            font-size: 1.8rem; /* Increased logo font size */
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .user-info {
            font-size: 1rem; /* Increased user info font size */
            opacity: 0.9; /* Slightly increased opacity */
        }

        .nav-menu {
            list-style: none;
            padding: 0;
        }

        .nav-item {
            margin-bottom: 0.5rem;
        }

        .nav-link {
            display: flex;
            align-items: center;
            padding: 0.75rem 1rem;
            color: var(--text-color);
            text-decoration: none;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .nav-link.active {
            background-color: var(--primary-color);
        }

        .nav-link i {
            margin-right: 1rem; /* Space between icon and text */
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            margin-left: 250px;
            padding: 2rem;
        }

        h2 {
            margin-bottom: 1.5rem;
            color: var(--primary-color); /* Changed heading color */
        }

        .form-container {
            background: var(--card-bg);
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: bold;
            color: var(--label-color); /* Changed label color */
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        textarea,
        select {
            width: 100%;
            padding: 0.5rem;
            margin-bottom: 1rem;
            border: 1px solid var(--border-color);
            border-radius: 5px;
            font-size: 1rem; /* Increased font size for inputs */
            color: var(--detail-text-color); /* Changed input text color */
        }

        input[type="submit"] {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 0.75rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 1rem; /* Increased font size for submit button */
        }

        input[type="submit"]:hover {
            background-color: var(--secondary-color);
        }

        .back-link {
            display: inline-block;
            padding: 0.5rem 1rem;
            background-color: var(--primary-color);
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
            margin-top: 1rem;
        }

        .back-link:hover {
            background-color: var(--secondary-color);
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 0;
                display: none;
            }

            .main-content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="sidebar-header">
            <div class="sidebar-logo">
                <i class="fas fa-building"></i> TMS
            </div>
            <div class="user-info">
                ${loggedInUser .firstName} ${loggedInUser .lastName}
                <br>
            </div>
        </div>

        <ul class="nav-menu">
            <li class="nav-item">
                <a href="/dashboard" class="nav-link">
                    <i class="fas fa-home"></i> Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a href="/list" class="nav-link active">
                    <i class="fas fa-building"></i> Properties
                </a>
            </li>
            <li class="nav-item">
                <a href="/admin/users" class="nav-link">
                    <i class="fas fa-users"></i> Tenants
                </a>
            </li>
            <li class="nav-item">
                <a href="/admin/leaseDetails" class="nav-link">
                    <i class="fas fa-file-contract"></i> Leases
                </a>
            </li>



            <li class="nav-item">
                <a href="/logout" class="nav-link">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </li>
        </ul>
    </aside>
    <div class="main-content">
        <h2>Edit Property</h2>
        <div class="form-container">
            <form:form method="post" action="/editp" modelAttribute="property">
                <form:hidden path="propertyID"/>  <!-- Important: Keep the ID for update -->

                <label>Property Name:</label>
                <form:input path="propertyName"/>

                <label>Address:</label>
                <form:textarea path="address"/>

                <label>Unit Number:</label>
                <form:input path="unitNumber"/>

                <label>Property Type:</label>
                <form:select path="propertyType">
                    <form:option value="Apartment" label="Apartment"/>
                    <form:option value="House" label="House"/>
                    <!-- Add more property types as needed -->
                </form:select>

                <label>Size (sq ft):</label>
                <form:input path="size"/>

                <label>Amenities:</label>
                <form:textarea path="amenities"/>

                <label>Rent Amount:</label>
                <form:input path="rentAmount"/>

                <label>Available From:</label>
                <form:input type="date" path="availableFrom"/>

                <label>Available To:</label>
                <form:input type="date" path="availableTo"/>

                <input type="submit" value="Update Property"/>
            </form:form>
        </div>
        <a href="/list" class="back-link">Back to List</a>
    </div>
</body>
</html>