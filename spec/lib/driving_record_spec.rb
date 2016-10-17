require 'spec_helper'

describe DrivingRecord do
  let(:collector) { @collector = [] }
  let(:driver) { Driver.new('Noah') }
  let(:driving_record) { DrivingRecord.new('Noah', 80, 40) }
  let(:record) { 'Noah: 80 miles @ 40 mph' }

  describe '#driver' do
    it 'returns the correct driver' do
      expect(driving_record.driver).to eql 'Noah'
    end
  end

  describe '#distance' do
    it 'returns the correct distance' do
      expect(driving_record.distance).to eql 80
    end
  end

  describe '#average_speed' do
    it 'returns the correct average_speed' do
      expect(driving_record.average_speed).to eql 40
    end
  end

  describe '#initialize' do
    it 'pushes new instance of Driver into @collection' do
      expect(collector).to receive(:push).with(driving_record)
      collector.push(driving_record)
    end
  end

  describe '.all' do
    it 'includes all created Trip objects' do
      expect(DrivingRecord.all).to include(driving_record)
    end
  end

  describe '.formatted_record' do
    it 'responds to method and formats the record into a string' do
      expect(described_class.formatted_record(driving_record)).to eql record
    end
  end
end
