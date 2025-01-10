import { NextFunction, Request, Response } from 'express'
import { getUserFromToken } from '~/middleware/auth.middleware'
import { IUser, Post, User } from '~/model'
import { logError } from '~/utils/logger'
import { handleResponse } from '~/utils/responseHandler'

class PostController {
  // [GET] api/posts
  posts = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const posts = await Post.find()
      res.json(posts)
    } catch (error) {
      next(error)
    }
  }

  // [POST] api/posts
  createPost = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const token = req.headers['authorization']
      if (!token) {
        handleResponse(res, 401, 'Unauthorized')
        return
      }

      const user = await getUserFromToken(token)

      if (!user) {
        handleResponse(res, 401, 'Unauthorized')
        return
      }

      const foundUser = await User.findById(user.id)

      if (!foundUser) {
        handleResponse(res, 401, 'Unauthorized', {})
        return
      }

      const { content } = req.body
      if (!content) {
        handleResponse(res, 400, 'content is required', {})
        return
      }

      const post = await Post.create({
        content,
        user: foundUser._id,
      })

      foundUser.createdPost(post.id)

      handleResponse(res, 201, 'post.create_success', post)
    } catch (error) {
      logError('🚀 ~ file: post.controller.ts ~ line 49 ~ PostController ~ createPost= ~ error', error)
      next(error)
    }
  }
}

export default PostController
