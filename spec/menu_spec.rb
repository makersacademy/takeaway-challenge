require 'menu'

describe Menu do

  let(:dish_list) { dish_list = {
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
  }

  subject(:menu) { described_class.new(dish_list) }

  it 'is expected to take a list as an argument and display it' do
    expect(menu.list).to eq dish_list
  end

end
