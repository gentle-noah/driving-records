require 'spec_helper'

describe Driver do
  let(:collector) { @collector = [] }
  let(:driver) { Driver.new('Noah') }
  let(:driving_record) { DrivingRecord.new('Noah', 40, 40) }
  let(:trip) { Trip.new('Noah', 40, 1.0) }
  let(:trips) { [trip, trip.dup] }

  describe '#driver' do
    it 'returns the correct driver' do
      expect(driver.driver).to eql 'Noah'
    end
  end

  describe '#initialize' do
    it 'pushes new instance of Driver into @collection' do
      expect(collector).to receive(:push).with(driver)
      collector.push(driver)
    end
  end

  describe '.all' do
    it 'includes all created Driver objects' do
      expect(described_class.all.map(&:driver)).to include(driver.driver)
    end
  end

  describe '#trips' do
    it 'returns an array of all Trip objects related to the Driver' do
      driver.trips << trips
      expect(driver.trips).to include(trip)
    end
  end

  describe '#generate_driving_record' do
    it 'returns correct distance for DrivingRecord instance' do
      expect(driver.generate_driving_record.distance)
        .to eql driving_record.distance
    end

    it 'returns correct duration for DrivingRecord instance' do
      expect(driver.generate_driving_record.average_speed)
        .to eql driving_record.average_speed
    end

    it 'returns correct driver for DrivingRecord instance' do
      expect(driver.generate_driving_record.driver).to eql driving_record.driver
    end

    context 'driver has trips' do
      it 'sums the value of distances' do
        expect(trips.map(&:distance).inject(:+)).to eql 80
      end

      it 'sums the value of durations' do
        expect(trips.map(&:duration).inject(:+)).to eql 2.0
      end

      it 'calculates the rounded average speed' do
        distance = trips.map(&:distance).inject(:+)
        duration = trips.map(&:duration).inject(:+)
        average_speed = (distance / duration).round
        expect(average_speed).to eql 40
      end
    end

    it 'creates a new instance of DrivingRecord' do
      expect(driving_record).to be_an_instance_of(DrivingRecord)
    end
  end
end
