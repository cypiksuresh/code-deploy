const express = require("express");
const fs = require("fs");
const marked = require("marked");

const app = express();
const PORT = 3000;

app.get("/", (req, res) => {
  fs.readFile("README.md", "utf8", (err, data) => {
    if (err) {
      res.status(500).send("Error reading README.md");
    } else {
      const html = marked.parse(data);
      res.send(`
        <html>
          <head>
            <title>README Preview</title>
            <style>body { font-family: Arial; margin: 40px; }</style>
          </head>
          <body>
            ${html}
          </body>
        </html>
      `);
    }
  });
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
