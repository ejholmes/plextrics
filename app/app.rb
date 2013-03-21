require 'service'
require 'payload'

class App
  def self.app
    @app ||= Rack::Builder.new {
      run API
    }
  end
end
