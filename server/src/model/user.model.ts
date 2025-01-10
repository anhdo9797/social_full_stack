import { Schema, model, Document } from 'mongoose'
import bcrypt from 'bcryptjs'
import { POST_TABLE } from '~/constant'

interface IUser extends Document {
  username: string
  email: string
  password: string
  birthday?: string
  createdAt: Date
  isOnline: boolean
  posts?: string[]

  // methods
  comparePassword: (enteredPassword: string) => boolean
  createdPost: (postId: string) => void
}
const _schema = new Schema<IUser>({
  username: { type: String, required: true },
  email: { type: String, required: true },
  password: { type: String, required: true },
  birthday: { type: String },
  createdAt: { type: Date, default: Date.now },
  isOnline: { type: Boolean, default: false },
  posts: [{ type: Schema.Types.ObjectId, ref: POST_TABLE }],
})

_schema.pre('save', async function (next) {
  if (!this.isModified('password')) {
    return next()
  }

  const salt = await bcrypt.genSalt()
  this.password = await bcrypt.hash(this.password, salt)

  next()
})

_schema.methods.comparePassword = async function (enteredPassword: string) {
  return this.password === (await bcrypt.compare(enteredPassword, this.password))
}

_schema.methods.createdPost = async function (postId: string) {
  this.posts?.push(postId)
  this.save()
}

const User = model<IUser>('User', _schema)

export { User, IUser }
