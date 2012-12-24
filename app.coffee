express = require 'express'
mongoose = require 'mongoose'

widgets = require './controller/widgets'

app = express()

app.configure ->
  app.set 'port', process.env.PORT or 4000
  app.set 'storage', process.env.MONGOHQ_URL or 'mongodb://localhost/widgets'
  app.use express.bodyParser()
  app.use express.methodOverride()

mongoose.connect app.get('storage'), { db: { safe: true }}, (err) ->
  console.log "Mongoose - connection error: " + err if err?
  console.log "Mongoose - connection OK"

require './model/widget'

# -
# Routes
# -
app.get '/', (req, res) ->
  res.send 'Hello, Zaiste!'

app.post    '/widgets',       widgets.create
app.get     '/widgets',       widgets.read
app.get     '/widgets/:id',   widgets.read
app.put     '/widgets/:id',   widgets.update
app.delete  '/widgets/:id',   widgets.delete

app.listen app.get('port'), () ->
  console.log "listening on port #{app.get('port')}"