# Good Morning Travels Database System


Good Morning Travels Database System is a comprehensive solution designed to manage and streamline the operations of a travel company. This project focuses on storing and handling data related to the company's workers, drivers, vehicles, and various services, including passenger travel and cargo transport.

Key Features:
1. **Worker & Driver Management:** Store and manage details of employees, including personal information and salary.
2. **Vehicle Information:** Maintain records of buses, their routes, and schedules.
3. **Passenger & Cargo Services:** Handle ticketing for passenger travel and cargo transport, including fare details and availability.
4. **Booking & Transactions:** Track bookings, billing details, and transactions to ensure efficient financial management.

This system reduces data redundancy, improves data retrieval efficiency, and provides a reliable database solution for the company's operations.



## List of Entities and Attributes ##


Entity  | Attributes
------------- | -------------
Bus  | Id, name, from, to, departure time
Passenger  | Id, name, dob, place, email
ticket | sno ,total, available, fare
cargo | sno, fare
bill | billno ,date, category, fare
driver | Id, name, dob, salary
worker | Id, name, dob, salary
bookingdetails | sno, category, amount



### Conceptual Model ###

![Alt text](https://github.com/rk-peddibhotla/GoodMorningTravels_DB/blob/main/erModel.png)



