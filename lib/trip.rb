# Trip Class
class Trip
  class << self
    attr_reader :collector
  end

  @collector = []

  attr_reader :driver, :distance, :duration

  def initialize(driver, distance, duration)
    @driver = driver
    @distance = distance
    @duration = duration
    return unless (distance / duration).between?(5, 100)
    self.class.collector.push(self)
  end

  def self.all
    @collector
  end
end
