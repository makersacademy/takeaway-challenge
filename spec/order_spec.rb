require 'order'

describe Order do
  let(:pie) { Dish.new("pie", 5) }
  let(:pizza) { Dish.new("pizza", 6) }
  let(:chips) { Dish.new("chips", 3) }
  let(:one_pie) { OrderItem.new(pie) }
  let(:one_pizza) { OrderItem.new(pizza) }
  let(:two_pizzas) { OrderItem.new(pizza, 2) }
  let(:three_chips) { OrderItem.new(chips, 3) }

  subject(:order) { described_class.new }

  context "empty orders" do
    it "correctly identifies an empty order" do
      expect(order.empty?).to be true
    end

    it "returns cost of zero" do
      expect(order.total_cost).to eq 0
    end
  end

  context "ordering a single item" do
    it "correctly identifies a non-empty order" do
      order_item_pie = OrderItem.new(pie)
      order.add_item(order_item_pie)
      expect(order.empty?).to be false
    end

    it "stores an item" do
      order_item_pie = OrderItem.new(pie)
      order.add_item(order_item_pie)
      expect(order.summary).to eq "1 x pie: £5, Order total: £5"
    end
  end

  context "ordering multiple items of single quantity" do
    before do
      order.add_item(one_pie)
      order.add_item(one_pizza)
    end

    it "stores all items" do
      expect(order.summary).to eq "1 x pie: £5, 1 x pizza: £6, Order total: £11"
    end

    it "calculates total cost of all items" do
      expect(order.total_cost).to eq 11
    end
  end

  context "ordering multiple items of different quantities" do
    before do
      order.add_item(one_pie)
      order.add_item(two_pizzas)
      order.add_item(three_chips)
    end

    it "stores all items" do

      expect(order.summary).to eq "1 x pie: £5, 2 x pizza: £12, 3 x chips: £9, Order total: £26"
    end

    it "calculates total cost of all items" do
      expect(order.total_cost).to eq 26
    end
  end
end
