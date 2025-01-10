import bodyParser from 'body-parser'
import cors from 'cors'
import express from 'express'
import { createServer } from 'http'
import { Server } from 'socket.io'
import * as config from './config'
import './i18n'
import errorHandler from './middleware/errorHanddler'
import { createRouters } from './routes'
import SocketService from './services/socket'

class App {
  private app: express.Application
  private server: ReturnType<typeof createServer>
  private io: Server
  private readonly PORT: string | number
  private socket: SocketService

  constructor() {
    this.app = express()
    this.server = createServer(this.app)
    this.io = new Server(this.server, {
      cors: {
        origin: '*',
        methods: ['GET', 'POST'],
      },
    })
    this.PORT = process.env.PORT || 8386

    this.initializeMiddlewares()
    this.initializeConfig()

    this.socket = new SocketService(this.io)
  }

  private initializeMiddlewares(): void {
    this.app.use(bodyParser.json())
    this.app.use(cors())
    this.app.use(errorHandler)
  }

  private initializeConfig(): void {
    config.db.connect()
    createRouters(this.app)
  }

  public listen(): void {
    this.server.listen(this.PORT, () => {
      console.log(`Server is running on http://localhost:${this.PORT}`)
    })
  }
}

const app = new App()
app.listen()
