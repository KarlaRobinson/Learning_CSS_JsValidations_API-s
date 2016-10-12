# Hace require de los gems necesarios.
# Revisa: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'

# twitter api
require 'twitter'
require 'oauth'

#sidekiq
require 'sidekiq'
require 'redis'
require 'sidekiq/api'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Configura los controllers y los helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'uploaders', '*.rb')].each { |file| require file }

# Configura la base de datos y modelos 
require APP_ROOT.join('config', 'database')

# Configure the API for any user
env_config = YAML.load_file(APP_ROOT.join('config', 'twitter.yaml'))

env_config.each do |key, value|
  ENV[key] = value
end

# consumer = OAuth::Consumer.new(
#   'consumer token', 
#   'consumer secret', 
#   {:site => 'http://twitter.com'}
# )

# CLIENT = Twitter::REST::Client.new do |config|
#   config.consumer_key        = "Q4VzuNM4HZu8SviRNLajZhf9W"
#   config.consumer_secret     = "YyBYQIkRLlOtsNrJ64H8d0eLdHGNgpGL0oVVng3tqkJIgCmd7E"
#   config.access_token        = "1576451786-610rENU65BEcN6bff26ZPyoXGyCzfZ0P9JSWoAV"
#   config.access_token_secret = "mm8almUVH8FDngeRnKPpcNOzxf0mGogJjv2DIdkSkzkmK"
# end
