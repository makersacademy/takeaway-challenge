require './lib/order.rb'

describe Order do

  subject(:order) { described_class.new }
  dish = Dish.new('Spanish Paella', 8)

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
        expect(order.available?(Dish.new('Spanish Paella', 5))).to eq false
      end
      it 'checks if the dish on the menu' do
        expect(order.available?(dish)).to eq true
      end
    end

    describe '#show_bill' do
      it 'shows the dishes ordered and the total to be paid' do
        order.add_to_order(2, dish)
        expect(order.show_bill).to eq nil
      end
      it 'raises an error if nothing was ordered' do
        expect(order.show_bill).to eq 'You did not order anything'
      end
    end

    describe '#payment_wrong?' do
      it 'checks that the payment matches the total' do
        order.add_to_order(2, dish)
        order.stub(:gets).and_return("16")
        expect(order.payment_wrong?).to be false
      end
      it 'checks that the payment does not match the total' do
        order.add_to_order(2, dish)
        order.stub(:gets).and_return("17")
        expect(order.payment_wrong?).to be true
      end
    end

    describe '#finish_order' do
      it 'shows the delivery time' do
        order.add_to_order(2, dish)
        order.stub(:gets).and_return("16")
        expect(order.finish_order).to eq nil
      end
      it 'raises an error when the payment is wrong' do
        order.stub(:gets).and_return("17")
        expect { order.finish_order } .to raise_error('Incorrect payment')
      end
    end

  end

end
