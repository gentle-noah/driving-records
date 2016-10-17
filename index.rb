require 'time'

Dir.glob('./lib/**/*.rb').each { |f| require f }

data = (file = ARGV.first) ? File.open(file) : STDIN.read.split("\n")

data.each_line do |commands|
  inputs       = commands.split
  record_type  = inputs.shift.downcase
  record_owner = inputs.shift

  start    = record_type == 'trip' ? Time.parse(inputs.shift) : nil
  stop     = record_type == 'trip' ? Time.parse(inputs.shift) : nil
  distance = record_type == 'trip' ? inputs.shift.to_f        : nil
  duration = record_type == 'trip' ? (stop - start) / 3600    : nil

  case record_type
  when 'trip'
    Trip.new(record_owner, distance, duration)
  when 'driver'
    Driver.new(record_owner)
  else
    puts 'Invalid data entry. Please check data for errors.'
    exit
  end
end

puts DrivingRecord.summary
