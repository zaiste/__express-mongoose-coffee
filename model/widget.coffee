mongoose = require 'mongoose'

Widget = new mongoose.Schema(
  name: String
  desc: String
  created_at: { type: Date, default: Date.now }
)

mongoose.model "Widget", Widget
