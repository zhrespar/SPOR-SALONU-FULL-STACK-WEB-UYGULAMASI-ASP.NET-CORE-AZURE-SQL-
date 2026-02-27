# Gym Management System (ASP.NET Core & Azure SQL)

A full-stack web-based Gym Management System developed using **ASP.NET Core MVC**, **Entity Framework Core**, and **Azure SQL Database**.

This project manages members, membership packages, courses, and participation records with a relational database structure and cloud integration.

---

## Features

- Member Management (CRUD)
- Membership Package Management (Daily, Monthly, 3-Month, 6-Month, Yearly)
- Course Management
- Member-Course Participation Tracking
- Relational Database Design (PK/FK)
- Azure SQL Cloud Integration
- Entity Framework Core ORM
- MVC Architecture

---

## Technologies Used

- ASP.NET Core MVC (.NET 8)
- Entity Framework Core
- Azure SQL Database
- SQL Server
- Bootstrap
- C#
- LINQ

---

## Database Architecture

The system includes the following relational tables:

- `UyelikPaketi`
- `Uye`
- `Ders`
- `Katilim`

Relationships:
- One Membership Package → Many Members
- One Member → Many Course Participations
- One Course → Many Participants

Designed using proper normalization and foreign key constraints.

---

## ☁ Azure Integration

The application is connected to **Azure SQL Database** for cloud-based data management.

Connection string configuration is handled via:

```json
appsettings.json
