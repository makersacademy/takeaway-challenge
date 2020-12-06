require 'invoice'

describe Invoice do
  let(:dish) { double("dish") }
  let(:twilio) { double("twilio_info") }
  let(:client) { double("client") }
  subject { described_class.new(twilio) }

  it { is_expected.to be_instance_of Invoice }

  it { is_expected.to respond_to(:send_text) }

  it "calculates total" do
    order = [dish, dish]
    allow(dish).to receive(:[]).with(:quantity) { 2 }
    allow(dish).to receive(:[]).with(:price_per_item) { 3 }
    expect(subject.calculate(order)).to eq "12.00"
  end

  describe '#send_text' do
    it "sends text via Twilio" do
      allow(twilio).to receive(:[])
      allow(client).to receive_messages(:messages => client, :create => true)
      expect(subject.send_text(client)).to eq "sms sent"
    end
  end
end
