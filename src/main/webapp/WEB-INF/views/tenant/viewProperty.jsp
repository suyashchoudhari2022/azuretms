<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Property Details</title>
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

        .property-card {
            background: white;
            border-radius: var(--border-radius);
            padding: 30px;
            box-shadow: var(--box-shadow);
            max-width: 800px;
        }

        .property-header {
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
        }

        .property-name {
            font-size: 24px;
            color: var(--primary-color);
            margin-bottom: 10px;
        }

        .property-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .detail-item {
            background: var(--secondary-color);
            padding: 15px;
            border-radius: var(--border-radius);
        }

        .detail-label {
            font-size: 14px;
            color: #666;
            margin-bottom: 5px;
        }

        .detail-value {
            font-size: 18px;
            font-weight: 600;
        }

        .actions {
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
         .avatar {
                    width: 40px;
                    height: 40px;
                    background: #1976d2; /* Primary color */
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    color: white;
                    font-weight: bold;
                    margin-right: 10px;
                }
                  .user-profile {
                            display: flex;
                            align-items: center;
                            padding: 15px 0;
                            margin-bottom: 20px;
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
                <i class="fas fa-building"></i>
                Property Details
            </h1>

            <div class="property-card">
                <div class="property-header">
                    <h2 class="property-name">${property.propertyName}</h2>
                </div>

                <div class="property-details">
                    <div class="detail-item">
                        <div class="detail-label">
                            <i class="fas fa-map-marker-alt"></i> Location
                        </div>
                        <div class="detail-value">${property.address}</div>
                    </div>

                    <div class="detail-item">
                        <div class="detail-label">
                            <i class="fas fa-rupee-sign"></i> Monthly Rent
                        </div>
                        <div class="detail-value">₹${property.rentAmount}</div>
                    </div>
                </div>

                <div class="actions">
                    <a href="/tenant/leaseProperty/${property.propertyID}" class="btn btn-primary">
                        <i class="fas fa-file-signature"></i>
                        Lease This Property
                    </a>
                    <a href="/tenant/dashboard" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i>
                        Back to Dashboard
                    </a>
                </div>
            </div>
        </main>
    </div>
</body>
</html>