$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'api'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))

require File.expand_path('../boot', __FILE__)

Bundler.require :default, ENV['RACK_ENV']
require 'uri'
require 'api'
require 'app'
Dir[File.expand_path('../..', __FILE__) + 'services/**/**.rb'].each { |f| require f }
