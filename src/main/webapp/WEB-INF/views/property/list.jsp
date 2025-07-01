<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Property List</title>
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
            --text-color: #1f2937;
            --border-color: #d1d5db;
            --card-bg: #ffffff;
        }

        body {
            background-color: var(--background-color);
            color: var(--text-color);
            display: flex;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: var(--sidebar-color);
            color: white;
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
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .user-info {
            font-size: 0.9rem;
            opacity: 0.8;
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
            color: white;
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
            color: var(--text-color);
        }

        .add-property-link {
            display: inline-block;
            margin-bottom: 1rem;
            padding: 0.5rem 1rem;
            background-color: var(--primary-color);
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .add-property-link:hover {
            background-color: var(--secondary-color);
        }

        .table-container {
            background: var(--card-bg);
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow-x: auto;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th,
        .table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid var(--border-color);
        }

        .table th {
            background-color: #f8fafc;
            font-weight: 600;
        }

        .table tr:hover {
            background-color: #f1f5f9;
        }

        .action-links a {
            margin-right: 10px;
            color: var(--primary-color);
            text-decoration: none;
            transition: color 0.3s;
        }

        .action-links a:hover {
            color: var(--secondary-color);
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

            </li>


            <li class="nav-item">
                <a href="/logout" class="nav-link">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </li>
        </ul>
    </aside>

    <div class="main-content">
        <h2>Property List</h2>
        <a href="add" class="add-property-link">Add New Property</a>
        <div class="table-container">
            <c:if test="${empty properties}">
                <p>No properties found.</p>
            </c:if>

            <c:if test="${not empty properties}">
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Address</th>
                            <th>Rent</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="property" items="${properties}">
                            <tr>
                                <td>${property.propertyID}</td>
                                <td>${property.propertyName}</td>
                                <td>${property.address}</td>
                                <td>${property.rentAmount}</td>
                                <td class="action-links">
                                    <a href="view/${property.propertyID}">View</a> |
                                    <a href="edit/${property.propertyID}">Edit</a> |
                                    <a href="delete/${property.propertyID}">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
</body>
</html>