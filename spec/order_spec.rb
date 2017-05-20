require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) {double(:menu, :list => {pizza: 5, carbonara: 6}) }
  describe '#order_hash'do
    it "order_hash is an hash" do
      expect(order.order_hash).to be_empty
    end
  end
  describe '#add_dish_to_order' do
    it "adds the dish to the order hash" do
      order.add_dish_to_order(:pizza)
      expect(order.order_hash).to eq pizza: 1
    end
  end
  describe '#change_quantity_of_dish' do
    it "amends the quanity" do
      order.add_dish_to_order(:pizza)
      order.change_quantity_of_dish(:pizza,2)
      expect(order.order_hash).to eq pizza: 2
    end
  end
  describe '#total of order' do
    it "gives the total of the whole order" do
      order.add_dish_to_order(:pizza)
      order.change_quantity_of_dish(:pizza,2)
      expect(order.total_of_order).to eq 10
    end
    it "gives the total of the whole order" do
      order.add_dish_to_order(:pizza)
      order.change_quantity_of_dish(:pizza,3)
      expect(order.total_of_order).to eq 15
    end
  end
  describe '#check_order_amount' do
    it 'checks the total amount of the order against an input' do
      order.add_dish_to_order(:pizza)
      order.change_quantity_of_dish(:pizza,3)
      expect(order.check_order_amount(15)).to eq true
    end
    it 'checks the total amount of the order against an input' do
      order.add_dish_to_order(:pizza)
      order.change_quantity_of_dish(:pizza,3)
      expect(order.check_order_amount(166)).to eq false
    end
  end
end
