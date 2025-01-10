import mongoose from 'mongoose'

export const connect = async () => {
  const MONGO_URI = process.env.MONGO_URI || 'mongodb://localhost:27017'
  try {
    await mongoose.connect(MONGO_URI)
    console.log(`Connected to successfully MongoDB at ${MONGO_URI}`)
  } catch (error) {
    console.error('MongoDB connection failed', error)
    mongoose.disconnect()
    process.exit(1)
  }
}
