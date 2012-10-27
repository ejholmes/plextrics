require 'sinatra/base'

module Plextrics
  class App < Sinatra::Base
    get '/' do
      'ok'
    end

    post '/:service' do
      events = Payload.parse(request.env['rack.input'].read)
      service = "Plextrics::Service::#{params[:service].capitalize}".constantize.new(params)
      Service.log(events)
    end
  end
end
