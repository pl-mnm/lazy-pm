js_pipeline     = require 'js-pipeline'
css_pipeline    = require 'css-pipeline'
accord          = require 'accord'
postcss         = accord.load 'postcss'
cssimport       = require 'postcss-import'
cssnext         = require 'postcss-cssnext'
lost            = require 'lost'
rucksack        = require 'rucksack-css'

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
      cssnext()
      lost()
      rucksack()
    ]

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true
