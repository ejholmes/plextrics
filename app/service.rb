class Service
  def log(events)
    events.each do |event|
      if event.has_key? :value
        gauge(event[:metric], event[:value])
      else
        gauge(event[:metric])
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
