require 'order'

describe Order do

  subject(:order) { described_class.new }

  describe '#add_dish' do

    before(:each) do
      order.add_dish("Hedgeree")
    end

    it 'adds the dish to the basket' do
      expect(order.basket).to(have_key("Hedgeree"))
    end

    it 'adds correct number of dishes to basket' do
      order.add_dish("Hedgeree")
      expect(order.basket["Hedgeree"]).to eq 2
    end

  end

end
