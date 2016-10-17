# DrivingRecord Class
class DrivingRecord
  class << self
    attr_reader :collector
  end

  @collector = []

  attr_reader :driver, :distance, :average_speed

  def initialize(driver, distance = 0, average_speed = 0)
    @driver = driver
    @distance = distance
    @average_speed = average_speed
    self.class.collector.push(self)
  end

  def self.all
    @collector
  end

  def self.formatted_record(record)
    "#{record.driver}: #{record.distance} miles" +
      (!record.average_speed.zero? ? " @ #{record.average_speed} mph" : '')
  end

  def self.summary
    Driver.all.each(&:generate_driving_record)

    all.uniq.sort_by(&:distance).reverse.each do |record|
      p formatted_record(record)
    end; nil # Added nil here to stop the echo of objects in terminal output
  end
end
