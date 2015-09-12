require 'takeaway'

describe Takeaway do

  it 'should have a list of dishes available' do
    expect(subject).to respond_to(:menu)
  end

  it 'sends an SMS message' do
    expect(subject).to respond_to(:send_message)
  end

  describe '#calculate_delivery_time' do

    it 'should add an hour to the current time' do
      subject.calculate_delivery_time(time = Time.now)
      hour = time.hour + 1
      minute = time.min
      time_1hour = hour.to_s + ":" + minute.to_s
      expect(subject.calculate_delivery_time).to eql(time_1hour)
    end

  end

  describe '#menu' do

    it 'should show a hash of items with prices as values' do
      expect(subject).to respond_to(:menu)
    end

  end



end
