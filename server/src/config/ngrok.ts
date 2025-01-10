import ngrok from '@ngrok/ngrok'
import { logSuccess } from '~/utils/logger'

export const connect = () => {
  const PORT = process.env.PORT || 8081
  ngrok
    .connect({ addr: PORT, authtoken_from_env: true })
    .then((listener) => logSuccess(`Ingress established at: ${listener.url()}`))
    .catch((error) => {
      console.error('Ngrok connection failed', error)
      process.exit(1)
    })
}
