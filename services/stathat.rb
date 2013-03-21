class Service::Stathat < Service
  attr_reader :ezkey

  def initialize(params)
    super
    @ezkey = params[:ezkey]
  end

  def count(metric)
  end

  def gauge(metric, value)
  end
end
