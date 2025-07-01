<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Leases</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
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
            padding: 0; /* Remove padding */
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

        .nav-link.active {
            background: var(--secondary-color);
            color: var(--primary-color);
        }

        .nav-link i {
            margin-right: 10px; /* Space between icon and text */
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

        .form-card {
            background: white;
            border-radius: var(--border-radius);
            padding: 25px;
            box-shadow: var(--box-shadow);
            margin-bottom: 30px; /* Space between cards */
        }

        .form-card h3 {
            margin-bottom: 20px;
            color: var(--primary-color); /* Primary color for the title */
        }

        .lease-item {
            padding: 15px;
            border-radius: var(--border-radius);
            background: var(--secondary-color);
            margin-bottom: 15px;
            transition: transform 0.3s; /* Animation effect */
        }

        .lease-item:hover {
            transform: scale(1.02); /* Scale effect on hover */
        }

        .lease-title {
            font-weight: 600;
            margin-bottom: 5px;
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

        .no-leases {
            text-align: center;
            font-size: 1.2em;
            color: var(--accent-color);
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
                    ${loggedInUser .firstName.charAt(0)}${loggedInUser .lastName.charAt(0)}
                </div>
                <div class="user-info">
                    ${loggedInUser .firstName} ${loggedInUser .lastName}
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
                    <a href="/tenant/myLeases" class="nav-link active">
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

        <div class="main-content">
            <h2 class="page-title">My Leases</h2>

            <c:if test="${empty leases}">
                <div class="no-leases">
                    <p>You have no active leases.</p>
                </div>
            </c:if>

            <c:if test="${not empty leases}">
                <div class="form-card">
                    <c:forEach var="lease" items="${leases}">
                        <div class="lease-item">
                            <div class="lease-title">Lease ID: ${lease.leaseID}</div>
                            <div class="lease-dates">
                                <div class="lease-date">
                                    <i class="fas fa-calendar me-2"></i> Start Date: ${lease.leaseStartDate}
                                </div>
                                <div class="lease-date">
                                    <i class="fas fa-calendar-alt me-2"></i> End Date: ${lease.leaseEndDate}
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>