<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tenant Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        :root {
            --primary-color: #1976d2;
            --secondary-color: #f5f5f5;
            --accent-color: #dc3545;
            --text-color: #333;
            --border-radius: 8px;
            --box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f2f5;
            color: var(--text-color);
            line-height: 1.6;
        }

        .dashboard-container {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 250px;
            background: white;
            padding: 20px;
            box-shadow: var(--box-shadow);
            position: fixed;
            height: 100vh;
        }

        .logo-container {
            padding: 20px 0;
            border-bottom: 1px solid #eee;
            margin-bottom: 20px;
        }

        .user-profile {
            display: flex;
            align-items: center;
            padding: 15px 0;
            margin-bottom: 20px;
        }

        .avatar {
            width: 40px;
            height: 40px;
            background: var(--primary-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            margin-right: 10px;
        }

        .nav-menu {
            list-style: none;
        }

        .nav-item {
            margin-bottom: 10px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            padding: 12px 15px;
            color: var(--text-color);
            text-decoration: none;
            border-radius: var(--border-radius);
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            background: var(--secondary-color);
            color: var(--primary-color);
        }

        .nav-link i {
            margin-right: 10px;
            width: 20px;
        }

        .main-content {
            flex: 1;
            margin-left: 250px;
            padding: 30px;
        }

        .page-title {
            margin-bottom: 30px;
            color: var(--text-color);
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .card {
            background: white;
            border-radius: var(--border-radius);
            padding: 20px;
            box-shadow: var(--box-shadow);
        }

        .card-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }

        .card-header i {
            margin-right: 10px;
            color: var(--primary-color);
        }

        .property-item, .lease-item {
            padding: 15px;
            border-radius: var(--border-radius);
            background: var(--secondary-color);
            margin-bottom: 15px;
        }

        .property-title {
            font-weight: 600;
            margin-bottom: 5px;
        }

        .property-address {
            color: #666;
            margin-bottom: 10px;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            padding: 8px 16px;
            border-radius: var(--border-radius);
            text-decoration: none;
            font-size: 14px;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .btn i {
            margin-right: 5px;
        }

        .btn-primary {
            background: var(--primary-color);
            color: white;
        }

        .btn-primary:hover {
            background: #1565c0;
        }

        .btn-danger {
            background: var(--accent-color);
            color: white;
        }

        .btn-danger:hover {
            background: #c82333;
        }

        .lease-dates {
            margin-bottom: 10px;
        }

        .lease-date {
            display: flex;
            align-items: center;
            margin-bottom: 5px;
        }

        .lease-date i {
            margin-right: 8px;
            color: var(--primary-color);
        }

        .actions {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <aside class="sidebar">
            <div class="logo-container">
                <h2>Tenant Portal</h2>
            </div>
            <div class="user-profile">
                <div class="avatar">
                    ${loggedInUser.firstName.charAt(0)}${loggedInUser.lastName.charAt(0)}
                </div>
                <div class="user-info">
                    ${loggedInUser.firstName} ${loggedInUser.lastName}
                </div>
            </div>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="/tenant/dashboard" class="nav-link">
                        <i class="fas fa-tachometer-alt"></i>
                        Dashboard
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/tenant/properties" class="nav-link">
                        <i class="fas fa-building"></i>
                        Properties
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/tenant/myLeases" class="nav-link">
                        <i class="fas fa-file-contract"></i>
                        My Leases
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/logout" class="nav-link">
                        <i class="fas fa-sign-out-alt"></i>
                        Logout
                    </a>
                </li>
            </ul>
        </aside>

        <main class="main-content">
            <h1 class="page-title">Dashboard</h1>

            <div class="dashboard-grid">
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-building"></i>
                        <h2>Available Properties</h2>
                    </div>
                    <div class="card-content">
                        <c:forEach var="property" items="${properties}">
                            <div class="property-item">
                                <div class="property-title">${property.propertyName}</div>
                                <div class="property-address">${property.address}</div>
                                <a href="/tenant/viewProperty/${property.propertyID}" class="btn btn-primary">
                                    <i class="fas fa-info-circle"></i> View Details
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-file-contract"></i>
                        <h2>My Leases</h2>
                    </div>
                    <div class="card-content">
                        <c:forEach var="lease" items="${leases}">
                            <div class="lease-item">
                                <div class="lease-dates">
                                    <div class="lease-date">
                                        <i class="fas fa-calendar-alt"></i>
                                        Start: ${lease.leaseStartDate}
                                    </div>
                                    <div class="lease-date">
                                        <i class="fas fa-calendar-check"></i>
                                        End: ${lease.leaseEndDate}
                                    </div>
                                </div>
                                <div class="actions">
                                    <a href="/tenant/updateLease/${lease.leaseID}" class="btn btn-primary">
                                        <i class="fas fa-edit"></i> Update
                                    </a>
                                    <a href="/tenant/deleteLease/${lease.leaseID}" class="btn btn-danger">
                                        <i class="fas fa-trash-alt"></i> Delete
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>