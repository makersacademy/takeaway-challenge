require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { Menu.new }

  context 'by default' do
    it 'has an empty array' do
      expect(order.basket).to be_empty
    end
  end

  describe '#select_dish' do
    it 'takes a dish number and quantity as arguments' do
      expect(order).to respond_to(:select_dish).with(2).arguments
    end

    it 'stores dish and total in basket' do
      order.select_dish(1, 2)
      expect(order.basket).to include({ :dish => "Egg fried rice", :total => 6 })
    end
  end

  describe '#basket_summary' do
    it 'displays basket' do
      order.select_dish(1, 2)
      expect { order.basket_summary }.to output("Egg fried rice, £6\n").to_stdout
    end
  end

  describe '#total' do
    it 'sums totals in basket' do
      order.select_dish(1, 2)
      order.select_dish(2, 1)
      expect(order.total).to eq 12
    end
  end

  describe '#checkout' do
    let(:textprovider) { TextProvider.new }
    let(:client) { double :client }

    before do
      order.select_dish(1, 2)
    end

    it 'raises error if passed incorrect amount' do
      expect { order.checkout(5, textprovider) }.to raise_error "Amount not correct"
    end

    it 'can send a text confirming order placed' do
      time_now = Time.parse('12:00')
      Time.stub(:now).and_return(time_now)
      message = 'Thank you! Your order was placed and will be delivered before 13:00'
      twilio_message_body = { from: ENV['TWILIO_NUMBER'], to: ENV['NUMBER'], body: message }
      allow(client).to receive_message_chain(:messages, :create).with(twilio_message_body)
      expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return(client)
      order.checkout(6, textprovider)
    end
  end
end
