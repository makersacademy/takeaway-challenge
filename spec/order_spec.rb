require 'order'

describe Order do

  subject(:order) { described_class.new }

  describe '#add_dish' do

    before(:each) do
      order.add_dish(1, "Hedgeree")
    end

    it 'adds the dish to the basket' do
      expect(order.basket).to(have_key("Hedgeree"))
    end

    it 'adds correct number of dishes to basket' do
      order.add_dish(1, "Hedgeree")
      expect(order.basket["Hedgeree"]).to eq 2
    end

    it 'takes optional argument to add multiple dished' do
      order.add_dish(2, "Hedgeree")
      expect(order.basket["Hedgeree"]).to eq 3
    end

  end

end
