<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>View Property</title>
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
            --link-color: #2563eb; /* Color for links */
        }

        body {
            background-color: var(--background-color);
            color: var(--detail-text-color);
            display: flex;
            font-size: 16px; /* Base font size */
            line-height: 1.6; /* Increased line height */
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

        .property-details {
            background: var(--card-bg);
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }

        .property-details p {
            margin-bottom: 1rem;
            font-size: 1.1rem;
            color: var(--detail-text-color); /* Use the new variable for text color */
        }

        .back-link {
            display: inline-block;
            padding: 0.5rem 1rem;
            background-color: var(--primary-color);
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
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

           </li>


           <li class="nav-item">
               <a href="/logout" class="nav-link">
                   <i class="fas fa-sign-out-alt"></i> Logout
               </a>
           </li>
       </ul>
   </aside>
   <div class="main-content">
       <h2>Property Details</h2>
       <div class="property-details">
           <p><strong>Property ID:</strong> ${property.propertyID}</p>
           <p><strong>Property Name:</strong> ${property.propertyName}</p>
           <p><strong>Address:</strong> ${property.address}</p>
           <p><strong>Unit Number:</strong> ${property.unitNumber}</p>
           <p><strong>Property Type:</strong> ${property.propertyType}</p>
           <p><strong>Size:</strong> ${property.size} sq ft</p>
           <p><strong>Amenities:</strong> ${property.amenities}</p>
           <p><strong>Rent Amount:</strong> ${property.rentAmount} Rs</p>
           <p><strong>Available From:</strong> ${property.availableFrom}</p>
           <p><strong>Available To:</strong> ${property.availableTo}</p>
       </div>

       <a href="/list" class="back-link">Back to List</a>
   </div>
</body>
</html>