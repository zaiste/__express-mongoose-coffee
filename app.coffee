express = require 'express'
mongoose = require 'mongoose'

widgets = require './controller/widgets'

app = express()

mongoose.connect(process.env.MONGOHQ_URL || "mongodb://localhost/test")

require './model/widget'

# -
# Routes
# -
app.get '/', (req, res) ->
  res.send 'Hello, Zaiste!'

app.get '/widgets', widgets.readMany
app.post '/widgets', widgets.create

app.listen app.get('port'), () ->
  console.log "listening on port #{app.get('port')}"