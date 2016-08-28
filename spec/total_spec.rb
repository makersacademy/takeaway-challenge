require 'total'


describe Total do

  describe '#calculate_total' do
    it 'calculates the total' do
      order = Order.new
      order.add("Burger", 2)
      order.add("Fries", 2)
      total = Total.new(order)
      expect(total.calculate).to eq 14
    end
  end

  describe '#show_total' do
    it 'prints the total' do
      order = Order.new
      order.add("Burger", 2)
      order.add("Fries", 2)
      total = Total.new(order)
      expect(total.show).to eq "Total amount: £14"
    end
  end
end
