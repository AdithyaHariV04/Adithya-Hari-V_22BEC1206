import React, { useEffect, useState } from 'react';
import axios from 'axios';

function App() {
  const [todos, setTodos] = useState([]);
  const [task, setTask] = useState('');
  const [editId, setEditId] = useState(null);
  const [editText, setEditText] = useState('');

  useEffect(() => {
    fetchTodos();
  }, []);

  const fetchTodos = async () => {
    const res = await axios.get('http://localhost:5000/api/todos');
    setTodos(res.data);
  };

  const addTodo = async () => {
    if (!task.trim()) return;
    const res = await axios.post('http://localhost:5000/api/todos', { task });
    setTodos([...todos, res.data]);
    setTask('');
  };

  const deleteTodo = async (id) => {
    await axios.delete(`http://localhost:5000/api/todos/${id}`);
    setTodos(todos.filter(todo => todo._id !== id));
  };

  const updateTodo = async (id) => {
    if (!editText.trim()) return;
    const res = await axios.put(`http://localhost:5000/api/todos/${id}`, {
      task: editText,
      completed: false
    });
    setTodos(todos.map(todo => (todo._id === id ? res.data : todo)));
    setEditId(null);
    setEditText('');
  };

  return (
    <div style={{ padding: '20px' }}>
      <h1>To-Do List</h1>
      <input
        type="text"
        placeholder="New task"
        value={task}
        onChange={e => setTask(e.target.value)}
      />
      <button onClick={addTodo}>Add</button>
      <ul>
        {todos.map(todo => (
          <li key={todo._id} style={{ margin: '10px 0' }}>
            {editId === todo._id ? (
              <>
                <input
                  type="text"
                  value={editText}
                  onChange={e => setEditText(e.target.value)}
                />
                <button onClick={() => updateTodo(todo._id)}>Save</button>
                <button onClick={() => setEditId(null)}>Cancel</button>
              </>
            ) : (
              <>
                {todo.task}
                <button onClick={() => {
                  setEditId(todo._id);
                  setEditText(todo.task);
                }}>Edit</button>
                <button onClick={() => deleteTodo(todo._id)}>Delete</button>
              </>
            )}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default App;
