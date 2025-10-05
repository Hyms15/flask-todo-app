from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///todos.db"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

db = SQLAlchemy(app)

class Todo(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    done = db.Column(db.Boolean, default=False)

@app.route("/todos", methods=["GET"])
def get_todos():
    todos = Todo.query.all()
    return jsonify([{"id": t.id, "title": t.title, "done": t.done} for t in todos])

@app.route("/todos", methods=["POST"])
def create_todo():
    data = request.get_json() or {}
    t = Todo(title=data.get("title", "").strip(), done=False)
    db.session.add(t)
    db.session.commit()
    return jsonify({"id": t.id, "title": t.title, "done": t.done}), 201

@app.route("/todos/<int:todo_id>", methods=["PUT"])
def update_todo(todo_id):
    t = Todo.query.get_or_404(todo_id)
    data = request.get_json() or {}
    t.title = data.get("title", t.title)
    t.done = data.get("done", t.done)
    db.session.commit()
    return jsonify({"id": t.id, "title": t.title, "done": t.done})

@app.route("/todos/<int:todo_id>", methods=["DELETE"])
def delete_todo(todo_id):
    t = Todo.query.get_or_404(todo_id)
    db.session.delete(t)
    db.session.commit()
    return jsonify({"message": "deleted"})

if __name__ == "__main__":
    with app.app_context():
        db.create_all()
    app.run(host="0.0.0.0", port=5000, debug=True)
