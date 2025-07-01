<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Tenant Dashboard</title>
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

        /* Main Content Styles */
        .main-content {
            flex: 1;
            margin-left: 250px;
            padding: 2rem;
        }

        h2 {
            margin-bottom: 1.5rem;
            color: var(--primary-color);
        }

        .card {
            background: var(--card-bg);
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }

        .card h3 {
            margin-bottom: 1rem;
        }

        .action-btn {
            padding: 0.5rem 1rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .action-btn:hover {
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
                <i class="fas fa-user-circle"></i> Tenant Dashboard
            </div>
            <div class="user-info">
                ${loggedInUser .firstName} ${loggedInUser .lastName}
                <br>
                <small>${loggedInUser .role}</small>
            </div>
        </div>

        <ul class="nav-menu">
            <li class="nav-item">
                <a href="/dashboard" class="nav-link active">
                    <i class="fas fa-home"></i> Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a href="/leases" class="nav-link">
                    <i class="fas fa-file-contract"></i> My Leases
                </a>
            </li>
            <li class="nav-item">
                <a href="/payments" class="nav-link">
                    <i class="fas fa-money-bill-wave"></i> Payments
                </a>
            </li>
            <li class="nav-item">
                <a href="/profile" class="nav-link">
                    <i class="fas fa-user-circle"></i> Profile
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
        <h2>Welcome to Your Dashboard</h2>
        <div class="card">
            <h3>Your Information</h3>
            <p><strong>Name:</strong> ${loggedInUser .firstName} ${loggedInUser .lastName}</p>
            <p><strong>Email:</strong> ${loggedInUser .email}</p>
            <p><strong>Phone:</strong> ${loggedInUser .contactNumber}</p>
        </div>

        <div class="card">
            <h3>Lease Information</h3>
            <p><strong>Current Lease:</strong> ${currentLease.propertyName}</p>
            <p><strong>Lease Start Date:</strong> ${currentLease.startDate}</p>
            <p><strong>Lease End Date:</strong> ${currentLease.endDate}</p>
            <button class="action-btn" onclick="window.location.href='/leases'">View Leases</button>
        </div>

        <div class="card">
            <h3>Payment Status</h3>
            <p><strong>Next Payment Due:</strong> ${nextPayment.dueDate}</p>
            <p><strong>Amount:</strong> ${nextPayment.amount} Rs</p>
            <button class="action-btn" onclick="window.location.href='/payments'">Make Payment</button>
        </div>
    </div>
</body>
</html>