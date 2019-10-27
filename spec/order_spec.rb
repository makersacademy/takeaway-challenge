require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double :menu }
  let(:textprovider) { TextProvider.new }
  let(:client) { double :client }

  context 'by default' do
    it 'nothing is in the basket' do
      expect(order.total).to eq(0)
    end
  end

  context 'ordering' do
    before do
      allow(menu).to receive(:dishes).and_return([{ dish: "Egg fried rice", price: 3 }])
      order.select_dish(1, 2)
    end

    describe '#select_dish' do
      it 'stores dish and total in basket' do
        expect(order.basket_summary).to include({ :dish => "Egg fried rice", :total => 6 })
      end
    end

    describe '#basket_summary' do
      it 'displays basket' do
        expect { order.basket_summary }.to output("Egg fried rice, £6\n").to_stdout
      end
    end

    describe '#total' do
      it 'sums totals in basket' do
        expect(order.total).to eq 6
      end
    end

    describe '#checkout' do
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
end
