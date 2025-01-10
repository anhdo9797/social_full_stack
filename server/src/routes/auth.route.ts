import { Router } from 'express'
import AuthController from '~/controller/auth.controller'

const route = Router()
const controller = new AuthController()

route.post('/login', controller.login)

route.post('/register', controller.register)

route.get('/', (req, res) => {
  res.send('Auth route: call /login or /register')
})

export default route
