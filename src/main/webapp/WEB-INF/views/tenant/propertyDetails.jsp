<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>${property.propertyName} Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            text-align: center;
        }

        .property-details {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 8px;
            background-color: #f9f9f9;
            margin-bottom: 20px;
        }

        .detail-label {
            font-weight: bold;
            margin-right: 5px;
        }
    </style>
</head>
<body>

    <h1>${property.propertyName} Details</h1>

    <div class="property-details">
        <p><span class="detail-label">Property Name:</span> ${property.propertyName}</p>
        <p><span class="detail-label">Address:</span> ${property.address}, Unit ${property.unitNumber}</p>
        <p><span class="detail-label">Property Type:</span> ${property.propertyType}</p>
        <p><span class="detail-label">Size:</span> ${property.size} sq ft</p>
        <p><span class="detail-label">Amenities:</span> ${property.amenities}</p>
        <p><span class="detail-label">Rent:</span> <fmt:formatNumber value="${property.rentAmount}" type="currency"/></p>
        <p><span class="detail-label">Available From:</span> <fmt:formatDate value="${property.availableFrom}" pattern="MM-dd-yyyy"/></p>
         <p><span class="detail-label">Available To:</span> <fmt:formatDate value="${property.availableTo}" pattern="MM-dd-yyyy"/></p>
    </div>

    <a href="${pageContext.request.contextPath}/tenant/dashboard">Back to Property List</a>
     &nbsp;

         <a href="${pageContext.request.contextPath}/tenant/register/${property.propertyID}">Lease Property</a>


</body>
</html>