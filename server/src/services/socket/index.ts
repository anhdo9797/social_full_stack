import { Server, Socket } from 'socket.io'
import { CHAT_TO_ROOM as CHAT_IN_ROOM, CONNECT, USER_CONNECT, USER_ONLINE } from '~/constant'
import { IUser } from '~/model'

class SocketService {
  private io: Server

  constructor(io: Server) {
    this.io = io
    this.initializeConfig(this.io)
  }

  private initializeConfig(io: Server): void {
    io.on(CONNECT, (socket) => {
      this.listenerChatMessage(socket)
      this.listenerUserConnected(socket)
      this.listenerUserDisconnected(socket)
    })
  }

  private listenerUserConnected(socket: Socket): void {
    socket.on(USER_CONNECT, (user: IUser) => {
      socket.broadcast.emit(USER_ONLINE, user)
    })
  }

  private listenerUserDisconnected(socket: Socket): void {}

  private listenerChatMessage(socket: Socket): void {
    socket.on(CHAT_IN_ROOM, (msg) => {
      console.log('message: ' + msg)
      this.io.emit('chat message', msg)
    })
  }
}

export default SocketService
