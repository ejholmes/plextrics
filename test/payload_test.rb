require 'test_helper'

class PayloadTest < Test::Unit::TestCase
  def test_parse
    events = Plextrics::Payload.unpack(payload)
    assert_equal [
      { :app => 'foo', metric: 'bar' },
      { :app => 'bar', metric: 'foo.bar', value: '10'}
    ], events
  end

  def payload
    <<-PAYLOAD
55 <174>1 2012-07-22T00:06:26-00:00 app="foo" metric="bar"
70 <174>1 2012-07-22T00:06:26-00:00 app="bar" metric="foo.bar" value="10"
    PAYLOAD
  end
end
