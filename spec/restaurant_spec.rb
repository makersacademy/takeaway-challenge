require 'restaurant'

describe Restaurant do

  subject(:restaurant) { described_class.new("KFC", "Chingford Road") }
  let(:menu) { Menu.new }

  it { is_expected.to respond_to(:create_customer_order) }
  it { is_expected.to respond_to(:accept_customer_order).with(1).argument }

  before do
    restaurant.menu.create_dish("Chicken Burguer", "Spicy!", 8)
    restaurant.create_customer_order("XPTO")
  end

  describe '#create_customer_order' do
    it 'creates a new customer order' do
      result = restaurant.create_customer_order("XPTO")
      expect(restaurant.orders).to eq result
    end
  end

end
