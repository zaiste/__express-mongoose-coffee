mongoose = require 'mongoose'

exports.readMany = (req, res) ->
  Widget = mongoose.model('Widget')

  Widget.find {}, (err, coll) ->
    res.send(coll)

exports.create = (req, res) ->
  Widget = mongoose.model("Widget")
  widget = req.body

  w = new Widget(widget)
  w.save () ->
    res.send(w)
