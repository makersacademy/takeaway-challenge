require 'invoice'

describe Invoice do
  let(:dish) { double("dish") }

  it { is_expected.to be_instance_of Invoice }

  it { is_expected.to respond_to(:send_text) }

  it "calculates total" do
    order = [dish, dish]
    allow(dish).to receive(:[]).with(:quantity) { 2 }
    allow(dish).to receive(:[]).with(:price_per_item) { 3 }
    subject.calculate(order)
    expect(subject.total).to eq 12
  end

  describe '#send_text' do
    it "sends text via Twilio" do

    end
  end
end
