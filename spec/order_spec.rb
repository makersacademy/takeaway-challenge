require 'order'

describe Order do

  it 'allows user to select dishes from a menu' do
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
    expect(order.basket).to eq selection = {'chicken korma'=>5.70, 'bombay aloo'=>3.25, 'peshwari naan'=>3.00}
  end

end
