module Plextrics
  class Service
    autoload :Stathat, 'plextrics/services/stathat'

    def initialize(params)
      @params = params
    end

    def count(metric)
      raise 'Not implemented'
    end

    def gauge(metric, value)
      raise 'Not implemented'
    end
  end
end
