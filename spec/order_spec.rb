require 'order'

describe Order do
  let(:dish) { double("Dish", cost: 5, name: 'Copius Mushroom Skewers') }
  let(:dish2) { double("Dish2", cost: 4, name: 'Vegetable Omlette') }
  let(:dish3) { double("Dish3",cost: 5, name: 'Fried Egg and Rice') }

  subject(:order) {described_class.new(ENV['CUSTOMER_MOBILE_NUMBER'])}

  it 'knows the customers mobile number' do
    expect(order.mobile_number).to eq ENV['CUSTOMER_MOBILE_NUMBER']
  end

  it 'contains a list of dishes' do
    expect(order.dishes).to eq []
  end

  it 'includes DishListPrinter' do
    expect(order).to respond_to(:print_list)
  end

  describe '#add' do
    it 'adds a dish to the order list' do
      expect(order.add(dish)).to eq [dish]
    end
    it 'appends a second dish' do
      order.add(dish)
      expect(order.add(dish2)).to eq [dish, dish2]
    end
  end

  describe '#remove' do
    context 'when order is empty' do
      it 'raises an error' do
        expect{ order.remove(dish) }.to raise_error("Error: can't remove, dish not in order")
      end
    end
    context 'when order contains dish' do
      before do
        order.add(dish)
      end
      it 'removes the dish' do
        expect(order.remove(dish)).to eq []
      end
      context 'given dish isnt in the list' do
        it 'raises an error' do
          expect{ order.remove(dish2) }.to raise_error("Error: can't remove, dish not in order")
          expect(order.dishes).to eq [dish]
        end
      end
    end
  end

  describe '#print_order' do
    context 'when order contains a dish' do
      before do
        order.add(dish)
      end
      it 'prints the quantity, dish and price' do
        expect(STDOUT).to receive(:puts).with("1  x  Copius Mushroom Skewers        💎  5")
        expect(order.print_order)
      end
    end

    context 'when order contains many dishes' do
      before do
        3.times { order.add(dish) }
        2.times { order.add(dish2) }
        order.add(dish3)
      end
      it 'prints the quantity of each unique dish' do
        messages = [
          '3  x  Copius Mushroom Skewers        💎  5',
          '2  x  Vegetable Omlette              💎  4',
          '1  x  Fried Egg and Rice             💎  5'
        ]
        messages.each { |message| expect(STDOUT).to receive(:puts).with(message) }
        expect(order.print_order)
      end
    end
  end
end
