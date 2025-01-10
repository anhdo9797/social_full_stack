/**
 * Bug is not working
 * Need to fix
 * */

import i18next from 'i18next'

import vi from './langs/vi.json'
import en from './langs/en.json'

export const resources = {
  en,
  vi,
}

i18next.init(
  {
    lng: 'en',
    fallbackLng: 'en',
    debug: true,

    resources: resources,
  },
  (value) => {
    console.log('value', value)
  }
)
