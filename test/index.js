require('dotenv').config()
const express = require('express')
const app = express()
var os = require('os');

var networkInterfaces = os.networkInterfaces();


app.use((req, res, next) => {
console.log(`Request path: ${req.path}`);
const localIps = [];
 (networkInterfaces['eth0'] || []).forEach((n) => localIps.push(n.address));
 (networkInterfaces['en0'] || []).forEach((n) => localIps.push(n.address));
console.log(`Local IPs: ${localIps.join(", ")}`);
next()
})

app.get('/test-route', (req, res) => {
  res.json({
    message: 'This is a sample route'
  })
})

const port = process.env.PORT
app.listen(port, () => {
  console.log(`Server started on ${port}`)
})