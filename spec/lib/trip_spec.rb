require 'spec_helper'

describe Trip do
  let(:collector) { @collector = [] }
  let(:trip) { Trip.new('Noah', 40, 1.0) }

  describe '#driver' do
    it 'returns the correct driver' do
      expect(trip.driver).to eql 'Noah'
    end
  end

  describe '#distance' do
    it 'returns the correct distance' do
      expect(trip.distance).to eql 40
    end
  end

  describe '#duration' do
    it 'returns the correct duration' do
      expect(trip.duration).to eql 1.0
    end
  end

  describe '#initialize' do
    it 'pushes new instance of Driver into @collection' do
      expect(collector).to receive(:push).with(trip)
      collector.push(trip)
    end
  end

  describe '.all' do
    it 'includes all created Trip objects' do
      expect(Trip.all).to include(trip)
    end
  end
end
