require 'send_sms'
require 'order'

describe SendSMS do
  let(:confirmation) { Order.new(menu.new) { include SendSMS } }
  let(:menu) { double(:menu, new: items) }
  let(:items) { [{ "Margherita" => 8 }, { "Roasted Vegetable" => 9 }, { "Chorizo" => 12 }] }

  describe '#time' do
    it 'tells me the time that my order is due to be delivered' do
      time = Time.new + 3600
      expect(confirmation.time).to eq time.strftime("%k:%M")
    end
  end
end
