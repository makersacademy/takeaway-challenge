require 'takeaway'

describe Takeaway do

  it 'sends an SMS message' do
    expect(subject).to respond_to(:send_message)
  end

  describe '#calculate_delivery_time' do

    it 'should add an hour to the current time' do
      subject.calculate_delivery_time(time = Time.now)
      hour = time.hour + 1
      minute = time.min
      time_in_1hour = hour.to_s + ":" + minute.to_s
      expect(subject.calculate_delivery_time).to eql(time_in_1hour)
    end

  end

end
