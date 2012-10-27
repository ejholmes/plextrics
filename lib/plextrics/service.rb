module Plextrics
  class Service
    autoload :Stathat, 'plextrics/services/stathat'

    def self.log(events, service)
      events.each do |event|
        if event.has_key? :value
          service.gauge(event[:metric], event[:value])
        else
          service.gauge(event[:metric])
        end
      end
    end

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
