from fastapi import FastAPI
from api_bridge import APIBridge

# Single database configuration
db_config = {
    "host": "localhost",
    "port": 3306,
    "database": "linkedin_db",
    "user": "root",
    "password": "1234"
}

app = FastAPI(
    title="Linked In"
)

api_bridge = APIBridge(db_config,base_endpoint="/linked-in-apis")
app.include_router(api_bridge.router)

# Run the app
# uvicorn main:app --reload
