# LinkedIn API Bridge

## Overview
This project demonstrates the use of the `api_bridge` library to perform CRUD operations with a MySQL database in a FastAPI application. It provides an efficient way to manage database interactions through an API abstraction layer.

## Features
- FastAPI-based web application
- Utilizes `api_bridge` for database operations
- Single database configuration for MySQL
- Easy-to-extend architecture

## Prerequisites
Before running the application, ensure you have the following installed:
- Python 3.8+
- MySQL database
- Required Python packages (listed in `requirements.txt`)

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/l3squad-com/linkedin-api-bridge-example.git
   cd linkedin-api-bridge-example
   ```
2. Install dependencies:
   ```sh
   pip install -r requirements.txt
   ```
3. Configure the database connection in `main.py`:
   ```python
   db_config = {
       "host": "localhost",
       "port": 3306,
       "database": "linkedin_db", # Your DB name
       "user": "root", # Your user
       "password": "1234" # Your Password
   }
   ```

## Running the Application
Start the FastAPI server using Uvicorn:
```sh
uvicorn main:app --reload
```

The API will be accessible at `http://127.0.0.1:8000`.

## API Endpoints
The `api_bridge` library provides built-in CRUD operations. The included router will expose endpoints based on the database schema. Refer to the `api_bridge` documentation for available routes.

## Usage
- Access interactive API docs at `http://127.0.0.1:8000/docs` (Swagger UI)
- Use `http://127.0.0.1:8000/redoc` for alternative API documentation
- Test API requests using Postman, curl, or any HTTP client

## Contact
For any issues or inquiries, please reach out via email or create an issue in the repository.

