require './lib/order.rb'

describe Order do

  subject(:order) { described_class.new }
  dish = Dish.new('7 Spanish Paella', 8)

  context 'Provided a menu' do

    describe '#display_menu' do
      it 'shows the menu' do
        expect(order.display_menu).to eq nil
      end
    end

  end

  context 'Provided an order' do

    describe '#add_to_order' do
      it 'generates an order with the desired dishes from our menu' do
        expect(order.add_to_order(2, dish)).not_to be_empty
      end
      it 'raises an error if the quantity is not an integer' do
        expect(order.add_to_order('string', dish)).to eq 'Quantity must be an integer.'
      end
      it 'raises an error if the dish does not belong to the class Dish' do
        expect(order.add_to_order(2, 'string')).to eq 'Dish must be in the menu.'
      end
    end

    describe '#calculate_payment' do
      it 'calculates the total sum to be paid' do
        order.add_to_order(2, dish)
        expect(order.calculate_payment).to eq 16
      end
    end

    describe '#available?' do
      it 'checks if the dish belongs to the class Dish' do
        expect(order.available?('string')).to eq false
      end
      it 'checks if the dish is in the menu' do
        expect(order.available?(Dish.new('gazpacho', 8))).to eq false
      end
      it 'checks if the dish has the right price' do
        expect(order.available?(Dish.new('7 Spanish Paella', 5))).to eq false
      end
      it 'checks if the dish on the menu' do
        expect(order.available?(dish)).to eq true
      end
    end

  end

end
