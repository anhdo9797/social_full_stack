import jwt from 'jsonwebtoken'

import { IUser } from '~/model/user.model'
import { logError } from '~/utils/logger'

export const generateToken = async (User: IUser): Promise<string> => {
  const secret = process.env.JWT_SECRET
  if (!secret) {
    throw new Error('JWT_SECRET is not defined')
  }
  const token = jwt.sign({ id: User.id }, secret, { expiresIn: '1h' })
  return token
}

export const getUserFromToken = async (bearerToken: string): Promise<IUser | null> => {
  try {
    const token = bearerToken.replaceAll('Bearer ', '')

    const secret = process.env.JWT_SECRET
    if (!secret) {
      throw new Error('JWT_SECRET is not defined')
    }
    const decoded = jwt.verify(token, secret) as IUser
    return decoded
  } catch (error) {
    logError('🚀 ~ file: auth.middleware.ts ~ line 33 ~ validateToken ~ error', error)
    return null
  }
}
