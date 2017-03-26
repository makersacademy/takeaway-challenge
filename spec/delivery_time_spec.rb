require './lib/delivery_time.rb'

describe DeliveryTime do

  let(:delivery_time) {described_class.new}
  let(:time_now) {Time.now}
  let(:expected_time) {(Time.now) + DeliveryTime::DELIVERY_TIME}

  describe '#calculate' do

    it 'should calculate the delivery time of the order' do
      expect(delivery_time.calculate).to eq(expected_time.strftime("%H:%M"))
    end
  end

end
