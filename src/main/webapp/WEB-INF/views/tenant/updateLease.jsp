<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Lease | Tenant Portal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        :root {
            --primary-color: #1976d2;
            --secondary-color: #f5f5f5;
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
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .form-card {
            background: white;
            border-radius: var(--border-radius);
            padding: 30px;
            box-shadow: var(--box-shadow);
            max-width: 800px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--text-color);
        }

        .form-control {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: var(--border-radius);
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(25, 118, 210, 0.1);
        }

        .form-actions {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            padding: 12px 24px;
            border-radius: var(--border-radius);
            text-decoration: none;
            font-size: 16px;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .btn i {
            margin-right: 8px;
        }

        .btn-primary {
            background: var(--primary-color);
            color: white;
        }

        .btn-primary:hover {
            background: #1565c0;
        }

        .btn-secondary {
            background: var(--secondary-color);
            color: var(--text-color);
        }

        .btn-secondary:hover {
            background: #e0e0e0;
        }

        .file-upload {
            position: relative;
            overflow: hidden;
        }

        .file-upload input[type=file] {
            position: absolute;
            top: 0;
            right: 0;
            min-width: 100%;
            min-height: 100%;
            font-size: 100px;
            text-align: right;
            filter: alpha(opacity=0);
            opacity: 0;
            outline: none;
            cursor: pointer;
            display: block;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <aside class="sidebar">
            <div class="logo-container">
                <h2>Tenant Portal</h2>
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
            <h1 class="page-title">
                <i class="fas fa-edit"></i>
                Update Lease
            </h1>

            <div class="form-card">
                <form:form modelAttribute="lease" action="/tenant/updateLease" method="post">
                    <form:hidden path="leaseID"/>

                    <div class="form-group">
                        <label class="form-label">
                            <i class="fas fa-calendar-alt"></i>
                            Lease Start Date
                        </label>
                        <form:input path="leaseStartDate" class="form-control" type="date"/>
                    </div>

                    <div class="form-group">
                        <label class="form-label">
                            <i class="fas fa-calendar-check"></i>
                            Lease End Date
                        </label>
                        <form:input path="leaseEndDate" class="form-control" type="date"/>
                    </div>

                    <div class="form-group">
                        <label class="form-label">
                            <i class="fas fa-rupee-sign"></i>
                            Rent Amount
                        </label>
                        <form:input path="rentAmount" class="form-control" type="number"/>
                    </div>

                    <div class="form-group">
                        <label class="form-label">
                            <i class="fas fa-shield-alt"></i>
                            Security Deposit
                        </label>
                        <form:input path="securityDeposit" class="form-control" type="number"/>
                    </div>

                    <div class="form-group">
                        <label class="form-label">
                            <i class="fas fa-file-contract"></i>
                            Lease Agreement
                        </label>
                        <div class="file-upload">
                            <form:input path="leaseAgreement" class="form-control" type="file"/>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i>
                            Update Lease
                        </button>
                        <a href="/tenant/dashboard" class="btn btn-secondary">
                            <i class="fas fa-arrow-left"></i>
                            Back to Dashboard
                        </a>
                    </div>
                </form:form>
            </div>
        </main>
    </div>
</body>
</html>