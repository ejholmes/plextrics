require 'spec_helper'
require 'rack/test'

describe Plextrics::App do
  include Rack::Test::Methods

  def app
    Plextrics::App
  end

  subject { last_response }

  describe 'GET /' do
    before do
      get '/'
    end

    its(:body) { should eq 'ok' }
    its(:status) { should eq 200 }
  end

  describe 'POST /' do
    before do
      post "/#{service}"
    end

    subject { last_response }

    context 'with stathat' do
      let(:service) { 'stathat' }

      its(:status) { should eq 200 }
    end
  end
end
