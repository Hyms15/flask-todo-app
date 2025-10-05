import json
from app import app, db

def setup_module(module):
    app.config.update(
        TESTING=True,
        SQLALCHEMY_DATABASE_URI="sqlite:///integration_test.db",
        SQLALCHEMY_TRACK_MODIFICATIONS=False,
    )
    with app.app_context():
        db.create_all()

def teardown_module(module):
    with app.app_context():
        db.drop_all()

def test_todo_flow():
    client = app.test_client()

    # 1. Create a todo
    res = client.post("/todos", json={"title": "Integration Test"})
    assert res.status_code == 201
    todo = res.get_json()
    todo_id = todo["id"]

    # 2. Update the todo
    res = client.put(f"/todos/{todo_id}", json={"done": True})
    assert res.status_code == 200
    updated = res.get_json()
    assert updated["done"] is True

    # 3. Delete the todo
    res = client.delete(f"/todos/{todo_id}")
    assert res.status_code == 200