
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lease Property Form - Tenant Portal</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <style>
        body {
            background-color: #f0f2f5; /* Updated to match the dashboard */
        }

        .sidebar {
            width: 250px;
            background: white;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            position: fixed;
            height: 100vh;
        }

        .logo-container {
            padding: 20px 0;
            border-bottom: 1px solid #eee;
            margin-bottom: 20px;
            font-weight:bold;
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
            background: #1976d2; /* Primary color */
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
            padding:0;

        }

        .nav-item {
            margin-bottom: 10px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            padding: 12px 15px;
            color: #333; /* Text color */
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            background: #f5f5f5; /* Secondary color */
            color: #1976d2; /* Primary color */
        }

        .nav-link.active {
            background: #f5f5f5; /* Secondary color */
            color: #1976d2; /* Primary color */
        }

        .nav-link i {
            margin-right: 10px; /* Space between icon and text */
        }

        .main-content {
            flex: 1;
            margin-left: 250px;
            padding: 30px;
        }

        .form-card {
            background: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        .form-control {
            border-radius: 6px;
            padding: 10px 15px;
        }

        .form-label {
            font-weight: 500;
            margin-bottom: 8px;
        }

        .btn-primary {
            padding: 10px 20px;
            border-radius: 6px;
        }

        .back-link {
            color: #6c757d;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .back-link:hover {
            color: #1976d2; /* Primary color */
        }
         .logo-container {
                    padding: 20px 0;
                    border-bottom: 1px solid #eee;
                    margin-bottom: 20px;
                }
    </style>
</head>
<body>

        <aside class="sidebar">
                    <div class="logo-container" style="font-weight:bold">
                        <h4>Tenant Portal</h4>
                    </div>
                    <div class="user-profile">
                        <div class="avatar">
                            ${loggedInUser.firstName.charAt(0)}${loggedInUser.lastName.charAt(0)}
                        </div>
                        <div class="user-info">
                            ${loggedInUser.firstName} ${loggedInUser.lastName}
                        </div>
                    </div>
                    <ul class="nav-menu" >
                        <li class="nav-item" >
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

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 main-content">
                <a href="/tenant/dashboard" class="back-link">
                    <i class="fas fa-arrow-left me-2"></i> Back to Dashboard
                </a>

                <div class="form-card">
                    <h3 class="mb-4">Lease Property: ${property.propertyName}</h3>

                    <form:form modelAttribute="lease" action="/tenant/createLease?propertyID=${property.propertyID}" method="post" cssClass="row g-3">
                        <div class="col-md-6">
                            <label for="leaseStartDate" class="form-label">
                                <i class="fas fa-calendar me-2"></i>Lease Start Date
                            </label>
                            <form:input type="text" id="leaseStartDate" path="leaseStartDate" cssClass="form-control"/>
                        </div>

                        <div class="col-md-6">
                            <label for="leaseEndDate" class="form-label">
                                <i class="fas fa-calendar-alt me-2"></i>Lease End Date
                            </label>
                            <form:input type="text" id="leaseEndDate" path="leaseEndDate" cssClass="form-control"/>
                        </div>

                        <div class="col-md-6">
                            <label for="rentAmount" class="form-label">
                                <i class="fas fa-money-bill-wave me-2"></i>Rent Amount
                            </label>
                            <form:input type="text" id="rentAmount" path="rentAmount" cssClass="form-control"/>
                        </div>

                        <div class="col-md-6">
                            <label for="securityDeposit" class="form-label">
                                <i class="fas fa-shield-alt me-2"></i>Security Deposit
                            </label>
                            <form:input type="text" id="securityDeposit" path="securityDeposit" cssClass="form-control"/>
                        </div>

                        <div class="col-12">
                            <label for="leaseAgreement" class="form-label">
                                <i class="fas fa-file-contract me-2"></i>Lease Agreement File Path
                            </label>
                            <form:input type="text" id="leaseAgreement" path="leaseAgreement" cssClass="form-control"/>
                        </div>

                        <div class="col-12 mt-4">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-check me-2"></i>Create Lease
                            </button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function() {
            $("#leaseStartDate, #leaseEndDate").datepicker({
                dateFormat: 'yy-mm-dd',
                changeMonth: true,
                changeYear: true,
                showOtherMonths: true,
                selectOtherMonths: true
            });
        });
    </script>
</body>
</html>