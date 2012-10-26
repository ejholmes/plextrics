require 'stathat'

module Plextrics
  class Service::Stathat < Service
    def initialize(params)
      super
      @ezkey = params[:ezkey]
    end

    def count(metric, count=1)
      ::StatHat::API.ez_post_count(metric, @ezkey, count)
    end

    def gauge(metric, value)
      ::StatHat::API.ez_post_value(metric, @ezkey, value)
    end
  end
end
