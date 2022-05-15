const express = require('express')
const fs = require('fs')
const existsSync = fs.existsSync
const path = require('path')
const { exec } = require("child_process");

const app = express()
const port = 3000

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})

app.use('/', express.static(path.join(__dirname, '/mochawesome-report')))
console.log(path.join(__dirname, '/mochawesome-report'))

app.get('/', (req, res) => {
  if (!existsSync('mochawesome-report/index.html')) {
    res.send('No results yet.')
  } 
})

// setInterval(() => {
//   if (existsSync('mochawesome-report/mochawesome.json')) {
//     // exec('npx mochawesome-merge ' + path.join(__dirname, 'mochawesome-report/*.json') + ' > mochawesome.json')
//     exec('npm run merge:results:json')
//     // exec('npm merge:results:html')
//   } 
// }, 5000)

// use kubernetes exit message?
// process.on('exit', () => {
//   exec('npm run clean:results')
// })
