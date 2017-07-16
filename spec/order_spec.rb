require 'order'

describe Order do

  subject(:order) { described_class.new [{ dish: "Fries", quantity: 2, price: 10 }, { dish: "Pizza", quantity: 1, price: 6 }] }

  describe '#initialize' do
    it 'order isnt empty upon initialization' do
      expect(subject.current_order.count).to eq 2
    end
  end

  describe '#print_order' do
    it 'prints final order' do
      expect(subject.print_order).to eq "Summary of your order: Fries 2x, Pizza 1x, total price £16"
    end
  end

  describe '#total_price_calculation' do
    it 'calculates the total price of the order' do
      subject.total_price_calculation
      expect(subject.total_price).to eq 16
    end
  end
end
