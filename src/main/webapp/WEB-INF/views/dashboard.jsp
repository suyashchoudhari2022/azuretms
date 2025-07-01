<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TMS - Dashboard</title>
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
            --success-color: #10b981;
            --warning-color: #f59e0b;
            --danger-color: #ef4444;
        }

        body {
            background-color: var(--background-color);
            color: var(--text-color);
            min-height: 100vh;
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

        .nav-link i {
            margin-right: 0.75rem;
            width: 20px;
            text-align: center;
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

        .page-header {
            margin-bottom: 2rem;
        }

        .page-title {
            font-size: 1.8rem;
            color: var(--text-color);
            margin-bottom: 0.5rem;
        }

        /* Dashboard Grid */
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: var(--card-bg);
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .stat-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .stat-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }

        .bg-primary { background-color: var(--primary-color); }
        .bg-success { background-color: var(--success-color); }
        .bg-warning { background-color: var(--warning-color); }
        .bg-danger { background-color: var(--danger-color); }

        .stat-value {
            font-size: 1.8rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .stat-label {
            color: #6b7280;
            font-size: 0.9rem;
        }

        /* Tables */
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
            background-color: #f8fafc;
        }

        .status-badge {
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            font-size: 0.875rem;
            font-weight: 500;
        }

        .status-active {
            background-color: #dcfce7;
            color: #166534;
        }

        .status-pending {
            background-color: #fef3c7;
            color: #92400e;
        }

        .action-btn {
            padding: 0.5rem 1rem;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            font-size: 0.875rem;
            font-weight: 500;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-danger {
            background-color: var(--danger-color);
            color: white;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 0;
                display: none;
            }

            .main-content {
                margin-left: 0;
            }

            .dashboard-grid {
                grid-template-columns: 1fr;
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
                ${loggedInUser.firstName} ${loggedInUser.lastName}
                <br>
            </div>
        </div>

        <ul class="nav-menu">
            <li class="nav-item">
                <a href="/dashboard" class="nav-link active">
                    <i class="fas fa-home"></i> Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a href="/list" class="nav-link">
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
                <a href="logout" class="nav-link">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </li>
        </ul>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
        <div class="page-header">
            <h1 class="page-title">Dashboard Overview</h1>
            <p>Welcome back, ${loggedInUser.firstName}!</p>
        </div>

        <!-- Stats Grid -->
        <div class="dashboard-grid">
            <div class="stat-card">
                <div class="stat-header">
                    <div class="stat-icon bg-primary">
                        <i class="fas fa-building"></i>
                    </div>
                </div>
                <div class="stat-value">${totalProperties}</div>
                <div class="stat-label">Total Properties</div>
            </div>

            <div class="stat-card">
                <div class="stat-header">
                    <div class="stat-icon bg-success">
                        <i class="fas fa-users"></i>
                    </div>
                </div>
                <div class="stat-value">${totalTenants}</div>
                <div class="stat-label">Total Tenants</div>
            </div>

            <div class="stat-card">
                <div class="stat-header">
                    <div class="stat-icon bg-warning">
                        <i class="fas fa-tools"></i>
                    </div>
                </div>
                <div class="stat-value">${totalLeases}</div>
                <div class="stat-label">Total Leases</div>
            </div>


        </div>

        <!-- Recent Activities Table -->
        <div class="table-container">
            <h2 style="margin-bottom: 1rem;">Recent Leases</h2>
            <table class="table">
                <thead>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Property Name</th>
                    <th>Lease Start Date</th>
                    <th>Lease End Date</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="lease" items="${recentLeases}">
                    <tr>
                        <td>${lease.firstName}</td>
                        <td>${lease.lastName}</td>
                        <td>${lease.propertyName}</td>
                        <td>${lease.leaseStartDate}</td>
                        <td>${lease.leaseEndDate}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </main>
</body>
</html>