#!/usr/bin/env node
const globalConfig = require('./env/global.env')

const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const db = require('./api/queries')
const port = globalConfig.PORT

app.use(bodyParser.json())
app.use(
    bodyParser.urlencoded({
        extended: true,
    })
)

app.listen(port, () => {
    console.log(`App running on port ${port}.`)
})

app.get('/', (req, res) => {
    res.json({ info: 'Hello World.' })
})

app.get('/users', db.getUsers)
app.get('/users/:id', db.getUserById)
app.post('/users', db.createUser)
app.put('/users/:id', db.updateUser)
app.delete('/users/:id', db.deleteUser)