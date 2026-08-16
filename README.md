# Laravel REST API Backend

A complete RESTful API backend built with **Laravel** for managing authentication, users, categories, products, orders, profiles, and file uploads.

The project follows a clean API structure and includes authentication with **Laravel Sanctum**, API Resources, validation, search, filtering, pagination, error handling, and API testing with **Postman**.

## Modules

* ✅ Authentication — Laravel Sanctum
* ✅ User Management
* ✅ Category Management
* ✅ Product Management
* ✅ Order Management
* ✅ Profile Management
* ✅ File Upload
* ✅ Search, Filtering & Pagination
* ✅ API Resources
* ✅ Error Handling
* ✅ API Testing — Postman

## Tech Stack

* **Laravel**
* **PHP**
* **MySQL**
* **Laravel Sanctum**
* **REST API**
* **Eloquent ORM**
* **Postman**
* **Composer**

## Requirements

Before installing the project, make sure you have:

* PHP
* Composer
* MySQL
* Laravel
* Postman
* Git

## Installation

### 1. Clone the repository

```bash
git clone YOUR_GITHUB_REPOSITORY_URL
```

### 2. Open the project

```bash
cd laravel-rest-api-backend
```

### 3. Install dependencies

```bash
composer install
```

> The `vendor/` folder is not included in the repository. It is automatically recreated by `composer install`.

### 4. Create the environment file

```bash
cp .env.example .env
```

For Windows CMD:

```cmd
copy .env.example .env
```

### 5. Generate the application key

```bash
php artisan key:generate
```

### 6. Configure the database

Update your `.env` file:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel_rest_api
DB_USERNAME=root
DB_PASSWORD=
```

### 7. Run migrations

```bash
php artisan migrate
```

### 8. Create storage link

```bash
php artisan storage:link
```

### 9. Start the Laravel server

```bash
php artisan serve
```

The API will be available at:

```text
http://127.0.0.1:8000
```

## Authentication

Authentication is implemented using **Laravel Sanctum**.

Typical authentication endpoints include:

```text
POST /api/register
POST /api/login
POST /api/logout
GET  /api/user
```

Protected routes use:

```text
auth:sanctum
```

## API Features

### Authentication

* Register
* Login
* Logout
* Sanctum token authentication
* Authenticated user

### User Management

* Create users
* View users
* Update users
* Delete users
* Search users
* Pagination

### Category Management

* Create category
* View categories
* Update category
* Delete category
* Search categories
* Pagination

### Product Management

* Create product
* View products
* Update product
* Delete product
* Product image upload
* Search products
* Filter products
* Pagination

### Order Management

* Create orders
* View orders
* Update orders
* Delete orders
* Order details
* Order items
* Order status management

### Profile Management

* View profile
* Update profile
* Change profile information
* Profile image upload

### File Upload

The API supports file/image uploads using Laravel's storage system.

```bash
php artisan storage:link
```

## Search, Filter & Pagination

The API supports:

* 🔍 Search
* 🔎 Filtering
* 📄 Pagination
* ↕️ Sorting where applicable

Example:

```text
/api/products?search=laptop
```

## API Resources

Laravel API Resources are used to format API responses consistently.

Example response structure:

```json
{
    "success": true,
    "message": "Products retrieved successfully",
    "data": []
}
```

## Error Handling

The API provides structured responses for common errors such as:

* Validation errors
* Authentication errors
* Authorization errors
* Resource not found
* Database errors
* Invalid requests

Example:

```json
{
    "success": false,
    "message": "Product not found"
}
```

## API Testing

The APIs can be tested using **Postman**.

Recommended testing flow:

1. Register
2. Login
3. Copy authentication token
4. Add Bearer Token in Postman
5. Test protected APIs
6. Test CRUD operations
7. Test validation
8. Test search, filtering and pagination
9. Test file uploads
10. Test error responses

## Project Structure

```text
laravel-rest-api-backend/
│
├── app/
│   ├── Http/
│   │   ├── Controllers/
│   │   ├── Requests/
│   │   └── Resources/
│   │
│   └── Models/
│
├── database/
│   ├── migrations/
│   └── seeders/
│
├── routes/
│   ├── api.php
│   └── web.php
│
├── storage/
├── tests/
├── .env.example
├── composer.json
├── composer.lock
└── README.md
```

## Important

The following files and folders should **not** be committed to GitHub:

```text
/vendor
/node_modules
/.env
```

The `vendor/` directory is generated using:

```bash
composer install
```

## Future Improvements

* 🔐 Role & Permission Management
* 📧 Email Verification
* 🔑 Password Reset API
* 🔔 Notifications
* 📊 Dashboard APIs
* ⚡ Redis Caching
* 🔎 Laravel Scout Search
* 🧪 Automated Feature Tests

## License

This project is open-source and available under the **MIT License**.
