const express = require('express');
const app = express();
const PORT = process.env.PORT || 5000;

app.get('/api/hello', (req, res) => {
  res.json({ message: 'Hello from Temzz Backend (Node.js)!' });
});

app.get('/', (req, res) => res.json({ message: 'Backend root. Use /api/hello' }));

app.listen(PORT, () => {
  console.log(`Backend listening on port ${PORT}`);
});
