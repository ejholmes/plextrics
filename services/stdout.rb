class Service::Stdout < Service
  attr_reader :ezkey

  def initialize(params)
    super
  end

  def count(metric)
    puts "Log: #{metric}"
  end

  def gauge(metric, value)
    puts "Log: #{metric}, #{value}"
  end
end
