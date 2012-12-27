mongoose = require 'mongoose'

Widget = new mongoose.Schema(
  name: { type: String, trim: true }
  desc: String
  amount: { type: Number, min: 0 }
  created_at: { type: Date, default: Date.now }
)

mongoose.model "Widget", Widget
