const express = require('express')
const app = express()
const port = 3000


app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})

const path = require('path')
app.use('/', express.static(path.join(__dirname, 'mochawesome-report')))

// TODO: if no reports, server a placeholder page "testing..."

// app.get('/', function(req, res){
//   res.sendFile(__dirname + '/public/index.html');
// })
