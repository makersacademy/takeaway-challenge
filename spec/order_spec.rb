require 'order'

describe Order do
  subject(:order) {described_class.new}
  let(:example_dish) {:example_dish}

  context 'basket' do

    it 'is empty to begin with' do
      expect(order.basket).to be_empty
    end

    it 'allows the customer add a dish from the menu' do
      order.add_to_basket(example_dish)
      expect(order.basket).to eq [example_dish]
    end

  end
end
