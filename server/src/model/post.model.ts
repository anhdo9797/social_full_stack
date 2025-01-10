import mongoose from 'mongoose'
import { POST_TABLE, USER_TABLE } from '~/constant'

interface IPost extends mongoose.Document {
  content: string
  user: mongoose.Schema
  createdAt: Date
  mentions: mongoose.Schema[]
  reaction: mongoose.Schema[]
}

const _schema = new mongoose.Schema<IPost>({
  content: { type: String, required: true },
  user: { type: mongoose.Schema.ObjectId, ref: USER_TABLE },
  createdAt: { type: Date, default: Date.now }
  // mentions: [{ type: mongoose.Schema, ref: USER_TABLE }],
  // reaction: [{ type: mongoose.Schema, ref: REACTION_TABLE }],
})
const Post = mongoose.model(POST_TABLE, _schema)

export { IPost, Post }
