import express from 'express'
import authRoute from './auth.route'
import postRote from './post.route'

export const createRouters = (app: express.Application) => {
  app.use('/api/post', postRote)

  app.use('/api/auth', authRoute)

  app.get('/', (req, res) => {
    res.send("Welcome to my api! Please use '/api/auth' to access the authentication routes.")
  })
}
