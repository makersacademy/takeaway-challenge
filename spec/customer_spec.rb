require 'customer'
require 'restaurant'

describe Customer do

  let (:restaurant) { Restaurant.new }

  context 'Show all dishes available' do
    it { is_expected.to respond_to(:see_all_dishes).with(1).argument }
  end

  context 'Select a dish' do
    it { is_expected.to respond_to(:select).with(2).argument }
    it { is_expected.to respond_to(:order) }

    xit '' do
      # trying to place an order using doubles
      food = double(:food)
      price = double(:price)
      restaurant.dishes.store(food, price)
      subject.select(food, restaurant)
      expect(subject.order).to eq(:food, :price)
    end
  end
end