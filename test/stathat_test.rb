require 'test_helper'

class StathatTest < Plextrics::Service::TestCase
  def test_count
    svc = service(ezkey: 'foo@bar.com')

    stub_request(:get, 'http://api.stathat.com/ez?count=1&ezkey=foo@bar.com&stat=foo.bar')

    svc.count('foo.bar')
  end 
  
  def test_value
    svc = service(ezkey: 'foo@bar.com')

    stub_request(:get, 'http://api.stathat.com/ez?ezkey=foo@bar.com&stat=foo.bar&value=12')

    svc.gauge('foo.bar', 12)
  end

  def service(*args)
    super ::Plextrics::Service::Stathat, *args
  end
end
