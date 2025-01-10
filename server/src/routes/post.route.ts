import { Router } from 'express'
import PostController from '~/controller/post.controller'

const route = Router()
const controller = new PostController()

route.get('/', controller.posts)
route.post('/', controller.createPost)

export default route
