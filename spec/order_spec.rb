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

  it 'knows the total cost' do
    expect(order.total).to eq 0
  end

  describe '#add' do
    context 'order is empty' do
      it 'adds a dish to the order list' do
        expect(order.add(dish)).to eq [dish]
      end
      it 'updates the total' do
        order.add(dish)
        expect(order.total).to eq dish.cost
      end
    end
    context 'when order has one dish' do
      it 'appends a second dish' do
        order.add(dish)
        expect(order.add(dish2)).to eq [dish, dish2]
      end
    end
  end

  describe '#check_total' do
    context 'when no dishes added' do
      it 'prints a message' do
        expect(STDOUT).to receive(:puts).with("Nothing in the order!")
        expect(order.check_total)
      end
    end
    context 'when total is correct' do
      before do
        order.add(dish)
        order.add(dish)
        order.add(dish2)
        order.add(dish3)
      end
      it 'prints a message' do
        expect(STDOUT).to receive(:puts).with("Order total confirmed correct")
        expect(order.check_total)
      end
    end
    context 'when total is incorrect' do
      before do
        order.add(dish)
        order.add(dish)
        order.add(dish2)
        order.add(dish3)
      end
      it 'prints a message' do
        allow(order).to receive(:total).and_return(0)
        expect(STDOUT).to receive(:puts).with("Order total incorrect! Please close the app and start again.")
        expect(order.check_total)
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
        expect(STDOUT).to receive(:puts).with('Total:                               💎  5')
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
          '1  x  Fried Egg and Rice             💎  5',
          'Total:                               💎 28'
        ]
        messages.each { |message| expect(STDOUT).to receive(:puts).with(message) }
        expect(order.print_order)
      end
    end
  end
end
