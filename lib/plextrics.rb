require 'active_support/inflector'

require 'plextrics/version'
require 'plextrics/app'
require 'plextrics/service'
require 'plextrics/payload'

module Plextrics
  def self.app
    App.new
  end
end
