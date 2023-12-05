#!/usr/bin/env node
const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const db = require('./queries')
const port = process.env.API_NODE_PORT
const api_name = process.env.API_NAME

app.use(bodyParser.json())
app.use(
    bodyParser.urlencoded({
        extended: true,
    })
)

app.listen(port, () => {
    console.log(`App running on port ${port}.`)
})

app.get(`/${api_name}/`, (req, res) => {
    res.json({ info: 'Hello World.' })
})

app.get(`/${api_name}/users`, db.getUsers)
app.get(`/${api_name}/users/:id`, db.getUserById)
app.post(`/${api_name}/users`, db.createUser)
app.put(`/${api_name}/users/:id`, db.updateUser)
app.delete(`/${api_name}/users/:id`, db.deleteUser)