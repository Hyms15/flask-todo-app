import json
from app import app, db

def setup_module(module):
    app.config.update(
        TESTING=True,
        SQLALCHEMY_DATABASE_URI="sqlite:///:memory:",
        SQLALCHEMY_TRACK_MODIFICATIONS=False,
    )
    with app.app_context():
        db.create_all()

def teardown_module(module):
    with app.app_context():
        db.drop_all()

def test_create_todo():
    client = app.test_client()
    res = client.post("/todos", json={"title": "Buy milk"})
    assert res.status_code == 201
    data = res.get_json()
    assert data["title"] == "Buy milk"
    assert data["done"] is False

def test_get_todos():
    client = app.test_client()
    res = client.get("/todos")
    assert res.status_code == 200
    assert isinstance(res.get_json(), list)