require 'order'

describe Order do

  subject(:order) { Order.new(restaurant_dbl, 1) }
  let(:restaurant_dbl) { double('restaurant', find_dish: dish_dbl) }
  let(:dish_dbl) { double('dish') }

  it 'takes a restaurant and an id as an argument' do
    expect(Order).to respond_to(:new).with(2).arguments
  end

  it 'stores the given restaurant' do
    expect(order.restaurant).to eq(restaurant_dbl)
  end

  it 'initialises with a status of open' do
    expect(order.status).to eq('open')
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
  end

end