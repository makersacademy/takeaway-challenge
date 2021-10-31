require 'order'

describe Order do
  before do
    subject.add_item(dish_double_one.name, dish_double_one.amount)
    subject.add_item(dish_double_two.name)
    subject.add_item(dish_double_three.name)
  end

  let(:dish_double_one) { double(:dish, name: "Egg fried rice", amount: 2) }
  let(:dish_double_two) { double(:dish, name: "Beef chow mein", amount: 1) }
  let(:dish_double_three) { double(:dish, name: "Char siu pork", amount: 1) }
  let(:expected_order) { double(:order, output: ["1x Egg fried rice ordered (£2)", "2x Beef chow mein ordered (£7.0)"]) }

  describe '#add_item' do
    it 'should take 2 arguments - item and amount and add to orders array' do
      expect(subject.order).to eq(["2x Egg fried rice ordered (£4)", "1x Beef chow mein ordered (£3.5)", "1x Char siu pork ordered (£3)"])
    end
  end

  describe '#calculate_total' do
    it 'should add prices to total' do
      expect(subject.total).to eq(10.5)
    end
  end

  describe '#show_order_summary' do
    it 'should return order summary (amount of item with price) and total price' do
      expect(subject.show_order_summary).to eq("2x Egg fried rice ordered (£4), 1x Beef chow mein ordered (£3.5), 1x Char siu pork ordered (£3)\nTotal: £10.5")
    end
  end
end
