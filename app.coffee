express = require 'express'
mongoose = require 'mongoose'

widgets = require './controller/widgets'

app = express()

app.configure ->
  app.set 'port', process.env.PORT or 4000
  app.set 'storage', process.env.MONGOHQ_URL or 'mongodb://localhost/widgets'
  app.use express.bodyParser()
  app.use express.methodOverride()

mongoose.connect app.get('storage')

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