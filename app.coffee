express = require 'express'
mongoose = require 'mongoose'

app = express()

mongoose.connect(process.env.MONGOHQ_URL || "mongodb://localhost/test")

app.get '/', (req, res) ->
  res.send 'Hello, Zaiste!'

port = process.env.PORT || 4000
app.listen port, () ->
  console.log "listening on port #{port}"