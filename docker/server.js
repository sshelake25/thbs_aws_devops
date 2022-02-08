const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
    res.end('Hello World!');
});


app.get("/list_movies", (req, res) => {
    let movies = [
        {
            "id": 1,
            "title": "Star girl"
        },
        {
            "id": 2,
            "title": "Five feet apart"
        },
        {
            "id": 3,
            "title": "Fifty shades of Grey"
        },
        {
            "id": 4,
            "title": "Fifty shades of Grey"
        }
    ];

    res.json(movies);
});


app.listen(port, () => {
    console.log(`app listening at http://localhost:${port}`)
});