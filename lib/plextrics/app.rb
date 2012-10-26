require 'sinatra/base'

module Plextrics
  class App < Sinatra::Base
    get '/' do
      'ok'
    end

    post '/:service' do
      service = "Plextrics::Service::#{params[:service].capitalize}".constantize.new(params)
      payload = Payload.parse(request.env['rack.input'].read)
    end
  end
end
