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

  describe '#initialize' do
    it 'takes a dish list as an argument and display it' do
      expect(menu.list).to eq dish_list
    end

    it 'creates an empty selection' do
      expect(menu.selection).to be_empty
    end
  end

  describe '#select_item' do
    it 'allows user to select items from a menu' do
      menu.select_item('lamb rogan josh')
      menu.select_item('bombay aloo')
      menu.select_item('plain naan')
      menu.select_item('lamb rogan josh')
      expect(menu.selection).to eq [['lamb rogan josh', 6.50], ['bombay aloo', 3.25], ['plain naan', 2.50], ['lamb rogan josh', 6.50]]
    end
  end





end
