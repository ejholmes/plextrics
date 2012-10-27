require 'simplecov'
SimpleCov.start

require 'test/unit'
require 'webmock'

WebMock.disable_net_connect!

require 'plextrics'

class Plextrics::Service::TestCase < Test::Unit::TestCase
  include WebMock

  def service(klass, params)
    service = klass.new(params)
  end

  def payload
  end
end
