const express = require('express');
const axios = require('axios');

const app = express();
const PORT = process.env.PORT || 4000;

app.get('/', (req, res) => {
    res.send('V1 of API working fine');
});

app.get('/health', (req, res) => {
    res.json({ status: 'health' });
});

app.get('/api', (req, res) => {
    res.send('I am alive');
});

app.get('/call', async (req, res) => {
    const apiUrl = req.query.url;
    if (!apiUrl) {
        return res.status(400).send('Please provide a URL in the query parameter');
    }

    try {
        const response = await axios.get(apiUrl);
        res.json(response.data);
    } catch (error) {
        res.status(500).send('Error fetching data');
    }
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
