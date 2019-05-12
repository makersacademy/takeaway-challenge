require 'takeaway_restaurant'

describe TakeawayRestaurant do
  let(:burrito) { double("Burrito", :price => 7.50) }
  let(:pizza) { double("Pizza", :price => 11.00) }
  let(:message_service) { double(:message_service) }
  let(:subject) { TakeawayRestaurant.new([burrito, pizza], message_service) }

  it 'has a menu' do
    expect(subject.menu).to eq([burrito, pizza])
  end

  describe '#order' do
    it 'accepts the orders and the expected total' do
      expect(subject).to respond_to(:order).with(2).arguments
    end

    it 'raises an error if expected and actual total differ' do
      expect {
        subject.order([
        { :dish => burrito, :portion => 2 },
        { :dish => pizza, :portion => 1 }
        ], burrito.price * 2) \
      }.to raise_error("Total is not correct")
    end

    it 'can send the correct confirmation message' do
      time_now = Time.now
      delivery_time_str = (time_now + 3600).strftime("%H:%M")
      allow(Time).to receive(:now).and_return(time_now)
      allow(message_service).to receive(:send_message)

      subject.order([
        { :dish => burrito, :portion => 2 },
        { :dish => pizza, :portion => 1 }
        ], burrito.price * 2 + pizza.price)

      expect(message_service).to have_received(:send_message).with\
      "Thank you! Your order was placed and will be delivered before" + \
      delivery_time_str
    end
  end
end
