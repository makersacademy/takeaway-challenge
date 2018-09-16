require 'order'

describe Price do
  context "#confirm" do
    let(:sms_double) { double :Delivery_SMS_Double, send_confirmation: true }
    let(:price) { described_class.new(sms_double) }
    it "checks whether there has been a miscalculation" do
      expect { price.confirm(16, [{ price: 0, quantity: 0 }]) }.to raise_error(PriceError)
    end
    it "sends an sms when order sucessful" do
      expect(price.confirm(0, [{ price: 0, quantity: 0 }])).to eq(true)
    end
  end
end
