import { NextFunction, Request, Response } from 'express'
import { EMAIL_NOT_FOUND, LOGIN_SUCCESS, PASSWORD_INCORRECT, REGISTER_SUCCESS } from '~/constant/message'
import { generateToken } from '~/middleware/auth.middleware'
import { IUser, User } from '~/model/user.model'
import { handleResponse } from '~/utils/responseHandler'

class AuthController {
  // [POST] api/auth/register
  register = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { username, email, password } = req.body
      const oldUser = await User.findOne({ email })
      if (oldUser) {
        handleResponse(res, 404, EMAIL_NOT_FOUND)
        return
      }

      const user = await User.create({
        username,
        email,
        password,
      })

      const token = await generateToken(user)

      const _user = user.toObject() as IUser

      handleResponse(res, 201, REGISTER_SUCCESS, {
        user: _user,
        token,
      })
    } catch (error) {
      console.error('Register got error:', error)
      next(error)
    }
  }

  // [GET] api/auth/login
  login = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { email, password } = req.body
      const user = await User.findOne({ email })
      if (!user) {
        handleResponse(res, 404, EMAIL_NOT_FOUND)
        return
      }
      const isMatch = user.comparePassword(password)
      if (!isMatch) {
        handleResponse(res, 403, PASSWORD_INCORRECT)
        return
      }

      const token = await generateToken(user)
      handleResponse(res, 200, LOGIN_SUCCESS, { accessToken: token, user })
    } catch (error) {
      console.error('Login got error:', error)
      next(error)
    }
  }
}

export default AuthController
