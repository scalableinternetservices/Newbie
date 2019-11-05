# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

=begin
const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.append('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)

module.exports = environment
=end
require_relative 'application'

Rails.application.initialize!
