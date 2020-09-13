require 'order'

describe Order do

  subject(:order) { Order.new(restaurant_dbl) }
  let(:restaurant_dbl) { double('restaurant', find_dish: dish_dbl) }
  let(:dish_dbl) { double('dish', price: 8.99) }

  it 'takes a restaurant as an argument' do
    expect(Order).to respond_to(:new).with(1).arguments
  end

  it 'stores the given restaurant' do
    expect(order.restaurant).to eq(restaurant_dbl)
  end

  it 'initialises with a total equal to 0' do
    expect(order.total).to eq(0)
  end

  it 'initialises with an empty basket' do
    expect(order.basket).to eq []
  end

  describe '#add(dish_name, qty)' do
    it 'takes a dish name and quantity as arguments' do
      expect(order).to respond_to(:add).with(2).arguments
    end

    it 'sends a find_dish message to the restaurant with the dish_name' do
      expect(restaurant_dbl).to receive(:find_dish).once.with('Pepperoni pizza')

      order.add('Pepperoni pizza', 1)
    end

    it 'adds the dish and selected quantity to the basket' do
      expect{ order.add('Pepperoni pizza', 1) }.to change{ order.basket.count }.by(1)
      expect(order.basket[0]).to eq({dish: dish_dbl, qty: 1})
    end

    it 'updates the order total' do
      expect{ order.add('Pepperoni pizza', 2) }.to change{ order.total }.by(17.98)
    end

    it 'returns a confirmation with the updated total' do
      expect(order.add('Pepperoni pizza', 2)).to eq('Dish added! Your order total is £17.98')
    end
  end
end
