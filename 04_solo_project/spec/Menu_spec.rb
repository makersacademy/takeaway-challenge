require 'Menu'

# test terminal io here

describe Menu do
  context 'when initialised' do
    it 'creates an instance of Menu' do
      burger_restaurant = Menu.new(Kernel)
      expect(burger_restaurant).to be_an_instance_of(Menu)
    end
  end

  describe '#menu' do
    it 'returns the value of the instance variable @menu' do
      burger_restaurant = Menu.new(Kernel)
      expected = [
        { name: 'burger', price: 4.50, quantity: 10 },
        { name: 'hot dog', price: 3.00, quantity: 10 },
        { name: 'CocaCola', price: 1.00, quantity: 5 },
        { name: 'chips', price: 2.00, quantity: 1 }
      ]
      expect(burger_restaurant.menu).to eq(expected)
    end

    context 'when all quantities > 0' do
      it 'putses all of the items in the menu' do
        fake_terminal = double(:terminal)
        expect(fake_terminal).to receive(:puts).with('Items in stock:')
        expect(fake_terminal).to receive(:puts).with('1. burger - £4.50')
        expect(fake_terminal).to receive(:puts).with('2. hot dog - £3.00')
        expect(fake_terminal).to receive(:puts).with('3. CocaCola - £1.00')
        expect(fake_terminal).to receive(:puts).with('4. chips - £2.00')

        burger_restaurant = Menu.new(fake_terminal)
        burger_restaurant.list_available
      end
    end

    context 'when some quantities == 0' do
      it 'putses only the available items' do
        fake_terminal = double(:terminal)
        fake_menu = double(:menu, menu: [{ name: 'burger', price: 4.50, quantity: 5}, { name: 'hot dog', price: 3.00, quantity: 0}, { name: 'chips', price: 2.00, quantity: 0 }])

        expect(fake_menu).to receive(:select).and_return([{ name: 'burger', price: 4.50, quantity: 5 }])
        expect(fake_terminal).to receive(:puts).with('Items in stock:')
        expect(fake_terminal).to receive(:puts).with('1. burger - £4.50')

        burger_restaurant = Menu.new(fake_terminal, fake_menu)
        burger_restaurant.list_available
      end
    end

    describe '#includes_item' do
      it 'returns true when menu includes the item' do 
        burger_restaurant = double(:menu, includes_item: true)
        expect( burger_restaurant.includes_item('burger') ).to eq(true)
      end

      it 'returns false when menu doesnt include the item' do 
        burger_restaurant = double(:menu, includes_item: false) 
        expect( burger_restaurant.includes_item('random') ).to eq(false)
      end
    end

    describe '#item_out_of_stock' do 
      it 'returns true if item is out of stock' do 
        burger_restaurant = double(:menu, item_out_of_stock: true) 
        expect( burger_restaurant.item_out_of_stock('chips') ).to eq(true)
      end

      it 'returns false if item is in stock' do 
        burger_restaurant = double(:menu, item_out_of_stock: false) 
        expect( burger_restaurant.item_out_of_stock('chips') ).to eq(false)
      end
    end

    describe '#price_of_item' do 
      it 'returns the price of an item' do 
        burger_restaurant = double(:menu, price_of_item: 4.5) 
        expect(burger_restaurant.price_of_item('burger') ).to eq(4.5)
      end
    end

    describe '#stock_of_item_decreases' do 
      it 'decreases the stock number by 4' do 
        burger_restaurant = Menu.new 
        my_order = double(:order)
        expect(burger_restaurant.menu[0][:quantity]).to eq(10)
        burger_restaurant.stock_of_item_decreases('burger', 4)
        expect(burger_restaurant.menu[0][:quantity]).to eq(6)
      end
      it 'fails if you order more than in stock' do 
        burger_restaurant = Menu.new 
        my_order = double(:order)
        expect{ burger_restaurant.stock_of_item_decreases('burger', 100) }.to raise_error('Not enough stock to fulfil order, please choose a lower amount')
      end
    end
  end
end
