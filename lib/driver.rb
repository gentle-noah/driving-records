# Driver Class
class Driver
  class << self
    attr_reader :collector
  end

  @collector = []

  attr_reader :driver

  def initialize(driver)
    @driver = driver
    return if self.class.collector.map(&:driver).include? driver
    self.class.collector.push(self)
  end

  def self.all
    @collector
  end

  def trips
    Trip.all.select { |t| t.driver == driver }
  end

  def generate_driving_record
    distance = trips.empty? ? 0 : trips.map(&:distance).inject(:+)
    duration = trips.empty? ? 0 : trips.map(&:duration).inject(:+)
    average_speed = trips.empty? ? 0 : (distance / duration).round

    DrivingRecord.new(driver, distance.round, average_speed)
  end
end
