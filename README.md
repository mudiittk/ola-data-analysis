# Ola Ride Booking Analysis - Power BI Dashboard

## Project Overview
This Power BI project analyzes ride booking data to uncover trends in booking success rates, payment methods, ride distances, 
and revenue distribution. The dashboard provides insights into key metrics such as top vehicle types, total booking value, success and cancellation rates.

<img src="https://github.com/user-attachments/assets/74d5f244-3920-4424-a033-68bbc45898f5" alt="Description" width="500" height="300">
<img src="https://github.com/user-attachments/assets/8da99a82-e193-4af8-a5ad-45d4ce3aebf3" alt="Description" width="500" height="300">

## Files in the repository
- **Bookings.xlsx**: Contains the actual ride booking data.
- **Ola-Slidesuhub.pptx**: Used as a background canvas in Power BI.
- **PostgreSQL File**: Stores the uploaded dataset and includes SQL queries.
- **Ola Bookings Analysis.pbix**: The main visualization dashboard.

## Data Sources
The dataset includes ride booking records with the following key fields:
- **Booking_ID**: Unique identifier for each ride
- **Booking_Status**: Success, Canceled, or Incomplete
- **Ride_Distance**: Distance covered in kilometers
- **Booking_Value**: Fare amount for the ride
- **Vehicle_Type**: Type of vehicle used (Auto, Bike, Sedan, etc.)
- **Payment_Method**: Cash, UPI, Card, or Wallet
- **Customer_ID**: Unique customer identifier
- **Driver_Rating**: Customer rating for the driver

## Dashboard Structure
### 1. **Overall Sheet**
- **Total Booking Value Card**
- **Total Bookings Card**
- **Success Rate Card**
- **Line Chart:** Ride Volume Over Time
- **Payment Mode Pie Chart**
- **Booking Status Pie Chart**

### 2. **Vehicle Type Sheet**
- **Total Booking Value**
- **Successful Booking Value**
- **Average Distance Traveled**
- **Total Distance Traveled for Each Vehicle Type**

### 3. **Revenue Sheet**
- **Column Chart:** Revenue by Payment Mode
- **Highest Revenue in a Day Card**
- **Top 5 Customers Chart by Booking Value**
- **Daily Revenue Column Chart**

### 4. **Cancellation Sheet**
- **Total Bookings**
- **Successful Bookings**
- **Cancelled Bookings**
- **Success Rate Card**
- **Cancellation Rate Card**
- **Reasons for Ride Cancellation by Customer Pie Chart**
- **Reasons for Ride Cancellation by Driver Pie Chart**

### 5. **Ratings Sheet**
- **Average Customer and Driver Ratings for Each Vehicle Type**

## Key Visualizations
### **Booking Success Rate**
- **DAX Formula:**
  ```DAX
  Success Rate = (CALCULATE(COUNT('Table'[Booking_Status]), 'Table'[Booking_Status] = "Success") / COUNT('Table'[Booking_Status]))
  ```
- Displays the percentage of successful bookings.

### **Cancellation Rate**
- **DAX Formula:**
  ```DAX
  Cancellation Rate = 
  CALCULATE(
      COUNT(July[Booking_Status]),
      OR(July[Booking_Status] = "Cancelled by Driver", July[Booking_Status] = "Cancelled by Customer")
  ) / COUNT(July[Booking_Status])
  ```
- Calculates the rate of bookings canceled by either the driver or the customer.

### **Payment Method Distribution**
- A **pie chart** showing the proportion of payments made via different methods.
- **Filtered out NULL values** to improve accuracy.

## Enhancements Applied
- **Improved readability** by adjusting axis scales, enabling transparency, and reducing data density.
- **Data Cleaning** to filter NULL values in key fields like Payment Method.


