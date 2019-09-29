require 'order'

describe Order do
  let(:dish) { double("Dish", cost: 5, name: 'Copius Mushroom Skewers') }
  let(:dish2) { double("Dish2", cost: 4, name: 'Vegetable Omlette') }
  let(:dish3) { double("Dish3", cost: 5, name: 'Fried Egg and Rice') }

  subject(:order) { described_class.new(ENV['CUSTOMER_MOBILE_NUMBER']) }

  it 'knows the customers mobile number' do
    expect(order.mobile_number).to eq ENV['CUSTOMER_MOBILE_NUMBER']
  end

  it 'contains a list of dishes' do
    expect(order.order).to eq []
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
      it 'returns empty' do
        expect(order.check_total).to eq(:empty)
      end
    end

    context 'when total is correct' do
      before do
        order.add(dish)
        order.add(dish)
        order.add(dish2)
        order.add(dish3)
      end
      it 'returns correct' do
        expect(order.check_total).to eq(:correct)
      end
    end

    context 'when total is incorrect' do
      before do
        order.add(dish)
        order.add(dish)
        order.add(dish2)
        order.add(dish3)
      end
      it 'returns incorrect' do
        allow(order).to receive(:total).and_return(0)
        expect(order.check_total).to eq(:incorrect)
      end
    end
  end
end
