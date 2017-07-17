require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:order_string) { "Margherita x3 = £12\nPepperoni x2 = £10\nTotal = £22" }

  context 'add an item with quantity to basket' do
    before do
      order.add("Margherita", 3)
      order.add("Pepperoni", 2)
    end
    it '#size should reflect the number of dishes in basket' do
      expect(order.size).to eq 2
    end
    it 'should return the order as a string' do
      expect(order.to_s).to eq(order_string)
    end
  end

end
