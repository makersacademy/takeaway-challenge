require 'order'

describe Order do

  let(:order) { described_class.new }
  let(:dish) { "Battered cod" }
  let(:price) { 3.99 }

  describe '#add_item' do
    it "adds an item from the menu to the basket" do
      order.add_item(dish, 3)
      expect(order.basket).to include(dish)
    end

    it "adds numerous items to the basket" do
      order.add_item(dish, 3)
      expect(order.basket[dish]).to eq(3)
    end

  end

  describe '#basket_value' do
    it "shows the value of items in the basket" do
      order.add_item(dish, 3)
      expect(order.basket_value).to eq(price * 3)
    end
  end

  describe '#view_basket' do
    it "shows all items in the basket" do
      order.add_item(dish, 3)
      expect(order.view_basket).to include(dish)
      expect(order.view_basket[dish]).to eq(3)
    end
  end
end
