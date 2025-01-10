import { Request, Response } from 'express'
import i18next from 'i18next'

export const handleResponse = (res: Response, statusCode: number, messageCode?: string, data?: any) => {
  let message = null
  if (messageCode) {
    message = i18next.t(messageCode)
  }

  return res.status(statusCode).json({
    success: statusCode >= 200 && statusCode < 300,
    message,
    data,
  })
}
