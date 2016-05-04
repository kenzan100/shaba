var menubar = require('menubar')

var mb = menubar({
  "alwaysOnTop": true,
  "index": "http://shaba.me"
})

mb.on('ready', function ready () {
  console.log('app is ready')
})

// mb.on('after-create-window', function ready () {
//   mb.window.loadURL('http://shaba.me/');
// })
