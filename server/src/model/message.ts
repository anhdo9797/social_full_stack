import { Document } from 'mongoose'

export interface IMessage extends Document {
  message: string
  sender: string
  receiver: string
  createdAt: Date
  updatedAt: Date
}
