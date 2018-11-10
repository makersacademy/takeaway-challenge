require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double() }

  context '#select_dish' do
    it 'stores selected dishes and quantities' do
      order.select_dish("Chicken Curry", 2)
      expect(order.dishes).to include({ :name => "Chicken Curry", :quantity => 2 })
    end

    it 'raises an error when the dish is not available' do
      message = "Can't select: dish not available"
      expect { order.select_dish("Fish & Chips", 1) }.to raise_error message
    end

    it 'calculates correct total cost of the order' do
      order.select_dish("Chicken Curry", 1)
      order.select_dish("Lamb Curry", 1)
      expect(order.total_cost).to eq 13.50
    end
  end
end
