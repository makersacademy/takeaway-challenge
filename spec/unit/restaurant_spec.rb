require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new }

  describe '#read_menu' do
    it 'returns a menu' do
      menu = { 'spring_rolls' => 1.99, 'prawn_toast' => 1.99,
         'egg_fried_rice' => 2.50, 'kung_po_chicken' => 4.50 }
      expect(restaurant.read_menu).to eq menu
    end
  end

  describe '#order' do
    it 'stores a dish' do
      expect(restaurant.order('spring_rolls')).to eq 1
    end

    it 'stores the number of dishes as an argument' do
      expect(restaurant.order('spring_rolls', 3)).to eq 3
    end

    it 'can change order' do
      basket = { 'spring_rolls' => 1 }
      restaurant.order('spring_rolls', 3)
      expect { restaurant.order('spring_rolls') }.to change { restaurant.basket }. to basket
    end
  end
end
