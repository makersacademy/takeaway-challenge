require 'delivery_time'

describe DeliveryTime do
  let(:delivery_time1) { DeliveryTime.new("2019-09-01 18:51:42 +0100") }
  let(:delivery_time2) { DeliveryTime.new("2019-09-01 18:08:42 +0100") }

  context '#initialize' do
    it 'expects time to equal "2019-09-01 18:51:42 +0100"' do
      expect(delivery_time1.time).to eq "2019-09-01 18:51:42 +0100"
    end
  end

  context 'sets the time based on minute > 10' do
    before(:each) do
      allow(delivery_time1.time).to receive(:hour).and_return(18)
      allow(delivery_time1.time).to receive(:min).and_return(51)
    end

    it 'expects #set_hour to return the hour + 1' do

      expect(delivery_time1.set_hour).to eq delivery_time1.time.slice(11, 2).to_i + 1
    end
    it 'expects #set_minute to return the minute given if over 10' do

      expect(delivery_time1.set_minute).to eq delivery_time1.time.slice(14, 2).to_i
    end
    it 'expects #get_time  to return the time' do
      expect(delivery_time1.time_of_order).to eq "#{delivery_time1.set_hour}:#{delivery_time1.set_minute}"
    end

  end

  context 'sets the time based on minute < 10' do
    it 'expects #set_minute to return the minute given + 0 if under 10' do
      allow(delivery_time2.time).to receive(:min).and_return(8)

      expect(delivery_time2.set_minute).to eq delivery_time2.time.slice(14, 2)
    end
  end

end
