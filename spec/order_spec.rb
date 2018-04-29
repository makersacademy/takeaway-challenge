require 'order'
require 'twilio-ruby'

describe Order do
  subject { Order.new(meal) }
  let(:meal) { double :meal, add_dish: nil, basket: [{ name: selection, price: 2 }], sum_of_basket: 4, menu: menu }
  let(:menu) { double :menu, list: nil }
  let(:selection) { double :selection }

  before { allow(Twilio::REST::Client).to receive(:new).and_return(twilio_client) }
  let(:twilio_client) { double :twilio_client, messages: messages }
  let(:messages) { double :messages, create: nil }

  describe '#choose', :choose do
    it 'Adds a dish to the order' do
      subject.choose(selection, 1)
      expect(subject.current_order.length).to eq(1)
    end
  end

  describe '#price', :price do
    it 'Returns the current total price of the meal' do
      2.times { subject.choose(selection, 2) }
      expect(subject.price).to eq 4
    end
  end

  describe '#checkout', :check do
    it 'Creates a new message using the twilio API' do
      subject.choose(selection, 2)
      subject.checkout(4)
      expect(Twilio::REST::Client).to have_received(:new)
    end

    it 'Returns a message upon checkout' do
      subject.choose(selection, 2)
      expect(subject.checkout(4)).to eq "Checkout complete!"
    end

    it 'Raises an error if payment is not equal to cost' do
      subject.choose(selection, 2)
      expect { subject.checkout(2) }.to raise_error "This is not the correct amount, check the current price!"
    end
  end
end
