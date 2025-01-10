import { Request, Response, NextFunction } from 'express'
import { logError } from '~/utils/logger'

const errorHandler = (err: any, req: Request, res: Response, next: NextFunction) => {
  logError('🚀 ~ file: errorHandler.ts ~ line 5 ~ errorHandler ~ err', err)

  if (res.headersSent) {
    return next(err)
  }

  res.status(500).json({
    success: false,
    message: 'Something went wrong!',
    error: err,
  })
}

export default errorHandler
