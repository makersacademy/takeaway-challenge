require 'customer'
require 'restaurant'

describe Customer do

  let (:restaurant) { Restaurant.new }

  context 'Show all dishes available' do
    it { is_expected.to respond_to(:see_all_dishes).with(1).argument }
  end

  context 'Select a dish' do
    it { is_expected.to respond_to(:select).with(3).argument }
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

  context 'Show current order' do
    it { is_expected.to respond_to(:current_order) }
    it { is_expected.to respond_to(:totals) }
    it { is_expected.to respond_to(:total_cost) }

    it 'and display total cost' do
      subject.select("Rice", 1, restaurant)
      subject.select("Naan", 1, restaurant)
      expect(subject.total_cost).to eq 3.50
    end

    it 'and display totals' do
      subject.select("Rice", 1, restaurant)
      subject.select("Naan", 1, restaurant)
      expect(subject.totals).to eq 'Total, 2 items at £3.5'
    end

    it 'with no cost, when nothing has been ordered' do
      expect(subject.total_cost).to eq 0
    end
  end

end