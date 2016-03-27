js_pipeline     = require 'js-pipeline'
css_pipeline    = require 'css-pipeline'
accord          = require 'accord'
postcss         = accord.load 'postcss'
cssimport       = require 'postcss-import'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf']

  extensions: [
    js_pipeline(files: 'assets/js/*.coffee'),
    css_pipeline(files: 'assets/css/*.css')
  ]

  open_browser: false

  postcss:
    use: [
      cssimport(path:['assets/css'])
    ]

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true
