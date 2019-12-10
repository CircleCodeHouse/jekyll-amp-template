const postcss = require('postcss')
const { readFileSync, writeFileSync, existsSync } = require('fs')

if (!existsSync('./_includes/css.html')) writeFileSync('./_includes/css.html', '');

postcss([
  require('postcss-import'),
  require('postcss-each'),
  require('postcss-for'),
  require('postcss-amp'),
  require('@fullhuman/postcss-purgecss')({ content: ['./_site/**/*.html'] }),
  require('cssnano')({ preset: ['advanced', { discardComments: { removeAll: true }}]}),
])
  .process(
    readFileSync('assets/css/main.css'),
    {
      from: 'assets/css/main.css',
      to: 'assets/css/main.min.css',
      map: { inline: false, from: '../../assets/css/main.min.css' }
    }
  ).then(result => {
    writeFileSync('assets/css/main.min.css', result.css)
    if ( result.map ) writeFileSync ('assets/css/main.min.css.map', result.map)
  })
