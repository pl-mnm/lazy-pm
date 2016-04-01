js_pipeline     = require 'js-pipeline'
css_pipeline    = require 'css-pipeline'
accord          = require 'accord'
postcss         = accord.load 'postcss'
cssimport       = require 'postcss-import'
cssnext         = require 'postcss-cssnext'
lost            = require 'lost'
rucksack        = require 'rucksack-css'
cssnano         = require 'cssnano'

module.exports =
  
  ignores: [
    'readme.md',
    '**/layout.*',
    '**/_*',
    '.gitignore',
    'ship.*conf',
    '*.sublime-project',
    '*.sublime-workspace'
  ]

  extensions: [
    js_pipeline(files: 'assets/js/*.coffee'),
    css_pipeline(files: 'assets/css/*.css')
  ]

  open_browser: false

  postcss:
    use: [
      cssimport(
        from: "assets/css/"
      )
      cssnext()
      lost()
      rucksack()
      cssnano(
        autoprefixer: false
        sourcemap: true
      )
    ]

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true
