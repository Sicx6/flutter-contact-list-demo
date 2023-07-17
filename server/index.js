const express = require ('express');
const bodyParser = require ('body-parser');
const cors = require ('cors');

const app = express ();

// Middleware
app.use (bodyParser.json ());
app.use (cors ());

//contact data
const data = [
  {
    id: 'user00001',
    name: 'Robert A/L Francis',
    email: 'robert@yahoo.com',
  },
  {
    id: 'user00002',
    name: 'Balu Govindasamy',
    email: 'balugov@gmail.com',
  },
    {
    id: 'user00003',
    name: 'Chong How Kee',
    email: 'chonghowkee@yahoo.com',
  },
  {
    id: 'user00004',
    name: 'Teoh Min Kee',
    email: 'teohminkee@inglab.com',
    
  },

  {
    id: 'user00005',
    name: 'A Sebastian A/L Anthony',
    email: 'sebastian@yahoo.com',
    
  },
];

// GET endpoint for fetching contacts
app.get ('/contacts', (req, res) => {
  // Sort contacts by name in alphabetical order
  const sortedData = data.sort ((a, b) => a.name.localeCompare (b.name));

  // Filter contacts based on search query (name or email)
  const searchQuery = req.query.search;
  let filteredData = sortedData;
  if (searchQuery) {
    filteredData = sortedData.filter (
      contact =>
        contact.name.toLowerCase ().includes (searchQuery.toLowerCase ()) ||
        contact.email.toLowerCase ().includes (searchQuery.toLowerCase ())
    );
  }

  //API response
  const response = {
    success: true,
    status: {
      code: '200',
      message: 'Successful retrieval for contacts',
    },
    data: filteredData,
  };

  res.json (response);
});

// Start the server
const port = process.env.PORT || 3000;
app.listen (port, "0.0.0.0" ,() => {
  console.log (`Server is running on port ${port}`);
});
