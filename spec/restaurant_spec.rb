require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new("Busaba Eathai", "Chelsea", menu: menu, notifier: notifier) }

  let(:menu) { double(:menu, list: [{ name: "Green Curry", description: "Chicken", price: 10 }]) }
  let(:order) { instance_double("Order", order_id: "44ZH38") }
  let(:notifier) { instance_double("Notifier", send_message: nil) }

  it { is_expected.to respond_to(:menu) }
  it { is_expected.to respond_to(:create_customer_order) }
  it { is_expected.to respond_to(:add_items_to_order).with(3).arguments }
  it { is_expected.to respond_to(:finalize_customer_order).with(1).argument }
  it { is_expected.to respond_to(:accept_customer_order).with(1).argument }
  it { is_expected.to respond_to(:order_list) }

  describe '#create_customer_order' do
    it 'creates a new customer order' do
      result = restaurant.create_customer_order
      expect(restaurant.orders).to eq result
    end
  end

end
