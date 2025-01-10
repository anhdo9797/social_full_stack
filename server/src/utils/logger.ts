/* eslint-disable @typescript-eslint/no-explicit-any */
// get color https://gist.github.com/JBlond/2fea43a3049b38287e5e9cefc87b2124

export const logSuccess = (message?: any, ...optionalParams: any[]): void => {
  console.log('\x1b[32m%s\x1b[0m', message, ...optionalParams)
}

export const logError = (message?: any, ...optionalParams: any[]): void => {
  console.error('\x1b[31m%s\x1b[0m', message, ...optionalParams)
}
