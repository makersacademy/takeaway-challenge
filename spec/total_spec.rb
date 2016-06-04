describe Total do
subject(:total) {described_class.new}

  describe '#calculate_total' do
    it 'calculates the total' do
      order = Order.new
      order.add("pork", 7)
      order.add("chicken", 6)
      menu = Menu.new
      expect(total.calculate_total(order.order_made, menu.menu_card)).to eq 39
    end
  end

  describe '#show_total' do
    it 'prints the total' do
      order = Order.new
      order.add("pork", 7)
      order.add("chicken", 6)
      menu = Menu.new
      total.calculate_total(order.order_made, menu.menu_card)
      expect(total.show_total).to eq "Total amount: 39"
    end
  end
end
