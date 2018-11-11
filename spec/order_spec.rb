require 'order'

describe Order do

  describe '#initialize' do
    it 'accepts a basket as an argument' do
      selection = [["chicken korma", 5.7], ["king prawn dhansak", 7.7], ["garlic naan", 2.75]]
      menu = double(:menu, selection: selection)
      order = Order.new(menu.selection)
      expect(order.basket).to eq selection
    end

    it 'sets the order total at 0 by default' do
      menu = double(:menu)
      order = Order.new(menu)
      expect(order.total).to eq Order::DEFAULT_TOTAL
    end
  end

  describe '#show_order' do
    xit 'shows the user the items, quantities and total price of the order' do
      dish_list = {
        'chicken korma' => 5.70,
        'chicken bhuna' => 6.70,
        'lamb rogan josh' => 6.50,
        'lamb madras' => 5.80,
        'king prawn dhansak' => 7.70,
        'plain rice' => 1.90,
        'pilau rice' => 2.00,
        'bombay aloo' => 3.25,
        'tarka daal' => 3.25,
        'plain naan' => 2.50,
        'garlic naan' => 2.75,
        'peshwari naan' => 3.00
      }
      menu = double(:menu, list: dish_list)
      order = Order.new(menu)
      order.add('chicken korma')
      order.add('bombay aloo')
      order.add('peshwari naan')
      order.add('chicken korma')
      expect(order.show_order).to eq "chicken korma 2 bombay aloo 1 peshwari naan 1 total: 17.65"
    end
  end

  describe '#clear_basket' do
    xit 'clears the basket' do
      dish_list = {
        'chicken korma' => 5.70,
        'chicken bhuna' => 6.70,
        'lamb rogan josh' => 6.50,
        'lamb madras' => 5.80,
        'king prawn dhansak' => 7.70,
        'plain rice' => 1.90,
        'pilau rice' => 2.00,
        'bombay aloo' => 3.25,
        'tarka daal' => 3.25,
        'plain naan' => 2.50,
        'garlic naan' => 2.75,
        'peshwari naan' => 3.00
      }
      menu = double(:menu, list: dish_list)
      order = Order.new(menu)
      order.add('chicken korma')
      order.add('bombay aloo')
      order.add('peshwari naan')
      order.add('chicken korma')
      order.show_order
      order.empty_basket
      expect(order.basket).to be_empty
    end

    xit 'clears the quantities' do
      dish_list = {
        'chicken korma' => 5.70,
        'chicken bhuna' => 6.70,
        'lamb rogan josh' => 6.50,
        'lamb madras' => 5.80,
        'king prawn dhansak' => 7.70,
        'plain rice' => 1.90,
        'pilau rice' => 2.00,
        'bombay aloo' => 3.25,
        'tarka daal' => 3.25,
        'plain naan' => 2.50,
        'garlic naan' => 2.75,
        'peshwari naan' => 3.00
      }
      menu = double(:menu, list: dish_list)
      order = Order.new(menu)
      order.add('chicken korma')
      order.add('bombay aloo')
      order.add('peshwari naan')
      order.add('chicken korma')
      order.show_order
      order.empty_basket
      expect(order.quantities).to be_empty
    end

    xit 'resets the total' do
      dish_list = {
        'chicken korma' => 5.70,
        'chicken bhuna' => 6.70,
        'lamb rogan josh' => 6.50,
        'lamb madras' => 5.80,
        'king prawn dhansak' => 7.70,
        'plain rice' => 1.90,
        'pilau rice' => 2.00,
        'bombay aloo' => 3.25,
        'tarka daal' => 3.25,
        'plain naan' => 2.50,
        'garlic naan' => 2.75,
        'peshwari naan' => 3.00
      }
      menu = double(:menu, list: dish_list)
      order = Order.new(menu)
      order.add('chicken korma')
      order.add('bombay aloo')
      order.add('peshwari naan')
      order.add('chicken korma')
      order.show_order
      order.empty_basket
      expect(order.total).to eq Order::DEFAULT_TOTAL
    end
  end

  describe '#confirm' do
    xit 'raises and error if the total is not correct' do
      dish_list = {
        'chicken korma' => 5.70,
        'chicken bhuna' => 6.70,
        'lamb rogan josh' => 6.50,
        'lamb madras' => 5.80,
        'king prawn dhansak' => 7.70,
        'plain rice' => 1.90,
        'pilau rice' => 2.00,
        'bombay aloo' => 3.25,
        'tarka daal' => 3.25,
        'plain naan' => 2.50,
        'garlic naan' => 2.75,
        'peshwari naan' => 3.00
      }
      menu = double(:menu, list: dish_list)
      order = Order.new(menu)
      order.add('chicken korma')
      order.add('bombay aloo')
      order.add('peshwari naan')
      order.add('chicken korma')
      order.show_order
      expect { order.confirm }.to raise_error "Total incorrect!"
    end
  end
end
