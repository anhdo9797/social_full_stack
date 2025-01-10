import mongoose from 'mongoose'
import { POST_TABLE, REACTION_TABLE, USER_TABLE } from '~/constant'

interface IReaction extends mongoose.Document {
  user: mongoose.Schema.Types.ObjectId
  post: mongoose.Schema.Types.ObjectId
  type: 'like' | 'comment'
  createdAt: Date
  content: string // if comment type
  children: mongoose.Schema.Types.ObjectId[] // if comment type
}

const _schema = new mongoose.Schema({
  user: { type: mongoose.Schema.Types.ObjectId, ref: USER_TABLE },
  post: { type: mongoose.Schema.Types.ObjectId, ref: POST_TABLE },
  children: [{ type: mongoose.Schema.Types.ObjectId, ref: REACTION_TABLE }],
  type: { type: String, required: true },
  createdAt: { type: Date, default: Date.now },
  content: { type: String },
})

const Reaction = mongoose.model('Reaction', _schema)

export { Reaction, IReaction }
