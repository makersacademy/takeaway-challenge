require 'FinishMyOrder'
require 'Menu'
require 'Order'
require 'Text'

describe 'integration' do 
  describe 'looking at the menu' do 
    context 'when all items are in stock' do 
      it 'putses the available items' do 
        burger_restaurant = Menu.new
        expected = ['Items in stock:', '1. burger - £4.50', '2. hot dog - £3.00', '3. CocaCola - £1.00', '4. chips - £2.00'].join("\n") + "\n"
        expect{ burger_restaurant.list_available }.to output(expected).to_stdout
      end
    end

    context 'when some items out of stock' do 
      it 'putses the available items' do 
        burger_restaurant = Menu.new
        my_order = Order.new(burger_restaurant)
        my_order.add('chips', 1)
        expected = ['Items in stock:', '1. burger - £4.50', '2. hot dog - £3.00', '3. CocaCola - £1.00'].join("\n") + "\n"
        expect{ burger_restaurant.list_available }.to output(expected).to_stdout
      end
    end

    describe '#includes_item' do
      it 'returns true when menu includes the item' do 
        burger_restaurant = Menu.new 
        expect( burger_restaurant.includes_item('burger') ).to eq(true)
      end

      it 'returns false when menu doesnt include the item' do 
        burger_restaurant = Menu.new 
        expect( burger_restaurant.includes_item('random') ).to eq(false)
      end
    end

    describe '#item_out_of_stock' do 
      it 'returns true if item is out of stock' do 
        burger_restaurant = Menu.new 
        my_order = Order.new(burger_restaurant)
        my_order.add('chips', 1)
        expect( burger_restaurant.item_out_of_stock('chips') ).to eq(true)
      end

      it 'returns false if item is in stock' do 
        burger_restaurant = Menu.new 
        my_order = Order.new(burger_restaurant)
        expect( burger_restaurant.item_out_of_stock('chips') ).to eq(false)
      end
    end

    describe '#price_of_item' do 
      it 'returns the price of an item' do 
        burger_restaurant = Menu.new 
        expect(burger_restaurant.price_of_item('burger') ).to eq(4.5)
      end
    end

    describe '#stock_of_item_decreases' do 
      it 'decreases the stock number by 4' do 
        burger_restaurant = Menu.new 
        my_order = Order.new(burger_restaurant)
        expect(burger_restaurant.menu[0][:quantity]).to eq(10)
        my_order.add('burger', 4)
        expect(burger_restaurant.menu[0][:quantity]).to eq(6)
      end
      it 'fails if you order more than in stock' do 
        burger_restaurant = Menu.new 
        my_order = Order.new(burger_restaurant)
        expect{ burger_restaurant.stock_of_item_decreases('burger', 100) }.to raise_error('Not enough stock to fulfil order, please choose a lower amount')
      end
    end
  end
  describe 'ordering' do 
    it 'adds items and their prices to the order' do 
      burger_restaurant = Menu.new
      my_order = Order.new(burger_restaurant)
      my_order.add('burger', 2)
      my_order.add('chips', 1)
      expect(my_order.order).to eq([['burger', 9.0, 2],['chips', 2.0, 1]])
    end

    it 'fails when ordering an item not on the menu' do 
      burger_restaurant = Menu.new
      my_order = Order.new(burger_restaurant)
      expect{ my_order.add('random', 1) }.to raise_error('Item not on the menu')
    end

    it 'fails when adding an item that is out of stock' do 
      # as quantity of chips on menu is initialized as 1
      # you should be able to add 1 portion of chips to the
      # order with no issues, but then the quantity is now 0
      # so if you try to add another portion an error is raised
      burger_restaurant = Menu.new
      my_order = Order.new(burger_restaurant)
      expect{ my_order.add('chips', 1) }.not_to raise_error
      expect{ my_order.add('chips', 1) }.to raise_error('Item not in stock')
    end
  end

  describe 'receipt' do 
    it 'shows the prices of the ordered items and the grand total' do 
      burger_restaurant = Menu.new
      my_order = Order.new(burger_restaurant)
      my_order.add('burger', 1)
      my_order.add('chips', 1)
      finish_my_order = FinishMyOrder.new(my_order, Kernel)
      expected = ['What you ordered:', '1x burger - £4.50', '1x chips - £2.00', 'Grand Total: £6.50'].join("\n") + "\n"
      expect{ finish_my_order.receipt }.to output(expected).to_stdout
    end
  end

  describe 'finishing order' do 
    it 'fails if nothing was ordered' do 
      burger_restaurant = Menu.new
      my_order = Order.new(burger_restaurant)
      expect{ FinishMyOrder.new(my_order) }.to raise_error('Order empty')
    end

    # twilio tests to come
  end
end