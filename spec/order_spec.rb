describe Order do
  subject(:order) { Order.new }
  # add a double?
  # let(:takeaway) { double :takeaway, menu_list: nil }
  
  describe '#initialize' do
    it 'returns a menu list' do
      expect(order.menu).to eq(Takeaway.new.menu_list)
    end

    it 'returns an empty order list object' do
      expect(order.order_list).to eq([])
    end
  end

  describe 'make_order' do
    it 'adds selected menu items to the order list' do
      allow($stdin).to receive(:gets).and_return("Cake")
      selection = $stdin.gets
      order.add_item(selection)
      expect(order.order_list).to eq(["Cake"])
    end

    it 'does not add items that are not on the menu' do
      allow($stdin).to receive(:gets).and_return("Banana")
      selection = $stdin.gets
      order.add_item(selection)
      expect(order.order_list).to eq([])
    end
  end
  
  describe 'add_item' do
    it 'does not add non-menu items to the order list' do
      order.add_item("Apple")
      expect(order.order_list).to eq([])
    end

    it 'adds menu items to the order list' do
      order.add_item("Dumplings")
      expect(order.order_list).to eq(["Dumplings"])
    end
  end

  describe 'verify' do
    it 'tells wether the order total matches the sum of dishes' do
      order.instance_variable_set(:@order_list, ["Cake"])
      order.instance_variable_set(:@order_total, 4)
      expect(order.verify).to eq("Your order total matches the sum of dishes")
    end
  
    it 'tells wether the order total does not match the sum of dishes' do
      order.instance_variable_set(:@order_list, ["Cake"])
      order.instance_variable_set(:@order_total, 99)
      expect(order.verify).to eq("Your order total does not match the sum of dishes")
      #raise error message instead here?
    end
  end

  describe '#order_summary' do
    it '' do
    end
  end

  describe '#confirm' do
    it '' do
    end
  end

  describe '#send_confirmation' do
    it '' do
    end
  end
end
